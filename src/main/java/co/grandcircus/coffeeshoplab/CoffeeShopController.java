/**
 * 
 */
package co.grandcircus.coffeeshoplab;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.coffeeshoplab.dao.CartItemDao;
import co.grandcircus.coffeeshoplab.dao.MenuDao;
import co.grandcircus.coffeeshoplab.dao.UserDao;
import co.grandcircus.coffeeshoplab.entity.CartItem;
import co.grandcircus.coffeeshoplab.entity.MenuItem;
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

	@Autowired
	CartItemDao cartItemDao;

	@RequestMapping("/")
	public ModelAndView home(@SessionAttribute(name = "user", required = false) User user, HttpSession session) {
		return new ModelAndView("index");
	}

	@RequestMapping("/Register")
	public ModelAndView showUserRegistration(HttpSession session) {
		return new ModelAndView("Register");
	}

	@PostMapping("/Register")
	public ModelAndView submitRegistrationForm(@RequestParam("checkPassword") String confirmPassword,
			@RequestParam String firstName, @RequestParam String lastName, @RequestParam String userEmail,
			@RequestParam String userPhone, @RequestParam String username, @RequestParam String userPassword,
			@RequestParam Date birthdayInput, @RequestParam boolean birthdayTreat, @RequestParam boolean newsletter,
			HttpSession session, RedirectAttributes redir) {

		LocalDateTime timeAccountCreated = LocalDateTime.now();
		Long id = null;
		User user = new User(id, firstName, lastName, userEmail, userPhone, username, userPassword, timeAccountCreated,
				birthdayInput, birthdayTreat, newsletter);

		// Find the matching user.
		User existingUser = userDao.findByUsername(user.getUsername());
		if (existingUser != null) {
			return new ModelAndView("Register", "message", "A user with that username already exists.");
		}

		if (!confirmPassword.equals(user.getUserPassword())) {
			return new ModelAndView("Register", "message", "Passwords do not match.");
		}

		userDao.create(user);

		session.setAttribute("user", user);

		redir.addFlashAttribute("message", "Thanks for signing up!");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping("/login")
	public ModelAndView showLoginForm(HttpSession session) {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	// get the username and password from the form when it's submitted.
	public ModelAndView submitLoginForm(@RequestParam("username") String username,
			@RequestParam("userPassword") String password, HttpSession session, RedirectAttributes redir) {

		User user = userDao.findByUsername(username);
		// check that user exists
		if (user == null) {
			return new ModelAndView("login", "message", "Incorrect username or password.");
		}
		// check that password matches
		if (!user.getUserPassword().equals(password)) {
			return new ModelAndView("login", "message", "Incorrect username or password.");
		}

		session.setAttribute("user", user);
		redir.addFlashAttribute("message", "Welcome " + username + ".");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping("/menu")
	public ModelAndView showMenu(HttpSession session, RedirectAttributes redir) {
		ModelAndView mav = new ModelAndView("list-menu");
		mav.addObject("list", menuDao.findAll());
		return mav;
	}

	@RequestMapping("/cart/your-items")
	public ModelAndView viewUserCart(@SessionAttribute(name = "user", required = false) User user, HttpSession session,
			RedirectAttributes redir) {
		ModelAndView mav = new ModelAndView("user-cart");
		List<CartItem> userCart = cartItemDao.findAllItemsInCart(user);
		Double total = 0.0;
		for (CartItem item : userCart) {
			total += item.getMenuItem().getPrice();
		}
		mav.addObject("total", total);
		mav.addObject("cart", userCart);
		return mav;
	}

	@RequestMapping("/cart/{id}/add")
	public ModelAndView addToCart(@PathVariable("id") Long id,
			@SessionAttribute(name = "user", required = false) User user, HttpSession session,
			RedirectAttributes redir) {
		MenuItem menuItem = menuDao.findById(id);
		CartItem item = cartItemDao.findItemInCart(user, menuItem);
		if (item != null) {
			// if item exists already (is 1 or greater), will add 1 to the "cart" else it
			// will create an item and set quantity equal to 1
			Integer quantity = item.getQuantity();
			item.setQuantity(quantity + 1);
			cartItemDao.update(item);
		} else {
			CartItem newItem = new CartItem(null, 1, menuItem, user);
			cartItemDao.create(newItem);
		}

		redir.addFlashAttribute("message", "Item has been added to your cart!");
		return new ModelAndView("redirect:/cart/your-items");
	}

	@RequestMapping("/cart/remove")
	public ModelAndView deleteFromCart(@RequestParam(name = "id", required = false) Long id,
			@SessionAttribute(name = "user", required = false) User user, HttpSession session,
			RedirectAttributes redir) {
		MenuItem menuItem = menuDao.findById(id);
		CartItem item = cartItemDao.findItemInCart(user, menuItem);
		// just delete all of the item, no matter the quantity
		// TODO possibly create way to delete by user selected quantity if there's time
		cartItemDao.delete(item.getId());
		redir.addFlashAttribute("message", "Item has been removed from your cart!");
		return new ModelAndView("redirect:/cart/your-items");
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		session.invalidate();

		redir.addFlashAttribute("message", "You've logged out!");
		return new ModelAndView("redirect:/");
	}

}
