package gapp.model.dao;

import java.util.List;

import gapp.model.Ainfo;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.History;
import gapp.model.Role;
import gapp.model.User;
import gapp.model.UserInfo;

public interface ApplicationDao {
	
	Role getRole(String name);
	
	User getUser( Integer role_id );
	
	List<Application> getApplication(Integer user_id);
	
	Application getApp(Integer id);
	
	List<Degree> getDegree(Integer id);
	
	List<Ainfo> getAinfo(Integer id);
	
	List<UserInfo> getUinfo(Integer id);
	
//	List<History> getHis(Integer id);
}
