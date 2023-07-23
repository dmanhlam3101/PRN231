using AutoMapper;
using BusinessObject.DTO;

namespace WebAPI.Mapper
{
    public class CategoryMapper : Profile
    {
        public CategoryMapper() 
        {
            CreateMap<CategoryMapper, CategoryDTO>().ReverseMap();
        }
    }
}
