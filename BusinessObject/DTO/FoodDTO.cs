using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject.DTO
{
    public class FoodDTO
    {
        public FoodDTO() { }
        public int FoodId { get; set; }
        public string? FoodName { get; set; }
        public int? CategoryId { get; set; }
        public string? Image { get; set; }
        public int? Quantity { get; set; }
        public double? UnitPrice { get; set; }
        public string? Description { get; set; }
        public bool? Status { get; set; }
        public DateTime? DateCreated { get; set; }

    }
}
