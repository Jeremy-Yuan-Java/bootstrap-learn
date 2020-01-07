package com.chinasoft.generator.utils;

import com.chinasoft.generator.domain.ExampleStr;
import com.chinasoft.generator.domain.PojoColumn;
import com.chinasoft.generator.domain.PojoDetail;
import com.chinasoft.generator.pojo.User;

import java.util.List;

/**
 * @description:
 * @author: Jeremy
 * @time: 2020/1/3 16:21
 */
public class ExampleGenerator {
    public static ExampleStr exampleStr = new ExampleStr();

    private static String getExampleClassName01(PojoDetail pojoDetail){
        String className = pojoDetail.getClassName();
        className = className.substring(className.lastIndexOf(".") + 1);
        return "public class"+" "+className+"Example";
    }

    private static String getExampleConstructor03(PojoDetail pojoDetail){
        String className = pojoDetail.getClassName();
        className = className.substring(className.lastIndexOf(".") + 1);
        return "public "+className+"Example() {\n" +
                "        oredCriteria = new ArrayList<Criteria>();\n" +
                "    }\n";
    }

    private static StringBuffer getGeneratedCriteria04(PojoDetail pojoDetail){
        StringBuffer stringBuffer = new StringBuffer();
        String generatedCriteriaPart=exampleStr.getGeneratedCriteria04part1();
        stringBuffer.append(generatedCriteriaPart);
        List<PojoColumn> flieds = pojoDetail.getFlieds();
        for (PojoColumn flied : flieds) {
            String filedMethod = getFiledMethod(flied);
            stringBuffer.append(filedMethod);
        }
        stringBuffer.append("}\n");
        return stringBuffer;
    }

    /**
     * 加个判断是否为String
     * @param pojoColumn
     * @return
     */
    private static String getFiledMethod(PojoColumn pojoColumn){
        String filedMethod = exampleStr.getGeneratedCriteria04part2();
        String lowProperty=pojoColumn.getProperty();
        String upProperty=lowProperty.substring(0,1).toUpperCase()+lowProperty.substring(1);
        String javaType=pojoColumn.getJavaType();
        if ("java.lang.String".equals(javaType)){
            filedMethod+=exampleStr.getGeneratedCriteria04part3();
        }
        String column=pojoColumn.getColumn();
        return filedMethod.replaceAll("\\(upProperty\\)",upProperty).replaceAll("\\(javaType\\)",javaType).replaceAll("\\(column\\)",column).replaceAll("\\(lowProperty\\)",lowProperty);
    }

    public static void main(String[] args) {
        PojoDetail pojoDetail = Generator.getPojoDetail(new User());
        String exampleClassName01 = getExampleClassName01(pojoDetail);
        String exampleBody02 = exampleStr.getMainShow02();
        String constructor03 = getExampleConstructor03(pojoDetail);
        String generatedCriteria04 = getGeneratedCriteria04(pojoDetail).toString();
        String criteria05 = exampleStr.getCriteriaClass05();
        String criterion06 = exampleStr.getCriterionClass06();
        System.out.println(exampleClassName01+"{\n"+ exampleBody02 +constructor03+generatedCriteria04+criteria05+criterion06+"}\n");


    }

}