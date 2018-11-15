/**
 * 
 */
package co.grandcircus.coffeeshoplab.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import co.grandcircus.coffeeshoplab.entity.User;

/**
 * @author Mariah
 *
 */
@Repository
@Transactional
public class UserDao {

	@PersistenceContext
	private EntityManager em;

	public List<User> findAll() {
		// The SELECT clause is optional in HQL. If omitted, it's basically SELECT *.
		// When creating a a query specify the type of the results: Food.class
		// HQL queries use Java class and property names, not SQL table & column names.
		return em.createQuery("FROM User", User.class).getResultList();
	}

	// could modify in future to show a specific user's information (i.e. once
	// signed in, allow user to changed data)
	public User findById(Long id) {
		return em.find(User.class, id);
	}

	// could modify in future to differentiate between users and admins (create a
	// column in the user table??)
//	public List<User> findByCategory(String category) {
//		// HQL queries can have named parameters, such as :regex here.
//		// HQL queries use Java class and property names, not SQL table & column names.
//		return em.createQuery("FROM User WHERE category = :category", User.class).setParameter("category", category)
//				.getResultList();
//	}

	public List<User> findByKeyword(String keyword) {
		return em.createQuery("FROM User WHERE LOWER(name) LIKE :regex", User.class)
				.setParameter("regex", "%" + keyword.toLowerCase() + "%").getResultList();
	}

	public void create(User user) {
		em.persist(user);
	}

	public void update(User user) {
		em.merge(user);
	}

	public void delete(Long id) {
		// Deleting with Hibernate entity manager requires fetching a reference first.
		User user = em.getReference(User.class, id);
		em.remove(user);
	}

}
