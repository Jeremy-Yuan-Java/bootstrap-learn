package com.chinasoft.generator.utils;

import com.chinasoft.generator.annotation.PojoFiled;
import com.chinasoft.generator.annotation.PojoName;
import com.chinasoft.generator.domain.PojoColumn;
import com.chinasoft.generator.domain.PojoDetail;
import com.chinasoft.generator.pojo.User;


import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.*;

/**
 * @description:
 * @author: Jeremy
 * @time: 2020/1/2 22:14
 */
public class Generator {
    private static HashMap<String,String> map;

    static {
        map=new HashMap<>();
        String extendFile="src/main/resources/extend/extend.properties";
        Properties properties = new Properties();
        String filePath= FileUtils.getResourceBasePath()+"/"+extendFile;
        try {
            properties.load(new FileReader(filePath));
            Set<String> strings = properties.stringPropertyNames();
            for (String key : strings) {
                String property = properties.getProperty(key);
                map.put(key,property);
            }
            
        } catch (IOException e) {
            System.out.println("文件不存在或出错，请检查在resources存在extend/extend.properties");
            e.printStackTrace();
        }
    }

    public static boolean getPojoExample(Object obj){
        Map<String, String> fileds = new LinkedHashMap<>();
        Class<?> clz = obj.getClass();
        //com.chinasoft.generator.pojo.User
        System.out.println(clz.getName());
        Field[] declaredFields = clz.getDeclaredFields();
        for (Field declaredField : declaredFields) {
            String name = declaredField.getName();
            System.out.println(name);

            String filedClass = declaredField.getType().getName();
            fileds.put(name,filedClass);
        }
        System.out.println(fileds);

        return false;
    }

    /**
     * 获得PojoDetail
     * @param obj
     * @return
     */

    public static PojoDetail getPojoDetail(Object obj){
        PojoDetail pojoDetail = new PojoDetail();
        //得到文件的字节码对象
        Class<?> clz = obj.getClass();
        //得到类名(PojoDetail的className)
        String className = clz.getName();
        //再得到类上注解中的value表名
        PojoName pojoName = clz.getAnnotation(PojoName.class);
        String tableName = pojoName.value();
        //得到PojoColumnList
        List<PojoColumn> pojoColumnList = getPojoColumnList(clz);
        //设置进去
        pojoDetail.setClassName(className);
        pojoDetail.setTableName(tableName);
        pojoDetail.setFlieds(pojoColumnList);
        return pojoDetail;
    }
    public static List<PojoColumn> getPojoColumnList(Class clz){

        List<PojoColumn> columns = new ArrayList<>();

        Field[] fields = clz.getDeclaredFields();
        for (Field field : fields) {

            PojoColumn pojoColumn = getPojoColumn(field);
            columns.add(pojoColumn);
        }

        return columns;
    }


    /**
     * 获取PojoColumn
     * @return
     */
    public static PojoColumn getPojoColumn(Field field){
        PojoColumn pojoColumn = new PojoColumn();

        PojoFiled pojoFiled = field.getAnnotation(PojoFiled.class);
        //是否为主键
        boolean primaryKey = pojoFiled.isPrimaryKey();
        //数据库中名称
        String column = pojoFiled.column();
        //先获取mysql中type再根据extend.properties中的转换(转成小写)
        String type = pojoFiled.mysqlType().toLowerCase();
        Set<Map.Entry<String, String>> entries = map.entrySet();
        for (Map.Entry<String, String> entry : entries) {
            if (entry.getKey().equals(type)){
                type=entry.getValue();
            }
        }
        String property = field.getName();
        System.out.println("property="+property);

        String javaType = field.getType().getTypeName();
        System.out.println("javaType="+javaType);

        pojoColumn.setIsPrimaryKey(primaryKey);
        pojoColumn.setColumn(column);
        pojoColumn.setJavaType(javaType);
        pojoColumn.setProperty(property);
        pojoColumn.setJdbcType(type);
        return pojoColumn;
    }

    public static void main(String[] args) {
        PojoDetail pojoDetail = getPojoDetail(new User());
        System.out.println(pojoDetail);

    }
}