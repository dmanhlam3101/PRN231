using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Seller
    {
        public Seller()
        {
            Orders = new HashSet<Order>();
            Shippers = new HashSet<Shipper>();
        }

        public int SallerId { get; set; }
        public string? SallerName { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public double? ReceiveMoney { get; set; }
        public int? AccountId { get; set; }
        public bool? Status { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Shipper> Shippers { get; set; }
    }
}
