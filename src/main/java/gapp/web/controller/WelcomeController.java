package gapp.web.controller;

import gapp.model.Ainfo;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.History;
import gapp.model.Program;
import gapp.model.Role;
import gapp.model.User;
import gapp.model.UserInfo;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.UserDao;
import gapp.web.validator.UserValidator;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class WelcomeController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private DepartmentDao deptDao;

	@Autowired
	private ApplicationDao appDao;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private ServletContext context;

	// ************************** Welcome ********************************

	@RequestMapping({ "/index.html", "/home1.html" })
	public String index(ModelMap models) {

		models.put("role", "Nischal");
		return "home1";
	}

	// ************************** Registration ********************************

	@RequestMapping(value = "/register.html", method = RequestMethod.GET)
	public String register(ModelMap models) {

		models.put("user", new User());
		return "register";
	}

	@RequestMapping(value = "/register.html", method = RequestMethod.POST)
	public String add(@ModelAttribute User user, BindingResult bindingResult) {

		userValidator.validate(user, bindingResult);
		if (bindingResult.hasErrors())
			return "register";

		Role role = new Role();
		role.setName("student");
		role = userDao.saveRole(role);
		user.setRole(role);

		userDao.save(user);
		return "redirect:/home1.html";
	}

	// ************************** Login ********************************

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(ModelMap models) {

		models.put("log", new User());
		return "login";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, HttpServletRequest request,
			ModelMap models) {

		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		HttpSession session = request.getSession();

		List<User> userDetails = userDao.getUser(email);

		if (email.equalsIgnoreCase("admin@localhost.localdomain")
				&& pwd.equalsIgnoreCase("abcd")) {
			session.setAttribute("loginSession", email);
			return "redirect:admin.html";
		}

		if (email.equalsIgnoreCase("staff1@localhost.localdomain")
				|| email.equalsIgnoreCase("staff2@localhost.localdomain")) {
			if (pwd.equalsIgnoreCase("abcd")) {
				session.setAttribute("loginSession", email);
				return "redirect:staff.html";
			}
		}

		if (!email.equalsIgnoreCase("") && !pwd.equalsIgnoreCase("")) {
			for (User a : userDetails)
				if (a.getEmail().equalsIgnoreCase(email)
						&& a.getPassword().equalsIgnoreCase(pwd)) {
					session.setAttribute("loginSession", email);
					int id = a.getId();
					models.put("id", id);
					return "redirect:student.html";
				}
		}

		return "login";
	}

	// ************************** Logout ********************************

	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/home1.html";
	}

	// ************************** Student ********************************

	@RequestMapping("/student.html")
	public String student(ModelMap models, @RequestParam Integer id) {

		models.put("a", appDao.getApplication(id));
		models.put("q", id);
		return "student";
	}

	// ************************** app_list ********************************

	@RequestMapping("/app_list.html")
	public String app_list(ModelMap models, @RequestParam Integer aid) {

		models.put("a1", appDao.getApp(aid));
		Application a = appDao.getApp(aid);
		models.put("a2", appDao.getDegree(aid));
		models.put("a3", appDao.getAinfo(aid));
		models.put("a4", appDao.getUinfo(a.getInfo().getId()));
		return "app_list";
	}

	// ************************** file ********************************

	private File getFileDirectory(@RequestParam Integer uid,
			@RequestParam Integer aid) {

		String path = context.getRealPath("/WEB-INF/files");
		File file = new File(path + "/" + uid);

		if (!file.exists()) {
			file.mkdir();
			File file1 = new File(path + "/" + uid + "/" + aid);
			if (!file1.exists()) {
				file1.mkdir();
			}

		} else {
			File file2 = new File(path + "/" + uid + "/" + aid);
			if (!file2.exists()) {
				file2.mkdir();
			}
		}

		return new File(path + "/" + uid + "/" + aid);

	}

	// ************************** new_app ********************************

	@RequestMapping(value = "/new_app.html", method = RequestMethod.GET)
	public String application(ModelMap models, @RequestParam Integer id) {
		models.put("d", deptDao.getDepartment());
		models.put("a", appDao.getApp(id));
		return "new_app";
	}

	@RequestMapping(value = "/new_app.html", method = RequestMethod.POST)
	public String new_app(ModelMap models, @RequestParam Integer id,
			HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file)
			throws IllegalStateException, IOException {

		User user = userDao.getU(id);

		// New Basic Info
		String email = request.getParameter("email");
		String lastname = request.getParameter("lastname");
		String firstname = request.getParameter("firstname");
		String CIN = request.getParameter("CIN");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String DOB = request.getParameter("DOB");
		String citizenship = request.getParameter("citizenship");

		UserInfo uInfo = new UserInfo();

		uInfo.setEmail(email);
		uInfo.setLastname(lastname);
		uInfo.setFirstname(firstname);
		uInfo.setCIN(CIN);
		uInfo.setPhone(phone);
		uInfo.setGender(gender);
		uInfo.setDOB(DOB);
		uInfo.setCitizenship(citizenship);
		UserInfo uInfo1 = userDao.addU(uInfo);

		// Department
		String dept_name = request.getParameter("dept_name");
		Department dept = userDao.getDept(Integer.parseInt(dept_name));

		// Program
		String name = request.getParameter("name");
		Program program1 = userDao.getPgm(Integer.parseInt(name));

		// New Application
		String term = request.getParameter("term");
		String TOEFL = request.getParameter("TOEFL");
		String GRE = request.getParameter("GRE");
		String GPA = request.getParameter("GPA");

		Application application = new Application();

		application.setUser(user);
		application.setTerm(term);
		application.setTOEFL(TOEFL);
		application.setGRE(GRE);
		application.setGPA(GPA);
		application.setProgram(program1);
		application.setDept(dept);
		application.setInfo(uInfo1);

		String s = request.getParameter("submit");

		Date date1 = new Date();

		if ("Submit".equalsIgnoreCase(s)) {
			application.setStatus("New");
			application.setDate(date1);

		} else {

			application.setStatus("Not Submitted");
		}

		Application application1 = userDao.addApp(application);

		// History
		History history = new History();

		if ("New".equalsIgnoreCase(application1.getStatus())) {
			history.setDate(date1);
			history.setName("New");
			history.setApplication(application1);
			History history1 = userDao.addHistory(history);
		}

		// New Degree
		String univ_name = request.getParameter("univ_name");
		String time_period_attended = request
				.getParameter("time_period_attended");
		String degree_earned = request.getParameter("degree_earned");
		String major = request.getParameter("major");

		Degree d = new Degree();
		d.setApp(application1);
		d.setUniv_name(univ_name);
		d.setTime_period_attended(time_period_attended);
		d.setDegree_earned(degree_earned);
		d.setMajor(major);
		Degree d1 = userDao.addDegree(d);

		String a = request.getParameter("counter1");
		Integer in = null;
		if (a != null) {
			in = Integer.parseInt(a);
			for (int i = 1; i <= in; i++) {

				String univ_name1 = request.getParameter("univ_name" + i);
				String time_period_attended1 = request
						.getParameter("time_period_attended" + i);
				String degree_earned1 = request.getParameter("degree_earned"
						+ i);
				String major1 = request.getParameter("major" + i);

				Degree degree = new Degree();

				degree.setApp(application1);
				degree.setUniv_name(univ_name1);
				degree.setTime_period_attended(time_period_attended1);
				degree.setDegree_earned(degree_earned1);
				degree.setMajor(major1);
				Degree degree1 = userDao.addDegree(degree);
			}
		}

		// File Upload
		if (file != null && !file.isEmpty()) {

			file.transferTo(new File(
					getFileDirectory(id, application1.getId()), file
							.getOriginalFilename()));
		}

		return "redirect:student.html?id=" + id;
	}

	// ***************************File Download********************************

	@RequestMapping("/download.html")
	public String download(HttpServletResponse response,
			@RequestParam Integer aid, @RequestParam Integer uid)
			throws IOException {

		File file = getFileDirectory(uid, aid);
		String a[] = file.list();
		for (int i = 0; i < a.length; i++) {
			response.setContentType("text/plain");
			response.setHeader("Content-Disposition", "inline; filename="
					+ a[i]);

			FileInputStream in = new FileInputStream(new File(getFileDirectory(
					uid, aid), a[i]));
			OutputStream out = response.getOutputStream();

			byte buffer[] = new byte[2048];
			int bytesRead;
			while ((bytesRead = in.read(buffer)) > 0)
				out.write(buffer, 0, bytesRead);

			in.close();
		}
		return null;
	}

	// ************************** app_edit ******************************

	@RequestMapping(value = "/app_edit.html", method = RequestMethod.GET)
	public String app_edit(@RequestParam Integer id, ModelMap models) {

		Application q = userDao.getApp(id);
		models.put("t", q);

		Department d = userDao.getDept(q.getDept().getId());
		models.put("r", userDao.getDep(d));

		models.put("e", appDao.getApp(id));
		models.put("degree", appDao.getDegree(id));
		return "app_edit";
	}

	@RequestMapping(value = "/app_edit.html", method = RequestMethod.POST)
	public String app_edit(ModelMap models, @RequestParam Integer id,
			HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file)
			throws IllegalStateException, IOException {

		Application app = appDao.getApp(id);

		// User Info
		String email = request.getParameter("email");
		String lastname = request.getParameter("lastname");
		String firstname = request.getParameter("firstname");
		String CIN = request.getParameter("CIN");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String DOB = request.getParameter("DOB");
		String citizenship = request.getParameter("citizenship");

		UserInfo info1 = userDao.getUinfo(app.getInfo().getId());
		info1.setLastname(lastname);
		info1.setFirstname(firstname);
		info1.setEmail(email);
		info1.setCIN(CIN);
		info1.setPhone(phone);
		info1.setGender(gender);
		info1.setDOB(DOB);
		info1.setCitizenship(citizenship);
		UserInfo u1 = userDao.addU(info1);

		// Program
		String name = request.getParameter("name");
		Program program1 = userDao.getPgm(Integer.parseInt(name));

		// Application
		String term = request.getParameter("term");
		String TOEFL = request.getParameter("TOEFL");
		String GRE = request.getParameter("GRE");
		String GPA = request.getParameter("GPA");

		app.setProgram(program1);
		app.setTerm(term);
		app.setTOEFL(TOEFL);
		app.setGRE(GRE);
		app.setGPA(GPA);
		app.setInfo(u1);

		String s1 = request.getParameter("submit");
		if ("Submit".equalsIgnoreCase(s1)) {
			app.setStatus("New");
			Date date1 = new Date();
			app.setDate(date1);
		} else {
			app.setStatus("Not Submitted");
		}

		Application a1 = userDao.addApp(app);

		// History
		History h = new History();

		if ("New".equalsIgnoreCase(a1.getStatus())) {
			h.setDate(new Date());
			h.setName("New");
			h.setApplication(a1);
			History history2 = userDao.addHistory(h);
		}

		// Degree
		String a = request.getParameter("counter1");
		Integer in = null;
		if (a != null) {
			in = Integer.parseInt(a);
			for (int i = 1; i <= in; i++) {

				String univ_name1 = request.getParameter("univ_name" + i);
				String time_period_attended1 = request
						.getParameter("time_period_attended" + i);
				String degree_earned1 = request.getParameter("degree_earned"
						+ i);
				String major1 = request.getParameter("major" + i);

				Degree degree = new Degree();

				degree.setApp(a1);
				degree.setUniv_name(univ_name1);
				degree.setTime_period_attended(time_period_attended1);
				degree.setDegree_earned(degree_earned1);
				degree.setMajor(major1);
				Degree degree1 = userDao.addDegree(degree);
			}
		}

		// File Upload
		if (file != null && !file.isEmpty()) {
			File t = getFileDirectory(app.getUser().getId(), id);
			File a2[] = t.listFiles();
			for (int i = 0; i < a2.length; i++) {
				a2[i].delete();
			}
			file.transferTo(new File(
					getFileDirectory(app.getUser().getId(), id), file
							.getOriginalFilename()));
		}

		return "redirect:student.html?id=" + app.getUser().getId();
	}

	// ************************** Remove Degree ******************************

	@RequestMapping(value = "/deg_del.html", method = RequestMethod.GET)
	public String deg_del(@RequestParam Integer did, @RequestParam Integer aid,
			ModelMap models) {

		Degree degree = userDao.getDegree(did);
		userDao.delDeg(degree);
		return "redirect:app_edit.html?id=" + aid;

	}

	// ************************** Staff ***********************************

	@RequestMapping("/staff.html")
	public String staff() {

		return "staff";
	}

	// ************************** Department ******************************

	@RequestMapping("/admin.html")
	public String admin(ModelMap models, HttpServletRequest request) {

		models.put("dept", deptDao.getDepartment());
		return "admin";
	}

	@RequestMapping("/dept_view.html")
	public String dept_view(@RequestParam Integer id, ModelMap models) {

		models.put("dept", userDao.getDept(id));
		models.put("pgm", userDao.getProgram(id));
		models.put("info", userDao.getInfo(id));
		return "dept_view";
	}

	// ************************** Add-Dept ********************************

	@RequestMapping(value = "/add.html", method = RequestMethod.GET)
	public String add() {

		return "add";
	}

	@RequestMapping(value = "/add.html", method = RequestMethod.POST)
	public String add(ModelMap models, HttpServletRequest request) {

		// Add Department
		Department department = new Department();

		String dept_name = request.getParameter("dept_name");

		if (dept_name.equalsIgnoreCase("")) {
			return "add";
		} else {

			department.setDept_name(dept_name);
			Department department1 = userDao.addDept(department);

			// Add Program
			Program program = new Program();

			String name = request.getParameter("name");

			program.setDepartment(department1);
			program.setName(name);
			userDao.addPgm(program);

			String aa = request.getParameter("counter2");
			Integer inn = null;
			if (aa != null) {
				inn = Integer.parseInt(aa);
				for (int j = 1; j <= inn; j++) {

					String name1 = request.getParameter("name" + j);

					Program program1 = new Program();

					program1.setDepartment(department1);
					program1.setName(name1);
					userDao.addPgm(program1);
				}
			}

			// Add Additional Info

			String ftype = request.getParameter("ftype");
			String fname = request.getParameter("fname");
			String fstatus = request.getParameter("fstatus");
			String fvalue = request.getParameter("fvalue");

			Ainfo ainfo = new Ainfo();

			ainfo.setFname(fname);
			ainfo.setFstatus(fstatus);
			ainfo.setFtype(ftype);
			ainfo.setFvalue(fvalue);
			ainfo.setDept(department1);
			userDao.addInfo(ainfo);

			String a = request.getParameter("counter1");
			Integer in = null;
			if (a != null) {
				in = Integer.parseInt(a);
				for (int i = 1; i <= in; i++) {

					String ftype1 = request.getParameter("ftype" + i);
					String fname1 = request.getParameter("fname" + i);
					String fstatus1 = request.getParameter("fstatus" + i);
					String fvalue1 = request.getParameter("fvalue" + i);

					Ainfo a1 = new Ainfo();

					a1.setFname(fname1);
					a1.setFstatus(fstatus1);
					a1.setFtype(ftype1);
					a1.setFvalue(fvalue1);
					a1.setDept(department1);
					userDao.addInfo(a1);
				}
			}
		}

		return "redirect:admin.html";
	}

	// ************************** Remove Program ******************************

	@RequestMapping(value = "/pgm_del.html", method = RequestMethod.GET)
	public String pgm_del(@RequestParam Integer did, @RequestParam Integer pid,
			ModelMap models) {

		Program pgm = userDao.getPgm(pid);
		userDao.delPrgm(pgm);
		return "redirect:dept_edit.html?id=" + did;

	}

	// ************************** Remove Ainfo ******************************

	@RequestMapping(value = "/ainfo_del.html", method = RequestMethod.GET)
	public String ainfo_del(@RequestParam Integer did,
			@RequestParam Integer aid, ModelMap models) {

		Ainfo ainfo = userDao.getAf(aid);
		userDao.delInfo(ainfo);
		return "redirect:dept_edit.html?id=" + did;

	}

	// ************************** Edit-Program ********************************

	@RequestMapping(value = "/dept_edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer id, ModelMap models) {

		models.put("dept", userDao.getDept(id));
		models.put("pgm", userDao.getProgram(id));
		models.put("ainfo", userDao.getInfo(id));
		return "edit";
	}

	@RequestMapping(value = "/dept_edit.html", method = RequestMethod.POST)
	public String edit(@RequestParam String dept_name,
			@RequestParam Integer id, ModelMap models,
			HttpServletRequest request) {

		// Edit Department
		Department dept = userDao.getDept(id);
		dept.setDept_name(dept_name);
		Department dept1 = userDao.addDept(dept);

		// Add Program
		String aa = request.getParameter("counter2");
		Integer inn = null;
		if (aa != null) {
			inn = Integer.parseInt(aa);
			for (int j = 1; j <= inn; j++) {

				String name1 = request.getParameter("name" + j);

				Program program1 = new Program();

				program1.setDepartment(dept1);
				program1.setName(name1);
				Program program2 = userDao.addPgm(program1);
			}
		}

		// Add Additional Field
		String a = request.getParameter("counter1");
		Integer in = null;
		if (a != null) {
			in = Integer.parseInt(a);
			for (int i = 1; i <= in; i++) {

				String ftype1 = request.getParameter("ftype" + i);
				String fname1 = request.getParameter("fname" + i);
				String fstatus1 = request.getParameter("fstatus" + i);
				String fvalue1 = request.getParameter("fvalue" + i);

				Ainfo a1 = new Ainfo();

				a1.setFname(fname1);
				a1.setFstatus(fstatus1);
				a1.setFtype(ftype1);
				a1.setFvalue(fvalue1);
				a1.setDept(dept1);
				Ainfo a2 = userDao.addInfo(a1);
			}
		}

		return "redirect:admin.html";

	}

	// ********************* Get Program ***************************

	@RequestMapping(value = "/get-program.html", method = RequestMethod.GET)
	public void getPrograms(@RequestParam Integer department,
			HttpServletResponse response) throws IOException {

		List<Program> program = userDao.getProgram(department);

		String html = "<select name='program.id' class='form-control'><option value=''>Select Program...</option>";
		for (Program p : program) {
			html += "<option value='" + p.getId() + "'>" + p.getName()
					+ "</option>";
		}
		html += "</select>";
		PrintWriter out = response.getWriter();
		out.print(html);
	}

//	// *************************** Edit Program ************************
//
//	@RequestMapping(value = "/edit-program.html", method = RequestMethod.GET)
//	public void editPrograms(@RequestParam Integer department,
//			@RequestParam Integer programid, HttpServletResponse response)
//			throws IOException {
//
//		List<Program> program = userDao.getProgram(department);
//
//		String html = "<select name='program.id' class='form-control'><option value=''>Select Program...</option>";
//		String selected = null;
//		for (Program p : program) {
//			if (p.getId() == programid) {
//				selected = "selected";
//			} else {
//				selected = "null";
//			}
//			html += "<option value='" + p.getId() + "' " + selected + ">"
//					+ p.getName() + "</option>";
//		}
//		html += "</select>";
//		PrintWriter out = response.getWriter();
//		out.print(html);
//	}

}
