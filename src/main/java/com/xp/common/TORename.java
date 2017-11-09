package com.xp.common;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class TORename {

	//文件上传路径
	public static String uploadDir(HttpServletRequest request) {
		String rootDir = request.getServletContext().getRealPath("/");
		File file = new File(rootDir, "uploads");
		if (!file.exists()) {
			file.mkdirs();
		}
		return file.getAbsolutePath();
	}
	//文件重命名
	public static String rename() {
		String body="";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		body=sdf.format(new Date())+"";
		Random rand=new Random();
		int rnd = Math.abs(rand.nextInt(90)) + 10;
		String newName=body+rnd;
		return newName;
	}

	//邮箱验证码生成
	public static String getRandom() {
		String num = "";
		for (int i = 0 ; i < 5 ; i ++) {
			num = num + String.valueOf((int) Math.floor(Math.random() * 9 + 1));
		}
		return num;
	}

}
