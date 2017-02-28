package easyFrame.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Parent;

@Entity
@Table(name = "t_org")
public class Org extends BaseObject {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String text;
	private Long parentId;
	@OneToMany(targetEntity=Org.class) @Cascade(org.hibernate.annotations.CascadeType.ALL) 
	@JoinTable(name = "org_children")
	private Set<Org> children;

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

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean equals(Object o) {
		if (!(o instanceof Org)) {
			return false;
		}
		Org org = (Org) o;
		if (org.getId() != null) {
			if (org.getId().equals(this.getId())) {
				if ((org.getName() + "").equals(this.getName())) {
					return true;
				}
			}
		}

		return false;
	}

	@Override
	public int hashCode() {
		if (this.getId() != null) {
			return Integer.parseInt(this.getId() + "");
		}
		return 0;
	}

	public Set<Org> getChildren() {
		return children;
	}

	public void setChildren(Set<Org> children) {
		this.children = children;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	@Transient
	public String getText() {
		return this.name;
	}

	public void setText(String text) {
		this.text = this.name;
	}

	public static void main(String[] args) {

	}

}
