/**
 * 
 */
package co.grandcircus.coffeeshoplab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.coffeeshoplab.dao.MenuDao;
import co.grandcircus.coffeeshoplab.entity.MenuItem;

/**
 * @author Mariah
 *
 */

@Controller
public class AdminController {

	@Autowired
	private MenuDao menuDao;

	@RequestMapping("/admin/menu")
	public ModelAndView listMenu(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "category", required = false) String category) {
		ModelAndView mav = new ModelAndView("admin-menu");
		if (keyword != null && !keyword.isEmpty()) {
			mav.addObject("items", menuDao.findByKeyword(keyword));
		} else if (category != null && !category.isEmpty()) {
			mav.addObject("items", menuDao.findByCategory(category));
		} else {
			mav.addObject("items", menuDao.findAll());
		}
		// list of categories needed for <select>
		mav.addObject("categories", menuDao.findAllCategories());
		return mav;
	}

	@RequestMapping("/admin/menu/create")
	public ModelAndView showCreateForm() {
		// If there is only one model value to add, use this one-line shortcut.
		// Equivalent to
		// ModelAndView mav = new ModelAndView("food-form");
		// mav.addObject("title", "Add a Food");
		return new ModelAndView("admin-create", "title", "Add an Item");
	}

	@RequestMapping(value = "/admin/menu/create", method = RequestMethod.POST)
	public ModelAndView submitCreateForm(MenuItem menuItem) {
		menuDao.create(menuItem);
		return new ModelAndView("redirect:/admin/menu");
	}

	// path variable required to identify which food we're editing
	@RequestMapping("/admin/menu/modify")
	public ModelAndView showEditForm(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("admin-modify");
		mav.addObject("item", menuDao.findById(id));
		mav.addObject("title", "Edit Item");
		return mav;
	}

	// same URL but different method
	@RequestMapping(value = "/admin/menu/modify", method = RequestMethod.POST)
	public ModelAndView submitEditForm(MenuItem menuItem) {
		menuDao.update(menuItem);
		return new ModelAndView("redirect:/admin/menu");
	}

	@RequestMapping("/admin/menu/delete")
	public ModelAndView delete(@RequestParam("id") Long id) {
		menuDao.delete(id);
		return new ModelAndView("redirect:/admin/menu");
	}

}
