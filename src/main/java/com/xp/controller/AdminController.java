package com.xp.controller;

import com.xp.bean.Admin;
import com.xp.common.Mail;
import com.xp.common.MailUtils;
import com.xp.common.Pager;
import com.xp.common.TORename;
import com.xp.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    String sendMail="",mailNum="";
    @GetMapping("login")
    public String to(){
        return "admin/login";
    }
    @GetMapping("reg")
    public String to2(){
        return "admin/reg";
    }
    @GetMapping("send/{mail}")
    @ResponseBody
    public void sendMail(@PathVariable("mail") final String mailInput) {
        new Thread(new Runnable() {
            public void run() {
                Mail mail = new Mail();
                mail.setSubject("欢迎使用ITonlie");
                // mail.setContent("8天<a href='http://baidu.com'>进入网站</a>" +
                //        "<img src='http://b.hiphotos.baidu.com/zhidao/pic/item/a5c27d1ed21b0ef47a3cc0a7dbc451da80cb3e76.jpg' />");
                // mail.setContentType("text/html;charset=utf-8");
                sendMail = TORename.getRandom();
                mailNum=mailInput;
                mail.setBodyContent("ITonlie的注册验证码<br/><h3>" + sendMail + "<h3><br/>");
                mail.setContentType("text/html;charset=utf-8");
                mail.setTo(mailInput);
                MailUtils.sendMail(mail);
            }
        }).start();
    }
    @PostMapping("reg")
    @ResponseBody
    public ModelAndView add(Admin admin) {
        ModelAndView m = new ModelAndView();
        String msg = "";
        if (mailNum.equals(admin.getMail())) {
            msg = "请以收到验证码的邮箱进行注册！";
            m.addObject(msg);
            m.setViewName("admin/reg");
            return m;
        }
        if (sendMail != admin.getSendNum()) {
            msg = "验证码错误！";
            m.addObject(msg);
            m.setViewName("admin/reg");
            return m;
        }
        adminService.add(admin);
        m.setViewName("index");
        return m;
    }
    /*@PostMapping("add")
    @ResponseBody
    public String add(MultipartFile file, HttpServletRequest request, Admin admin){
        try {
            // FileUtils.copyInputStreamToFile(file.getInputStream(), new File(PathUtils.uploadDir(request) + "/" + file.getOriginalFilename()));
            String filename = file.getOriginalFilename();
            String str= TORename.rename()+filename.substring(filename.lastIndexOf("."));
            file.transferTo(new File(TORename.uploadDir(request) + "/" + str));
            admin.setHeadpath(str);
            adminService.add(admin);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "index";
    }*/

    @GetMapping("update")
    public String  update(Admin admin){
        adminService. update(admin);
        return "成功";
    }

    @GetMapping("findById")
    public String  findById(Integer id){
        adminService. findById(id);
        return "成功";
    }

    @GetMapping("listByPager")
    public ModelAndView listByPager(Pager pager){
        List<Admin> adminList = adminService.listByPager(pager);
        ModelAndView m=new ModelAndView();
        m.setViewName("listByPager");
        m.addObject(adminList);
        return m;
    }


    @PostMapping("tologin")
    @ResponseBody
    public ModelAndView login(Admin a, HttpSession session) {
        Admin admin = adminService.login(a);
        ModelAndView m=new ModelAndView();
        if(admin == null){
            m.setViewName("admin/login");
            return m;
        }else {
            session.setAttribute("admin",admin);
            m.setViewName("admin/index");
            return m;
        }
    }

}

