using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Food
    {
        public int FoodId { get; set; }
        public string? FoodName { get; set; }
        public int? CategoryId { get; set; }
        public string? Image { get; set; }
        public int? Quantity { get; set; }
        public double? UnitPrice { get; set; }
        public string? Description { get; set; }
        public bool? Status { get; set; }
        public DateTime? DateCreated { get; set; }

        public virtual Category? Category { get; set; }
    }
}
