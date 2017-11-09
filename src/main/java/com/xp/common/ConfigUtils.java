package com.xp.common;

import java.io.*;
import java.util.Properties;

public class ConfigUtils {
    private static Properties properties;

    public static Properties build(String path) {
        synchronized (ConfigUtils.class) {
            if (properties == null) {
                synchronized (ConfigUtils.class) {
                    try {
                        InputStream inputStream = new FileInputStream(new File(path));
                        properties = new Properties();
                        properties.load(inputStream); // 载入输入流内的内容
                        return properties;
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return null;
    }

    public static String getString(String key) {
        return properties.getProperty(key);
    }

    public static Integer getInteger(String key) {
        return Integer.valueOf(properties.getProperty(key));
    }

    public static Double getDouble(String key) {
        return Double.valueOf(properties.getProperty(key));
    }
}
