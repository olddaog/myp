package easyFrame.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Table(name = "t_role")
public class Role extends BaseObject implements GrantedAuthority {
	private Long id;
	private String name;
	private Set<Role> children;
	private Long parentId;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private Set<Menu> menus;

	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "role_menu")
	/*@Cascade({ CascadeType.ALL, CascadeType.DELETE_ORPHAN })*/
	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean equals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return 0;
	}

	// ---------------------------------
	@Transient
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.getName();
	}
	
	
	

	public void addMenu(Menu menu) {

		Set<Menu> set = this.getMenus();
		set.add(menu);
		this.setMenus(set);
	}

	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "role_children")
	public Set<Role> getChildren() {
		return children;
	}

	public void setChildren(Set<Role> children) {
		this.children = children;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	
	
}
