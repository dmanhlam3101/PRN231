using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace WebAPI.Mapper
{
    public class OrderDatailMapper : Profile
    {
        public OrderDatailMapper() 
        {
            CreateMap<OrderDetail, OrderDetailDTO>()
                    .ForMember(
                        dest => dest.ProductName,
                        opt => opt.MapFrom(src => src.Product!.ProductName))
                    .ForMember(
                        dest => dest.ProductPicture,
                        opt => opt.MapFrom(src => src.Product!.Picture));
            CreateMap<OrderDTO, Order>();
            CreateMap<OrderDetail, OrderDetailCreateUpdateDTO>().ReverseMap();
        }
    }
}
