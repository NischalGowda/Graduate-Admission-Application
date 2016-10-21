//package gapp.model.dao;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
//import org.testng.annotations.Test;
//
//@Test(groups = "DepartmentDaoTest")
//@ContextConfiguration(locations = "classpath:applicationContext.xml")
//public class DepartmentDaoTest extends AbstractTransactionalTestNGSpringContextTests {
//
//    @Autowired
//    DepartmentDao departmentDao;
//
//    @Test
//    public void getDepartment()
//    {
//    	assert departmentDao.getDepartment().size() == 2;
//    }
//    
//    @Test
//    public void getDepartment1()
//    {
//    	Integer deptId = departmentDao.getDepartment1("Accounting").getId();
//    	Integer pgmId = departmentDao.getProgram( deptId ).getId();
//    	assert departmentDao.getApplication(pgmId).getTerm().equalsIgnoreCase("Fall 2016");
//    }
//}
//
