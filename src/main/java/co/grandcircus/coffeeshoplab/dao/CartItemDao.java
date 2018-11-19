/**
 * 
 */
package co.grandcircus.coffeeshoplab.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import co.grandcircus.coffeeshoplab.entity.CartItem;
import co.grandcircus.coffeeshoplab.entity.MenuItem;
import co.grandcircus.coffeeshoplab.entity.User;

/**
 * @author Mariah
 *
 */

@Repository
@Transactional
public class CartItemDao {

	@PersistenceContext
	private EntityManager em;

	public List<CartItem> findAllItemsInCart(User user) {
		List<CartItem> userCart = em.createQuery("FROM CartItem WHERE user = :user", CartItem.class)
				.setParameter("user", user).getResultList();
		return userCart;
	}

	public CartItem findItemInCart(User user, MenuItem menuItem) {
		List<CartItem> userItems = findAllItemsInCart(user);
		for (CartItem item : userItems) {
			if (item.getMenuItem().equals(menuItem)) {
				return item;
			}
		}
		return null;
	}

	public CartItem findById(Long id) {
		return em.find(CartItem.class, id);
	}

	public void create(CartItem cartItem) {
		em.persist(cartItem);
	}

	public void update(CartItem cartItem) {
		em.merge(cartItem);
	}

	public void delete(Long id) {
		// Deleting with Hibernate entity manager requires fetching a reference first.
		CartItem cartItem = em.getReference(CartItem.class, id);
		em.remove(cartItem);
	}

}
