package gapp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import gapp.model.dao.ApplicationDao;

@Controller
public class ApplicationController {

    @Autowired
    private ApplicationDao applicationDao;

   // @RequestMapping("/users.html")
    public String application( ModelMap models )
    {
        models.put( "users", applicationDao.getApplication(4) );
        return "users";
    }

}