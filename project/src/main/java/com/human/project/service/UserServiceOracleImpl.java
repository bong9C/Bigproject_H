package com.human.project.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.project.db.UserDaoOracle;
import com.human.project.entity.User;

@Service
public class UserServiceOracleImpl implements UserService {
	@Autowired private UserDaoOracle userDao;

	@Override
	public int getUserCount() {
		int count = userDao.getUserCount();
		return count;
	}

	@Override
	public User getUser(String custid) {
		User user = userDao.getUser(custid);
		return user;
	}

	@Override
	public List<User> getUserList(int page) {
		int offset = (page - 1) * RECORDS_PER_PAGE;
		int limit = page * RECORDS_PER_PAGE;
		List<User> list = userDao.getUserList(offset, limit);
		return list;
	}

	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(String custid) {
		userDao.deleteUser(custid);
	}

	@Override
	public int login(String custid, String pwd) {
		User user = userDao.getUser(custid);
		if (user == null)
			return custid_NOT_EXIST;
		if (BCrypt.checkpw(pwd, user.getPwd()))
			return CORRECT_LOGIN;
		else
			return WRONG_PASSWORD;
	}

}
