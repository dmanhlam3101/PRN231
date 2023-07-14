using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;
using DataAccess.DAO;
using Repository.IRepo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repo
{
    public class AccountRepository : IAccountRepository
    {
        private readonly IMapper _mapper;
        public AccountRepository(IMapper mapper)
        {
            _mapper = mapper;
        }

        public async Task<List<AccountDTO>> GetAccounts()
        {
            return _mapper.Map<List<AccountDTO>>(await AccountDAO.GetAccounts());
        }
        public async Task<AccountDTO> Login(string username, string password)
        {
            return _mapper.Map<AccountDTO>(await AccountDAO.Login(username,password));
        }
        public async Task<AccountDTO> GetAccountById(int id)
        {
            return _mapper.Map<AccountDTO>(await AccountDAO.GetAccountById(id));
        }
        public async Task<AccountDTO> CreateAccount(AccountDTO accountDTO)
        {
            var account = _mapper.Map<Account>(accountDTO);
            return _mapper.Map<AccountDTO>(await AccountDAO.CreateAccount(account));
        }

        public async Task<AccountDTO> UpdateAccount(AccountDTO accountDTO)
        {
            var account = _mapper.Map<Account>(accountDTO);
            return _mapper.Map<AccountDTO>(await AccountDAO.UpdateAccount(account));
        }

        public async Task DeleteAccount(int id)
        {
            await AccountDAO.DeleteAccount(id);
        }
    }
}
