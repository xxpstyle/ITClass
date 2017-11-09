package com.xp.dao;

import com.xp.bean.Admin;
import com.xp.common.Pager;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao {
    void add(Admin admin);

    void update(Admin admin);

    void findById(Integer id);

    List<Admin> listByPager(Pager pager);

    Admin login(Admin admin);
}
