package gapp.web.validator;

import gapp.model.User;
import gapp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

	@Autowired
	private UserDao userDao;

	@Override
	public boolean supports(Class<?> clazz) {

		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		User user = (User) target;
		String email = user.getEmail();
		
		if (!StringUtils.hasText(user.getEmail()))
			errors.rejectValue("email", "error.field1.empty");
		if (!StringUtils.hasText(user.getPassword()))
			errors.rejectValue("password", "error.field2.empty");
		if (!StringUtils.hasText(user.getLname()))
			errors.rejectValue("Lname", "error.field3.empty");
		if (!StringUtils.hasText(user.getFname()))
			errors.rejectValue("Fname", "error.field4.empty");
		
//		if (!StringUtils.hasText(user.getCIN()))
//			errors.rejectValue("CIN", "error.field5.empty");
//		if (!StringUtils.hasText(user.getPhone()))
//			errors.rejectValue("phone", "error.field6.empty");
//		if (!StringUtils.hasText(user.getGender()))
//			errors.rejectValue("gender", "error.field7.empty");
//		if (!StringUtils.hasText(user.getDOB()))
//			errors.rejectValue("DOB", "error.field8.empty");
//		if (!StringUtils.hasText(user.getCitizenship()))
//			errors.rejectValue("citizenship", "error.field9.empty");
		
//		if (!StringUtils.hasText(user.getTOEFL()))
//			errors.rejectValue("TOEFL", "error.toefl.empty");
//		if (!StringUtils.hasText(user.getGRE()))
//			errors.rejectValue("GRE", "error.gre.empty");
//		if (!StringUtils.hasText(user.getGPA()))
//			errors.rejectValue("GPA", "error.gpa.empty");
		
		
		
		for (User i : userDao.getUser(email))
			if ((user.getEmail().equalsIgnoreCase(i.getEmail()))) {
				errors.rejectValue("email", "error.field.empty");
			}

	}
}
