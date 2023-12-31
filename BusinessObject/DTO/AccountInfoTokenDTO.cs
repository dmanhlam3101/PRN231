﻿using BusinessObject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject.DTO
{
    public class AccountInfoTokenDTO
    {
        public Account? Account { get; set; }

        public string? Name { get; set; }
        public string? AccessToken { get; set; }
        public string? RefreshToken { get; set; }
        public DateTime TokenCreated { get; set; }
        public DateTime TokenExpires { get; set; }
    }
}
