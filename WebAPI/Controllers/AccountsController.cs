﻿using AutoMapper.Execution;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Repository;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using BusinessObject.DTO;
using Microsoft.Extensions.Configuration;
using BusinessObject.Models;
using WebAPI.Config;
using WebAPI.Configuration;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly IConfiguration configuration;
        private IAccountRepository repository;
        public static AccountInfoTokenDTO user = new();
        public AccountsController(IAccountRepository repo, IConfiguration configuration)
        {
            this.configuration = configuration;
            repository = repo;
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("signin")]
        public async Task<ActionResult<string>> Login(LoginDTO request)
        {
            if (request is null) return BadRequest();
            var account = await repository.Account(request);
            user.Account = account;
            if (user.Account.CustomerId != null)
            {
                user.Name = account.Customer.ContactName.ToString();
            }
            else
            {
                user.Name = account.Employee.FirstName.ToString() + " " + account.Employee.LastName.ToString();
            }

            user.AccessToken = JWTConfig.CreateToken(user, configuration);
            SetRefreshToken(JWTConfig.GenerateRefreshToken());
            return account is null ? NotFound() : Ok(user);
        }

        //GET: api/Accounts
        /*[Authorize(Policy = "EmpOnly")]*/
        [HttpGet]
        public async Task<IActionResult> GetAccounts(string? searchString)
        {
            try
            {
                return StatusCode(200, await repository.GetAccounts(searchString));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //GET: api/Accounts/id

        [HttpGet("{id}")]
        public async Task<IActionResult> GetAccountById(int id)
        {
            try
            {
                return StatusCode(200, await repository.GetAccountById(id));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //GET: api/Accounts/email

        [AllowAnonymous]
        [HttpPost("FindByEmail")]
        public async Task<IActionResult> GetAccountByEmail(string email)
        {
            try
            {
                return StatusCode(200, await repository.GetAccountByEmail(email));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //DELETE

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccount(int id)
        {
            try
            {
                await repository.DeleteAccount(id);
                return StatusCode(204, "Delete successfully!");
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //Reset Password
        [AllowAnonymous]
        [HttpPost("ResetPassword")]
        public async Task<IActionResult> Get(string? email)
        {
            try
            {
                var resetPassword = await repository.GetResetPassword(email);
                if (resetPassword == null) return NotFound();
                return StatusCode(200, MailConfiguration.SendRecoveryMail(email, resetPassword, configuration));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        private void SetRefreshToken(RefreshToken newRefreshToken)
        {
            user.RefreshToken = newRefreshToken.Token;
            user.TokenCreated = newRefreshToken.Created;
            user.TokenExpires = newRefreshToken.Expires;
        }
        [AllowAnonymous]
        [HttpPost]
        [Route("signup")]
        public async Task<IActionResult> Post(SignUpDTO req)
        {
            if (req is null) return BadRequest();
            var isSave = await repository.Save(req);
            if (isSave) return Ok(isSave);
            return Conflict();
        }

        [HttpPost]
        [Route("updateProfile")]
        public async Task<IActionResult> updateProfile(AccountUpdateDTO req)
        {
            if (req is null) return BadRequest();
            var isSave = await repository.Update(req);
            if (isSave) return Ok(isSave);
            return Conflict();
        }
        [HttpPost]
        [Route("refresh-token")]
        public ActionResult<AccountInfoTokenDTO> RefreshToken(AccountInfoTokenDTO u)
        {
            var refreshToken = u.RefreshToken;
            if (user.RefreshToken is null) return BadRequest();
            if (!user.RefreshToken!.Equals(refreshToken)) return Unauthorized("Invalid Refresh Token.");
            else if (user.TokenExpires < DateTime.Now) return Unauthorized("Token expired.");
            string token = JWTConfig.CreateToken(user, configuration);
            user.AccessToken = token;
            var newRefreshToken = JWTConfig.GenerateRefreshToken();
            SetRefreshToken(newRefreshToken);
            return Ok(user);
        }

        [HttpGet("GetInfoCustomerById/{id}")]
        public async Task<IActionResult> GetInfoCustomerById(string id)
        {
            try
            {
                return StatusCode(200, await repository.GetInfoCustomerById(id));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
