using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace FastFoodAPI.Mapper
{
    public class CategoryMapper : Profile
    {
        public CategoryMapper()
        {
            CreateMap<Category, CategoryDTO>()
                .ForMember(dest => dest.CategoryId, opt => opt.MapFrom(o => o.CategoryId))
                .ForMember(dest => dest.CategoryName, opt => opt.MapFrom(o => o.CategoryName))
                .ReverseMap();
        }
    }
}
