/**
 * 
 */
package co.grandcircus.coffeeshoplab.dao;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import co.grandcircus.coffeeshoplab.entity.MenuItem;

/**
 * @author Mariah
 *
 */
@Repository
@Transactional
public class MenuDao {

	@PersistenceContext
	private EntityManager em;

	public List<MenuItem> findAll() {
		// The SELECT clause is optional in HQL. If omitted, it's basically SELECT *.
		// When creating a a query specify the type of the results: Food.class
		// HQL queries use Java class and property names, not SQL table & column names.
		return em.createQuery("FROM MenuItem", MenuItem.class).getResultList();
	}

	public MenuItem findById(Long id) {
		return em.find(MenuItem.class, id);
	}

	public List<MenuItem> findByCategory(String category) {
		// HQL queries can have named parameters, such as :regex here.
		// HQL queries use Java class and property names, not SQL table & column names.
		return em.createQuery("FROM MenuItem WHERE category = :category", MenuItem.class)
				.setParameter("category", category).getResultList();
	}

	public List<MenuItem> findByKeyword(String keyword) {
		return em.createQuery("FROM MenuItem WHERE LOWER(name) LIKE :regex", MenuItem.class)
				.setParameter("regex", "%" + keyword.toLowerCase() + "%").getResultList();
	}

	public void create(MenuItem menuItem) {
		em.persist(menuItem);
	}

	public void update(MenuItem menuItem) {
		em.merge(menuItem);
	}

	public void delete(Long id) {
		// Deleting with Hibernate entity manager requires fetching a reference first.
		MenuItem menuItem = em.getReference(MenuItem.class, id);
		em.remove(menuItem);
	}

	public Set<String> findAllCategories() {
		// This query returns a list of Strings, so I give it String.class
		List<String> categoryList = em.createQuery("SELECT DISTINCT category FROM MenuItem", String.class)
				.getResultList();
		// Convert the List to a Set.
		return new TreeSet<>(categoryList);
	}

}
