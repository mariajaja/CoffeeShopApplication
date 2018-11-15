/**
 * 
 */
package co.grandcircus.coffeeshoplab.entity;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Mariah
 *
 */
@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String firstName;
	private String lastName;
	@Column(name = "email")
	private String userEmail;
	@Column(name = "phone")
	private String userPhone;
	private String username;
	@Column(name = "password")
	private String userPassword;
	@Column(name = "time_created")
	private LocalDateTime timeAccountCreated;
	@Column(name = "birthday")
	private Date userBirthday;
	private boolean birthdayTreat;
	private boolean newsletter;

	public User() {

	}

	public User(Long id, String firstName, String lastName, String userEmail, String userPhone, String username,
			String userPassword, LocalDateTime timeAccountCreated, Date userBirthday, boolean birthdayTreat,
			boolean newsletter) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.username = username;
		this.userPassword = userPassword;
		this.timeAccountCreated = timeAccountCreated;
		this.userBirthday = userBirthday;
		this.birthdayTreat = birthdayTreat;
		this.newsletter = newsletter;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public LocalDateTime getTimeAccountCreated() {
		return timeAccountCreated;
	}

	public void setTimeAccountCreated(LocalDateTime timeAccountCreated) {
		this.timeAccountCreated = timeAccountCreated;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public boolean isBirthdayTreat() {
		return birthdayTreat;
	}

	public void setBirthdayTreat(boolean birthdayTreat) {
		this.birthdayTreat = birthdayTreat;
	}

	public boolean isNewsletter() {
		return newsletter;
	}

	public void setNewsletter(boolean newsletter) {
		this.newsletter = newsletter;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", userEmail=" + userEmail
				+ ", userPhone=" + userPhone + ", username=" + username + ", userPassword=" + userPassword
				+ ", timeAccountCreated=" + timeAccountCreated + ", userBirthday=" + userBirthday + ", birthdayTreat="
				+ birthdayTreat + ", newsletter=" + newsletter + "]";
	}

}
