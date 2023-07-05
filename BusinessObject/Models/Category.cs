using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Category
    {
        public Category()
        {
            Foods = new HashSet<Food>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;

        public virtual ICollection<Food> Foods { get; set; }
    }
}
