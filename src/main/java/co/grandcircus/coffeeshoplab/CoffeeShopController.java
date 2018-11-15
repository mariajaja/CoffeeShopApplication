/**
 * 
 */
package co.grandcircus.coffeeshoplab;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.coffeeshoplab.dao.MenuDao;
import co.grandcircus.coffeeshoplab.dao.UserDao;
import co.grandcircus.coffeeshoplab.entity.User;

/**
 * @author Mariah
 *
 */
@Controller
public class CoffeeShopController {

	@Autowired
	UserDao userDao;

	@Autowired
	MenuDao menuDao;

	@RequestMapping("/")
	public ModelAndView home() {
		return new ModelAndView("index");
	}

	@RequestMapping("/Register")
	public ModelAndView showUserRegistration() {
		return new ModelAndView("Register");
	}

	@RequestMapping("/AddUser")
	public ModelAndView showAddedUser(@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String userEmail, @RequestParam String userPhone, @RequestParam String username,
			@RequestParam String userPassword, @RequestParam Date birthdayInput, @RequestParam boolean birthdayTreat,
			@RequestParam boolean newsletter) {
		ModelAndView mav = new ModelAndView("AddUser");
		LocalDateTime timeAccountCreated = LocalDateTime.now();
		Long id = null;
		User user = new User(id, firstName, lastName, userEmail, userPhone, username, userPassword, timeAccountCreated,
				birthdayInput, birthdayTreat, newsletter);
		userDao.create(user);
		mav.addObject(user);
		return mav;
	}

	@RequestMapping("/menu")
	public ModelAndView showMenu() {
		ModelAndView mav = new ModelAndView("list-menu");
		mav.addObject("list", menuDao.findAll());
		return mav;
	}
}
