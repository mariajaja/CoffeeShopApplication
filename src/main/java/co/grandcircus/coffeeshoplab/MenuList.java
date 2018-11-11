/**
 * 
 */
package co.grandcircus.coffeeshoplab;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

/**
 * @author Mariah
 *
 */
@Component
public class MenuList {

	private List<MenuItem> list = new ArrayList<>();

	public MenuList() {
		list.add(new MenuItem("Sandwich", "Versatile staple.", 7.99));
		list.add(new MenuItem("Cake", "Fluffy baked good with icing.", 6.50));
		list.add(new MenuItem("Apples", "Sweet and crunchy.", 0.99));
		list.add(new MenuItem("Dirty Chai", "Half Chai, Half Espresso", 3.99));
	}

	public List<MenuItem> getList() {
		return list;
	}

}
