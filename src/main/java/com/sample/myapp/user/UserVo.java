package com.sample.myapp.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Data
public class UserVo {
	private String userId;
	private String userName;
	private Date userBirth;
	private String userPw;
	private String userEmail;
	private int manager;
	private int activate;

}
