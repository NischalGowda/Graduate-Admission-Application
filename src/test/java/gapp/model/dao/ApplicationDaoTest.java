//package gapp.model.dao;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
//import org.testng.annotations.Test;
//
//@Test(groups = "ApplicationDaoTest")
//@ContextConfiguration(locations = "classpath:applicationContext.xml")
//public class ApplicationDaoTest extends AbstractTransactionalTestNGSpringContextTests {
//
//    @Autowired
//    ApplicationDao applicationDao;
//
//    @Test
//    public void getApplication()
//    {
//    	Integer roleId = applicationDao.getRole("student1").getId();
//    	Integer userId = applicationDao.getUser( roleId ).getId();
//    	assert applicationDao.getApplication(userId).size() == 1;
//    }
//
//}