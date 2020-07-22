package com.mvc.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users, String> {
	public Users findByUsername(String username);
	public Users findByRoleContaining(String role);
	public List<Users> findByRole(String role);
	public List<Users> findTop10ByOrderByShoppingTimesDesc();
}
