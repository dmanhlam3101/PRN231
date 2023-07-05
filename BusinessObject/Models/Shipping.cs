using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Shipping
    {
        public int Id { get; set; }
        public int? OrderId { get; set; }
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public double? TotalPrice { get; set; }
        public bool? Status { get; set; }

        public virtual OrderDetail? Order { get; set; }
        public virtual Order? OrderNavigation { get; set; }
    }
}
