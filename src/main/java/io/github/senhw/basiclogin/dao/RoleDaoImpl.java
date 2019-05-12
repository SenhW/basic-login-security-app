package io.github.senhw.basiclogin.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.github.senhw.basiclogin.entity.Role;

@Repository
public class RoleDaoImpl implements RoleDao {

	// need to inject session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Role findRoleByName(String theRoleName) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// now retrieve/read from database using name
		Query<Role> theQuery = currentSession.createQuery("from Role where name=:roleName", Role.class);
		theQuery.setParameter("roleName", theRoleName);
		
		Role theRole = null;
		
		try {
			theRole = theQuery.getSingleResult();
		} catch (Exception e) {
			theRole = null;
		}
		
		return theRole;
	}
}
