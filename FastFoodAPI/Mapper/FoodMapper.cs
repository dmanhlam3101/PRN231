using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace FastFoodAPI.Mapper
{
    public class FoodMapper : Profile
    {
        public FoodMapper()
        {
            CreateMap<Food, FoodDTO>()
                .ForMember(dest => dest.FoodId, opt => opt.MapFrom(o => o.FoodId))
                .ForMember(dest => dest.FoodName, opt => opt.MapFrom(o => o.FoodName))
                .ForMember(dest => dest.CategoryId, opt => opt.MapFrom(o => o.CategoryId))
                .ForMember(dest => dest.Image, opt => opt.MapFrom(o => o.Image))
                .ForMember(dest => dest.Quantity, opt => opt.MapFrom(o => o.Quantity))
                .ForMember(dest => dest.UnitPrice, opt => opt.MapFrom(o => o.UnitPrice))
                .ForMember(dest => dest.Description, opt => opt.MapFrom(o => o.Description))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(o => o.Status))
                .ForMember(dest => dest.DateCreated, opt => opt.MapFrom(o => o.DateCreated))
                .ReverseMap();
        }
    }
}
