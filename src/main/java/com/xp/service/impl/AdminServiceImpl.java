package com.xp.service.impl;

import com.xp.bean.Admin;
import com.xp.common.Pager;
import com.xp.dao.AdminDao;
import com.xp.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    public void add(Admin admin) {
        adminDao.add(admin);
    }

    public void update(Admin admin) {
        adminDao.update(admin);
    }

    public void findById(Integer id) {
        adminDao.findById(id);
    }

    public List<Admin> listByPager(Pager pager) {
        return adminDao.listByPager(pager);
    }

    public Admin login(Admin admin) {
        return adminDao.login(admin);
    }

}
