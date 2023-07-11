using BusinessObject.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.IRepo
{
    public interface IAccountRepository
    {
        Task<List<AccountDTO>> GetAccounts();
        Task<AccountDTO> GetAccountById(int id);
        Task<AccountDTO> CreateAccount(AccountDTO accountDTO);
        Task<AccountDTO> UpdateAccount(AccountDTO accountDTO);
        Task DeleteAccount(int id);
    }
}
