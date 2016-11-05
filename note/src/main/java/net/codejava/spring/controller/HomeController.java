package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.codejava.spring.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import net.codejava.spring.model.Post;
import net.codejava.spring.dao.UpDAO;

/**
 * This controller routes accesses to the application to the appropriate hanlder
 * methods.
 *
 */

@Controller
public class HomeController {

    @Autowired
    private UpDAO upDAO;

    @RequestMapping(value = "/")
    public ModelAndView home(ModelAndView model) throws IOException {

        model.setViewName("home");
        return model;
    }

    @RequestMapping(value = "/signin")
    public ModelAndView signIn(ModelAndView model) throws IOException {
        User user = new User();
        model.addObject("user", user);
        model.setViewName("signin");
        return model;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logOut(ModelAndView model, HttpSession session) throws IOException {
        session.removeAttribute("id");
        session.removeAttribute("name");
        User user = new User();
        model.addObject("user", user);
        model.setViewName("redirect:/signin");
        return model;
    }

    @RequestMapping(value = "/signup")
    public ModelAndView signUp(ModelAndView model) throws IOException {
        User user = new User();
        model.addObject("user", user);
        model.setViewName("signup");
        return model;
    }

    @RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
    public ModelAndView checkSignup(@ModelAttribute User user) {
        if (user.getUsername() == null) {
            ModelAndView model = new ModelAndView("signup");
            model.addObject("result", "username can't be blank!");
            return model;
        }
        if (user.password == null) {
            ModelAndView model = new ModelAndView("signup");
            model.addObject("result", "password can't be blank!");
            return model;
        }
        if (upDAO.checkUsername(user.getUsername()) != null) {
            ModelAndView model = new ModelAndView("signup");
            model.addObject("result", "username exists");
            return model;
        } else {
            upDAO.save(user);
        }
        ModelAndView model = new ModelAndView("signin");
        model.addObject("message", "Signup sucess!");
        return model;
    }

    @RequestMapping(value = "/checkSignin")
    public ModelAndView checkSignin(@ModelAttribute User user, HttpSession session) {
        User temp = upDAO.doLogin(user.getUsername(), user.getPassword());
        if (temp == null) {
            ModelAndView model = new ModelAndView("signin");
            model.addObject("message", "Incorrect username or password.!");
            return model;
        } else {
            session.setAttribute("id", temp.getId());
            session.setAttribute("name", temp.getUsername());
        }
        ModelAndView model = new ModelAndView("redirect:/showpost");
        List<Post> lp = upDAO.list(temp.getId());
        Post po = new Post();
        model.addObject("list", lp);
        model.addObject("size", lp.size());
        model.addObject("po", po);
        return model;
    }

    @RequestMapping(value = "/showpost")
    public ModelAndView doLogin(ModelAndView model, HttpSession session) {
        String id = null;
        try {
             id = session.getAttribute("id").toString();
        } catch (Exception e) {
            System.out.println(e);
            model.setViewName("signin");
            User user = new User();
            model.addObject("user", user);
            model.addObject("message", "You not signin!");
            return model;
        }

        model.setViewName("showpost");
        List<Post> lp = upDAO.list(Integer.parseInt(id));
        Post po = new Post();
        model.addObject("list", lp);
        model.addObject("size", lp.size());
        model.addObject("po", po);
        return model;
    }

    @RequestMapping(value = "/addPost", method = RequestMethod.POST)
    public ModelAndView addPost(@ModelAttribute Post post, HttpSession session) {
        int id = (int) session.getAttribute("id");
        post.autoSetPostedAt();
        post.setAuthor_id(id);
        upDAO.savePost(post);
        ModelAndView model = new ModelAndView("showpost");
        List<Post> lp = upDAO.list(id);
        model.addObject("list", lp);
        model.addObject("size", lp.size());
        Post po = new Post();
        model.addObject("po", po);
        return model;
    }

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public ModelAndView menu(ModelAndView model, HttpServletRequest request, HttpSession session) throws IOException {
        session.setAttribute("id_book", request.getParameter("id"));
        model.setViewName("menu");
        return model;
    }

    @RequestMapping(value = "/edit")
    public ModelAndView edit(ModelAndView model, HttpSession session) throws IOException {
        int id = Integer.parseInt(session.getAttribute("id_book").toString());
        Post po = upDAO.getPost(id);
        model.addObject("note", po);
        model.addObject("po", new Post());
        model.setViewName("edit");
        return model;
    }

    @RequestMapping(value = "/edited", method = RequestMethod.POST)
    public ModelAndView edited(@ModelAttribute("po") Post po, HttpSession session) {
        int id = Integer.parseInt(session.getAttribute("id_book").toString());
        Post p = upDAO.getPost(id);
        p.setContent(po.getContent());
        upDAO.editPost(p);
        ModelAndView model = new ModelAndView("redirect:/showpost");
        return model;
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request, HttpSession session) {
        int id = Integer.parseInt(request.getParameter("id"));
        upDAO.deletePost(id);
        ModelAndView model = new ModelAndView("redirect:/showpost");
        return model;
    }

    @RequestMapping(value = "/profile")
    public ModelAndView profile(ModelAndView model,HttpSession session) throws IOException {
        int id = (int) session.getAttribute("id");
        User temp = upDAO.getUsername(id);
        model.addObject("user", temp);
        model.setViewName("myprofile");
        return model;
    }
    
    @RequestMapping(value = "/editprofile")
    public ModelAndView editProfile(ModelAndView model, HttpSession session) throws IOException {
        int id = (int) session.getAttribute("id");
        User temp = upDAO.getUsername(id);
        model.addObject("u", temp);
        User user = new User();
        model.addObject("user", user);
        model.setViewName("editprofile");
        return model;
    }
    
    @RequestMapping(value = "/editedprofile")
    public ModelAndView editedProfile(@ModelAttribute("user") User user, HttpSession session,ModelAndView model){
        upDAO.updateUser(user);
        model.setViewName("myprofile");
        return model;
    }
}
