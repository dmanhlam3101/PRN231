using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
            Shippings = new HashSet<Shipping>();
        }

        public int OrderId { get; set; }
        public int? AccountId { get; set; }
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public double? TotalPrice { get; set; }
        public int? SellerId { get; set; }
        public int? ShipperId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public bool? Status { get; set; }

        public virtual Account? Account { get; set; }
        public virtual Seller? Seller { get; set; }
        public virtual Shipper? Shipper { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<Shipping> Shippings { get; set; }
    }
}
