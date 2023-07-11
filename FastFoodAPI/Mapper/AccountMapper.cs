using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace FastFoodAPI.Mapper
{
    public class AccountMapper : Profile
    {
        public AccountMapper() 
        {
            CreateMap<Account, AccountDTO>()
               .ForMember(dest => dest.Id, opt => opt.MapFrom(o => o.Id))
               .ForMember(dest => dest.Username, opt => opt.MapFrom(o => o.Username))
               .ForMember(dest => dest.Password, opt => opt.MapFrom(o => o.Password))
               .ForMember(dest => dest.Displayname, opt => opt.MapFrom(o => o.Displayname))
               .ForMember(dest => dest.Address, opt => opt.MapFrom(o => o.Address))
               .ForMember(dest => dest.Phone, opt => opt.MapFrom(o => o.Phone))
               .ForMember(dest => dest.IsAdmin, opt => opt.MapFrom(o => o.IsAdmin))
               .ForMember(dest => dest.IsCustomer, opt => opt.MapFrom(o => o.IsCustomer))
               .ForMember(dest => dest.IsShipper, opt => opt.MapFrom(o => o.IsShipper))
               .ForMember(dest => dest.IsSeller, opt => opt.MapFrom(o => o.IsSaller))
               .ForMember(dest => dest.Status, opt => opt.MapFrom(o => o.Status))
               .ReverseMap();
        }
    }
}
