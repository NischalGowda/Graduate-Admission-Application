package gapp.model.dao;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.Program;

import java.util.List;

public interface DepartmentDao {
	
	List<Department> getDepartment();
	
	Department getDepartment1(String name);
	
	Program getProgram(Integer dept_id);
	
	Application getApplication(Integer pgm_id);
	
	Department getName(Integer id);
	
//	List<Department> getD(Integer id);

}
