package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Ainfo;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.History;
import gapp.model.Role;
import gapp.model.User;
import gapp.model.UserInfo;
import gapp.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Role getRole(String name) {
		return entityManager
				.createQuery("from Role where name=:role_name", Role.class)
				.setParameter("role_name", name).getSingleResult();
	}

	@Override
	public User getUser(Integer role_id) {
		return entityManager.find(User.class, role_id);
	}

	@Override
	public List<Application> getApplication(Integer id) {
		return entityManager
				.createQuery("from Application where user_id=:id",
						Application.class).setParameter("id", id)
				.getResultList();
	}

	@Override
	public Application getApp(Integer id) {

		return entityManager.find(Application.class, id);
	}

	@Override
	public List<Degree> getDegree(Integer id) {

		return entityManager
				.createQuery("from Degree where app_id=:id", Degree.class)
				.setParameter("id", id).getResultList();
	}

	@Override
	public List<Ainfo> getAinfo(Integer id) {

		return entityManager
				.createQuery("from Ainfo where application_id=:id", Ainfo.class)
				.setParameter("id", id).getResultList();
	}

	@Override
	public List<UserInfo> getUinfo(Integer id) {

		return entityManager
				.createQuery("from UserInfo where id = :id", UserInfo.class)
				.setParameter("id", id).getResultList();
	}

//	@Override
//	public List<History> getHis(Integer id) {
//		
//		return entityManager
//				.createQuery("from History where application_id = :id", History.class)
//				.setParameter("id", id).getResultList();
//	}

}