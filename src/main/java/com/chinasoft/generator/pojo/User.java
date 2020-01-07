package com.chinasoft.generator.pojo;

import com.chinasoft.generator.annotation.PojoFiled;
import com.chinasoft.generator.annotation.PojoName;
import lombok.Data;

/**
 * @description:
 * @author: Jeremy
 * @time: 2020/1/2 22:12
 */
@Data
@PojoName("t_user")
public class User {
    @PojoFiled(isPrimaryKey = true,column = "ID",mysqlType="int")
    private Integer id;
    @PojoFiled(column = "true_name")
    private String trueName;
    @PojoFiled(column = "age",mysqlType="int")
    private Integer age;
}