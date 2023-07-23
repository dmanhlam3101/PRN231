using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;

namespace WebAPI.Mapper
{
    public class EmployeeMapper : Profile
    {
        public EmployeeMapper() 
        {
            CreateMap<Employee, EmployeeDTO>()
               .ForMember(
                   dest => dest.DepartmentName,
                   opt => opt.MapFrom(src => src.Department.DepartmentName));
            CreateMap<EmployeeDTO, Employee>();
            CreateMap<Employee, EmployeeCreateUpdateDTO>().ReverseMap();
        }
    }
}
