using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject.DTO
{
    public class AccountDTO
    {
        public AccountDTO() { }
        public int Id { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? Displayname { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public bool? IsAdmin { get; set; }
        public bool? IsCustomer { get; set; }
        public bool? IsShipper { get; set; }
        public bool? IsSeller { get; set; }
        public bool? Status { get; set; }
    }
}
