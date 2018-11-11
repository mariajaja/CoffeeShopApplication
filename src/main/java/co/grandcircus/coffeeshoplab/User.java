/**
 * 
 */
package co.grandcircus.coffeeshoplab;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

/**
 * @author Mariah
 *
 */
@Component
public class User {

	private String firstName;
	private String lastName;
	private String userEmail;
	private String userPhone;
	private String username;
	private String userPassword;
	private LocalDateTime timeAccountCreated;
	private Date userBirthday;
	private boolean birthdayTreat;
	private boolean newsletter;

	public User() {

	}

	public User(String firstName, String lastName, String userEmail, String userPhone, String username,
			String userPassword, LocalDateTime timeAccountCreated, Date userBirthday, boolean birthdayTreat,
			boolean newsletter) {
		super();
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
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", userEmail=" + userEmail + ", userPhone="
				+ userPhone + ", username=" + username + ", userPassword=" + userPassword + ", timeAccountCreated="
				+ timeAccountCreated + ", userBirthday=" + userBirthday + ", birthdayTreat=" + birthdayTreat
				+ ", newsletter=" + newsletter + "]";
	}

}
