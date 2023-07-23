using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace WebAPI.Mapper
{
    public class ProductMapper : Profile
    {
        public ProductMapper() 
        {
            CreateMap<Product, ProductDTO>()
               .ForMember(
                   dest => dest.CategoryName,
                   opt => opt.MapFrom(src => src.Category.CategoryName))
               .ForMember(
                   dest => dest.CategoryGeneral,
                   opt => opt.MapFrom(src => src.Category.CategoryGeneral));
            CreateMap<ProductDTO, Product>();
            CreateMap<Product, ProductCreateUpdateDTO>().ReverseMap();
        }
    }
}
