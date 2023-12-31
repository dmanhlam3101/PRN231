﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject.DTO
{
    public class CategoryDTO
    {
        public int? CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public string? Description { get; set; }
        public bool IsActive { get; set; }
        public string? CategoryGeneral { get; set; }

        public string? CategoryDetails
        {
            get
            {
                return CategoryName + " - " + CategoryGeneral;
            }
        }
    }
}
