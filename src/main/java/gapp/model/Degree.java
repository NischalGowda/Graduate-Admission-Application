package gapp.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="degree")
public class Degree implements Serializable{
	
	private static final long serialVersionUID =1L;
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String univ_name;
	private String time_period_attended;
	private String degree_earned;
	private String major;
	
	@ManyToOne
	private Application app;
	
	
	public Application getApp() {
		return app;
	}
	public void setApp(Application app) {
		this.app = app;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUniv_name() {
		return univ_name;
	}
	public void setUniv_name(String univ_name) {
		this.univ_name = univ_name;
	}
	public String getTime_period_attended() {
		return time_period_attended;
	}
	public void setTime_period_attended(String time_period_attended) {
		this.time_period_attended = time_period_attended;
	}
	public String getDegree_earned() {
		return degree_earned;
	}
	public void setDegree_earned(String degree_earned) {
		this.degree_earned = degree_earned;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
}