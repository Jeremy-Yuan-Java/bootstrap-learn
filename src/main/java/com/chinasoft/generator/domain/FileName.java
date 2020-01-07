package com.chinasoft.generator.domain;

import lombok.Data;

/**
 * @description:
 * @author: Jeremy
 * @time: 2020/1/3 11:31
 */
@Data
public class FileName {
    private String mapperName;
    private String exampleName;
    private String xmlName;
    private String mapperPath;
    private String examplePath;
    private String xmlPath;
}