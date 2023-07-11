using BusinessObject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    public class AccountDAO
    {
        public static async Task<List<Account>> GetAccounts()
        {
            var listAccounts = new List<Account>();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    listAccounts = await context.Accounts.ToListAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listAccounts;
        }

        public static async Task<Account> GetAccountById(int id)
        {
            Account account = new Account();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    account = await context.Accounts.SingleOrDefaultAsync(x => x.Id == id);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return account;
        }

        public static async Task<Account> CreateAccount(Account account)
        {
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    await context.Accounts.AddAsync(account);
                    await context.SaveChangesAsync();

                    return await context.Accounts.SingleOrDefaultAsync(x => x.Id == account.Id);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static async Task<Account> UpdateAccount(Account account)
        {
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    context.Entry<Account>(account).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    await context.SaveChangesAsync();

                    return await context.Accounts.SingleOrDefaultAsync(x => x.Id == account.Id);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static async Task DeleteAccount(int id)
        {
            try
            {
                Account account = new Account();
                using (var context = new SWP_ProjectContext())
                {
                    account = await context.Accounts.SingleOrDefaultAsync(x => x.Id == id);
                    context.Entry<Account>(account).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    context.Accounts.Remove(account);
                    await context.SaveChangesAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
