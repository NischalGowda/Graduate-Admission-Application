package gapp.model.dao.jpa;

import gapp.model.Ainfo;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.History;
import gapp.model.Program;
import gapp.model.Role;
import gapp.model.User;
import gapp.model.UserInfo;
import gapp.model.dao.UserDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	// Login
	@Override
	public List<User> getUser(String email) {
		return entityManager.createQuery("from User order by id", User.class)
				.getResultList();
	}

	// Registration
	@Transactional
	@Override
	public User save(User user) {
		return entityManager.merge(user);
	}

	// Department List
	@Override
	public Department getDept(Integer id) {

		return entityManager.find(Department.class, id);
	}

	@Override
	public List<Program> getProgram(Integer department_id) {

		return entityManager
				.createQuery(
						"from Program where department_id = :department_id order by id asc",
						Program.class)
				.setParameter("department_id", department_id).getResultList();
	}

	@Override
	public List<Ainfo> getInfo(Integer dept_id) {

		return entityManager
				.createQuery(
						"from Ainfo where dept_id= :dept_id order by id asc",
						Ainfo.class).setParameter("dept_id", dept_id)
				.getResultList();
	}

	// Add new
	@Transactional
	@Override
	public Department addDept(Department department) {

		return entityManager.merge(department);
	}

	@Transactional
	@Override
	public Program addPgm(Program program) {

		return entityManager.merge(program);

	}

	@Transactional
	@Override
	public Ainfo addInfo(Ainfo ainfo) {

		return entityManager.merge(ainfo);

	}

	// Set role type
	@Transactional
	@Override
	public Role saveRole(Role role) {

		return entityManager.merge(role);
	}

	@Override
	@Transactional
	public void delPgm(Integer id) {

		Program pgm = entityManager
				.createQuery("from Program where id = :id", Program.class)
				.setParameter("id", id).getSingleResult();
		entityManager.remove(pgm);
	}

	@Override
	@Transactional
	public void delAinfo(Integer id) {

		Ainfo a = entityManager
				.createQuery("from Ainfo where id = :id", Ainfo.class)
				.setParameter("id", id).getSingleResult();
		entityManager.remove(a);
	}

	@Override
	@Transactional
	public Application addApp(Application application) {

		return entityManager.merge(application);
	}

	@Override
	public User getU(Integer id) {

		return entityManager.find(User.class, id);
	}

	// Add New Degree & UserInfo
	@Transactional
	@Override
	public Degree addDegree(Degree degree) {

		return entityManager.merge(degree);
	}

	@Transactional
	@Override
	public UserInfo addU(UserInfo userInfo) {

		return entityManager.merge(userInfo);
	}

	@Override
	public Program getPgm(Integer id) {

		return entityManager.find(Program.class, id);
	}

	@Override
	public Application getApp(Integer id) {

		return entityManager.find(Application.class, id);
	}

	@Transactional
	@Override
	public Department getDep(Department department) {

		return entityManager.merge(department);
	}

	@Override
	public UserInfo getUinfo(Integer id) {

		return entityManager.find(UserInfo.class, id);
	}

	@Override
	public Degree getDegree(Integer id) {

		return entityManager.find(Degree.class, id);
	}

	@Transactional
	@Override
	public void delDeg(Degree degree) {

		entityManager.remove(degree);
	}

	@Transactional
	@Override
	public void delPrgm(Program program) {

		entityManager.remove(program);
	}

	@Transactional
	@Override
	public void delInfo(Ainfo ainfo) {

		entityManager.remove(ainfo);
	}

	@Override
	public Ainfo getAf(Integer id) {

		return entityManager.find(Ainfo.class, id);
	}

	@Transactional
	@Override
	public History addHistory(History history) {

		return entityManager.merge(history);
	}

//	@Override
//	public History getH(Integer id) {
//
//		return entityManager.find(History.class, id);
//	}

}
