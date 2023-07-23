using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace WebAPI.Mapper
{
    public class AccountMapper : Profile
    {
        public AccountMapper() 
        {
            CreateMap<Account, AccountDTO>()
                   .ForMember(
                       dest => dest.CustomerName,
                       opt => opt.MapFrom(src => src.Customer!.ContactName))
                   .ForMember(
                       dest => dest.EmployeeName,
                       opt => opt.MapFrom(src => src.Employee!.LastName));
            CreateMap<AccountDTO, Account>();
            CreateMap<AccountUpdateDTO, Account>().ReverseMap();
        }
    }
}
