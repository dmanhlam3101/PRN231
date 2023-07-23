using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace WebAPI.Mapper
{
    public class OrderMapper : Profile
    {
        public OrderMapper() 
        {
            CreateMap<Order, OrderDTO>()
                    .ForMember(
                        dest => dest.CustomerName,
                        opt => opt.MapFrom(src => src.Customer!.ContactName))
                    .ForMember(
                        dest => dest.EmployeeName,
                        opt => opt.MapFrom(src => src.Employee!.LastName));
            CreateMap<OrderDTO, Order>();
            CreateMap<Order, OrderDictionaryDTO>()
                .ForPath(dest => dest.emp!.LastName,
                opt => opt.MapFrom(src => src.Employee!.LastName))
                 .ForPath(dest => dest.emp!.DepartmentName,
                opt => opt.MapFrom(src => src.Employee!.Department!.DepartmentName))
                .ForPath(dest => dest.emp!.Title,
                opt => opt.MapFrom(src => src.Employee!.Title))
                .ForPath(dest => dest.cus!.ContactName,
                opt => opt.MapFrom(src => src.Customer!.ContactName))
                .ForPath(dest => dest.cus!.CompanyName,
                opt => opt.MapFrom(src => src.Customer!.CompanyName))
                .ForPath(dest => dest.cus!.ContactTitle,
                opt => opt.MapFrom(src => src.Customer!.ContactTitle))
                .ForPath(dest => dest.cus!.Address,
                opt => opt.MapFrom(src => src.Customer!.Address))
                .ForMember(dest => dest.OrderDetails,
                opt => opt.MapFrom(src => src.OrderDetails));

            CreateMap<Order, OrderCreateUpdateDTO>()
                .ForMember(dest => dest.OrderDetails,
                opt => opt.MapFrom(src => src.OrderDetails));
            CreateMap<OrderCreateUpdateDTO, Order>();
        }
    }
}
