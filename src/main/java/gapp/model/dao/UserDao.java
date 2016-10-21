package gapp.model.dao;

import java.util.List;

import gapp.model.Ainfo;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.History;
import gapp.model.Program;
import gapp.model.Role;
import gapp.model.User;
import gapp.model.UserInfo;

public interface UserDao {

	// Login
	List<User> getUser(String email);
	
	// Registration
	User save(User user);

	
	// Department List (Edit)
	Department getDept(Integer id);

	List<Program> getProgram(Integer department_id);

	List<Ainfo> getInfo(Integer dept_id);
	
	// Add New
	Department addDept(Department department);

	Program addPgm(Program program);

	Ainfo addInfo(Ainfo ainfo);
	
	History addHistory(History history);

	// Set role type
	Role saveRole(Role role);
	
	//Delete
	public void delPgm(Integer id);
	
	public void delAinfo(Integer id);
	
	public void delDeg(Degree degree);
	public void delPrgm(Program program);
	public void delInfo(Ainfo ainfo);
	
	//Add New Application
	Application addApp(Application application);
	User getU(Integer id);
	
	//Add New Degree & UserInfo & program
	Degree addDegree(Degree degree);
	UserInfo addU(UserInfo userInfo);
	Program getPgm(Integer id);
	Ainfo getAf(Integer id);
	
	Application getApp(Integer id);
	UserInfo getUinfo(Integer id);
	Degree getDegree(Integer id);
	Department getDep(Department department);
	
//	History getH(Integer id);
}
