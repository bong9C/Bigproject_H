package com.human.project.db;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.human.project.entity.User;

@Mapper
public interface UserDaoOracle {

	@Select("select count(uname) from users where isDeleted=0")
	public int getUserCount();
	
	@Select("select * from users where custid=#{custid}")
	public User getUser(String custid);
	
	// #{CUSTID} --> user.getcustid()
	@Insert("insert into users values (#{custid}, #{uname}, #{nickname}, #{pwd}, #{email}, default, default)")
	public void insertUser(User user);

	@Select("select * from (select rownum rnum, a.* from"
			+ "    (select * from users where isDeleted=0) a"
			+ "    where rownum <= #{limit}) where rnum > #{offset}")
	public List<User> getUserList(int offset, int limit);
	
	@Update("update users set pwd=#{pwd}, uname=#{uname}, nickname=#{nickname}, email=#{email}, regdate=#{regdate} where custid=#{custid}")
	void updateUser(User user);				// 인터페이스이기 때문에 public 생략 가능
	
	@Update("update users set isDeleted=1 where custid=#{custid}")
	void deleteUser(String custid);			// 인터페이스이기 때문에 public 생략 가능
	
}
