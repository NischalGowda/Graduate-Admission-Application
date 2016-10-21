package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="application")
public class Application implements Serializable{
	
	private static final long serialVersionUID =1L;
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String term;
	
	private String status;
	
	@OneToMany(mappedBy="application")
	private List<History> history;
	
	@ManyToOne
	private User user;
	
	@ManyToOne
	private Program program;
	
	@OneToMany(mappedBy="application")
	private List<Ainfo> ainfo;
		
	@OneToMany(mappedBy="app")
	private List<Degree> degree;
	
	@OneToOne
	private Department dept;
	
	private String TOEFL;
	private String GRE;
	private String GPA;

	@ManyToOne
	private UserInfo info;
	
	private Date date;
	
	public List<Degree> getDegree() {
		return degree;
	}

	public void setDegree(List<Degree> degree) {
		this.degree = degree;
	}

	public String getTOEFL() {
		return TOEFL;
	}

	public void setTOEFL(String tOEFL) {
		TOEFL = tOEFL;
	}

	public String getGRE() {
		return GRE;
	}

	public void setGRE(String gRE) {
		GRE = gRE;
	}

	public String getGPA() {
		return GPA;
	}

	public void setGPA(String gPA) {
		GPA = gPA;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<History> getHistory() {
		return history;
	}

	public void setHistory(List<History> history) {
		this.history = history;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Program getProgram() {
		return program;
	}

	public void setProgram(Program program) {
		this.program = program;
	}

	public List<Ainfo> getAinfo() {
		return ainfo;
	}

	public void setAinfo(List<Ainfo> ainfo) {
		this.ainfo = ainfo;
	}

	public UserInfo getInfo() {
		return info;
	}

	public void setInfo(UserInfo info) {
		this.info = info;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}