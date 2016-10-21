package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="department")
public class Department implements Serializable{

	private static final long serialVersionUID =1L;
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String dept_name;
	
	@OneToMany(mappedBy="department")
	private List<Program> program;
	
	@OneToMany(mappedBy="dept")
	private List<Ainfo> ainfo;

	@OneToMany(mappedBy="dept")
	private List<User> user;
	
	@OneToMany
	private List<Application> application;
	
	public List<User> getUser() {
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public List<Program> getProgram() {
		return program;
	}

	public void setProgram(List<Program> program) {
		this.program = program;
	}

	public List<Ainfo> getAinfo() {
		return ainfo;
	}

	public void setAinfo(List<Ainfo> ainfo) {
		this.ainfo = ainfo;
	}

	public List<Application> getApplication() {
		return application;
	}

	public void setApplication(List<Application> application) {
		this.application = application;
	}
}
