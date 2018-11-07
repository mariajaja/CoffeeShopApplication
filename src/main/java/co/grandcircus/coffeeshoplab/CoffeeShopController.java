/**
 * 
 */
package co.grandcircus.coffeeshoplab;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Mariah
 *
 */
@Controller
public class CoffeeShopController {

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
			@RequestParam String userPassword, @RequestParam LocalDateTime timeAccountCreated) {
		ModelAndView user = new ModelAndView("AddUser");
		user.addObject("firstName", firstName);
		user.addObject("lastName", lastName);
		user.addObject("userEmail", userEmail);
		user.addObject("userPhone", userPhone);
		user.addObject("username", username);
		user.addObject("userPassword", userPassword);
		timeAccountCreated = LocalDateTime.now();
		user.addObject("timeAccountCreated", timeAccountCreated);
		return user;
	}
}
