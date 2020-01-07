package com.chinasoft.generator.domain;

import lombok.Data;

/**
 * @description:
 * @author: Jeremy
 * @time: 2020/1/3 11:09
 */
@Data
public class PojoColumn {
    private Boolean isPrimaryKey;
    //数据库中名称
    private String column;
    //jdbcType
    private String jdbcType;
    //java字段名词
    private String property;
    //java类型
    private String javaType;
}