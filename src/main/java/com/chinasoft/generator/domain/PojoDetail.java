package com.chinasoft.generator.domain;

import lombok.Data;

import java.util.List;

/**
 * @description:
 * @author: Jeremy
 * @time: 2020/1/3 11:11
 */
@Data
public class PojoDetail {
    //类名
    private String className;
    //表名
    private String tableName;

    //字段属性(数据库中名称，jdbcType，java字段名词，java类型)
    private List<PojoColumn> flieds;
}