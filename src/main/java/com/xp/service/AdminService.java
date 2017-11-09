package com.xp.service;

import com.xp.bean.Admin;
import com.xp.common.Pager;

import java.util.List;

public interface AdminService {
    void add(Admin admin);

    void update(Admin admin);

    void findById(Integer id);

    List<Admin> listByPager(Pager pager);

    Admin login(Admin admin);
}
