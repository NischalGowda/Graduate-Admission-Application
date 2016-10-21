package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.Program;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Department> getDepartment()
    {
        return entityManager.createQuery( "from Department order by id", Department.class )
            .getResultList();
    }

	@Override
	public Department getDepartment1(String name) {
	
		return entityManager.createQuery( "from Department where dept_name = :dept_name", Department.class )
	            .setParameter("dept_name",name)
				.getSingleResult();
	}

	@Override
	public Program getProgram(Integer dept_id) {
		
		return entityManager.find( Program.class, dept_id );
	}

	@Override
	public Application getApplication(Integer pgm_id) {
		
		return entityManager.find( Application.class, pgm_id );
	}

	@Override
	public Department getName(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find( Department.class, id );
	}

//	@Override
//	public List<Department> getD(Integer id) {
//		// TODO Auto-generated method stub
//		return entityManager
//				.createQuery(
//						"from Department where application_id = :application_id order by id asc",
//						Department.class)
//				.setParameter("application_id", id).getResultList();
//	}

}