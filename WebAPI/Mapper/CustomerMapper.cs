using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace WebAPI.Mapper
{
    public class CustomerMapper : Profile
    {
        public CustomerMapper() 
        {
            CreateMap<Customer, CustomerDTO>().ReverseMap();
        }
    }
}
