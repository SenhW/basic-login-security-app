package io.github.senhw.basiclogin.dao;

import io.github.senhw.basiclogin.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}
