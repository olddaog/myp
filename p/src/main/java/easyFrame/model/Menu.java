package easyFrame.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.sf.json.JSONObject;

@Entity
@Table(name = "t_menu")
public class Menu extends BaseObject {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String text;
	private HashMap target = new HashMap();
	private String domId;
	private String iconCls;
	private String state;
	private HashMap attributes = new HashMap();
	private Long parentId;
	private String url;
	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "menu_children")
	private Set<Menu> children;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDomId() {
		return domId;
	}

	public void setDomId(String domId) {
		this.domId = domId;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public HashMap getTarget() {
		return target;
	}

	public void setTarget(HashMap target) {
		this.target = target;
	}

	public HashMap getAttributes() {
		return attributes;
	}

	public void setAttributes(HashMap attributes) {
		this.attributes = attributes;
	}

	public void addChildren(Menu menu) {

		Set<Menu> set = this.getChildren();
		set.add(menu);
		this.setChildren(set);
	}

	public Set<Menu> getChildren() {
		return children;
	}

	public void setChildren(Set<Menu> children) {
		this.children = children;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return getClass().getName() + "@" + Integer.toHexString(hashCode());
	}

	@Override
	public boolean equals(Object o) {
		if (!(o instanceof Menu)) {
			return false;
		}
		
		
		
		
		Menu m = (Menu) o;
		System.out.println(this.text.equals(m.getText()));
		// System.out.println(aa.getText()+"=================");
		if ((m.getText() + "").equals(this.getText() + "")) {
			if ((this.getId() + "").equals(m.getId() + "")) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
	
		if (this.getId() != null) {
			System.out.println(this.getId());
			return Integer.parseInt(this.getId() + "");
		}
		return 0;
	}

}
