using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            Shippings = new HashSet<Shipping>();
        }

        public int Id { get; set; }
        public int? OrderId { get; set; }
        public string? NameFood { get; set; }
        public string? ImageFood { get; set; }
        public double? PriceFood { get; set; }
        public int? Quantity { get; set; }

        public virtual Order? Order { get; set; }
        public virtual ICollection<Shipping> Shippings { get; set; }
    }
}
