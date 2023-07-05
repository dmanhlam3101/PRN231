using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Shipper
    {
        public Shipper()
        {
            Orders = new HashSet<Order>();
        }

        public int ShipperId { get; set; }
        public int? SellerId { get; set; }
        public string? ShipperName { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public double? DeliveryMoney { get; set; }
        public int AccountId { get; set; }
        public bool? Status { get; set; }

        public virtual Account Account { get; set; } = null!;
        public virtual Seller? Seller { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
