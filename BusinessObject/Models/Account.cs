using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Account
    {
        public Account()
        {
            Orders = new HashSet<Order>();
            Shippers = new HashSet<Shipper>();
        }

        public int Id { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? Displayname { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public bool? IsAdmin { get; set; }
        public bool? IsCustomer { get; set; }
        public bool? IsShipper { get; set; }
        public bool? IsSaller { get; set; }
        public bool? Status { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Shipper> Shippers { get; set; }
    }
}
