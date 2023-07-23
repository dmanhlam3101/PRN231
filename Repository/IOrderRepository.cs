﻿using BusinessObject.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public interface IOrderRepository
    {
        Task<List<OrderDTO>> GetOrders(DateTime? startDate, DateTime? endDate);
        Task<OrderDictionaryDTO> GetOrderById(int id);
        Task<List<OrderDictionaryDTO>> GetOrdersByCustomer(string customerId);
        Task<OrderCreateUpdateDTO> CreateOrder(OrderCreateUpdateDTO orderDTO);
        Task DeleteOrder(int id);
    }
}
