package com.chinasoft.generator.domain;

import lombok.Data;

/**
 * @description:生成的文件需要自己去导入各种包
 * @author: Jeremy
 * @time: 2020/1/3 11:35
 */
@Data
public class ExampleStr {

    //Example文件主要内容
    private String mainShow02="    protected String orderByClause;\n" +
            "\n" +
            "    protected boolean distinct;\n" +
            "\n" +
            "    protected List<Criteria> oredCriteria;\n" +
            "\n" +
            "    private Integer limit;\n" +
            "\n" +
            "    private Integer offset;\n" +
            "\n" +
            "  \n" +
            "\n" +
            "    public void setOrderByClause(String orderByClause) {\n" +
            "        this.orderByClause = orderByClause;\n" +
            "    }\n" +
            "\n" +
            "    public String getOrderByClause() {\n" +
            "        return orderByClause;\n" +
            "    }\n" +
            "\n" +
            "    public void setDistinct(boolean distinct) {\n" +
            "        this.distinct = distinct;\n" +
            "    }\n" +
            "\n" +
            "    public boolean isDistinct() {\n" +
            "        return distinct;\n" +
            "    }\n" +
            "\n" +
            "    public List<Criteria> getOredCriteria() {\n" +
            "        return oredCriteria;\n" +
            "    }\n" +
            "\n" +
            "    public void or(Criteria criteria) {\n" +
            "        oredCriteria.add(criteria);\n" +
            "    }\n" +
            "\n" +
            "    public Criteria or() {\n" +
            "        Criteria criteria = createCriteriaInternal();\n" +
            "        oredCriteria.add(criteria);\n" +
            "        return criteria;\n" +
            "    }\n" +
            "\n" +
            "    public Criteria createCriteria() {\n" +
            "        Criteria criteria = createCriteriaInternal();\n" +
            "        if (oredCriteria.size() == 0) {\n" +
            "            oredCriteria.add(criteria);\n" +
            "        }\n" +
            "        return criteria;\n" +
            "    }\n" +
            "\n" +
            "    protected Criteria createCriteriaInternal() {\n" +
            "        Criteria criteria = new Criteria();\n" +
            "        return criteria;\n" +
            "    }\n" +
            "\n" +
            "    public void clear() {\n" +
            "        oredCriteria.clear();\n" +
            "        orderByClause = null;\n" +
            "        distinct = false;\n" +
            "    }\n" +
            "\n" +
            "    public void setLimit(Integer limit) {\n" +
            "        this.limit = limit;\n" +
            "    }\n" +
            "\n" +
            "    public Integer getLimit() {\n" +
            "        return limit;\n" +
            "    }\n" +
            "\n" +
            "    public void setOffset(Integer offset) {\n" +
            "        this.offset = offset;\n" +
            "    }\n" +
            "\n" +
            "    public Integer getOffset() {\n" +
            "        return offset;\n" +
            "    }";
    //GeneratedCriteria--part1
    private String generatedCriteria04part1 ="" +
            "protected abstract static class GeneratedCriteria {\n" +
            "        protected List<Criterion> criteria;\n" +
            "\n" +
            "        protected GeneratedCriteria() {\n" +
            "            super();\n" +
            "            criteria = new ArrayList<Criterion>();\n" +
            "        }\n" +
            "\n" +
            "        public boolean isValid() {\n" +
            "            return criteria.size() > 0;\n" +
            "        }\n" +
            "\n" +
            "        public List<Criterion> getAllCriteria() {\n" +
            "            return criteria;\n" +
            "        }\n" +
            "\n" +
            "        public List<Criterion> getCriteria() {\n" +
            "            return criteria;\n" +
            "        }\n" +
            "\n" +
            "        protected void addCriterion(String condition) {\n" +
            "            if (condition == null) {\n" +
            "                throw new RuntimeException(\"Value for condition cannot be null\");\n" +
            "            }\n" +
            "            criteria.add(new Criterion(condition));\n" +
            "        }\n" +
            "\n" +
            "        protected void addCriterion(String condition, Object value, String property) {\n" +
            "            if (value == null) {\n" +
            "                throw new RuntimeException(\"Value for \" + property + \" cannot be null\");\n" +
            "            }\n" +
            "            criteria.add(new Criterion(condition, value));\n" +
            "        }\n" +
            "\n" +
            "        protected void addCriterion(String condition, Object value1, Object value2, String property) {\n" +
            "            if (value1 == null || value2 == null) {\n" +
            "                throw new RuntimeException(\"Between values for \" + property + \" cannot be null\");\n" +
            "            }\n" +
            "            criteria.add(new Criterion(condition, value1, value2));\n" +
            "        }";


    //GeneratedCriteria--part2 方法
    private String generatedCriteria04part2 ="\n" +
            "\t\tpublic Criteria and(upProperty)IsNull() {\n" +
            "            addCriterion(\"(column) is null\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)IsNotNull() {\n" +
            "            addCriterion(\"(column) is not null\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)EqualTo((javaType) value) {\n" +
            "            addCriterion(\"(column) =\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)NotEqualTo((javaType) value) {\n" +
            "            addCriterion(\"(column) <>\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)GreaterThan((javaType) value) {\n" +
            "            addCriterion(\"(column) >\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)GreaterThanOrEqualTo((javaType) value) {\n" +
            "            addCriterion(\"(column) >=\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)LessThan((javaType) value) {\n" +
            "            addCriterion(\"(column) <\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)LessThanOrEqualTo((javaType) value) {\n" +
            "            addCriterion(\"(column) <=\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)In(List<(javaType)> values) {\n" +
            "            addCriterion(\"(column) in\", values, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)NotIn(List<(javaType)> values) {\n" +
            "            addCriterion(\"(column) not in\", values, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)Between((javaType) value1, (javaType) value2) {\n" +
            "            addCriterion(\"(column) between\", value1, value2, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)NotBetween((javaType) value1, (javaType) value2) {\n" +
            "            addCriterion(\"(column) not between\", value1, value2, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n";
    // GeneratedCriteria--part3 String特有的方法
    private String generatedCriteria04part3 ="\n" +
            "        public Criteria and(upProperty)Like((javaType) value) {\n" +
            "            addCriterion(\"(column) like\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n" +
            "\n" +
            "        public Criteria and(upProperty)NotLike((javaType) value) {\n" +
            "            addCriterion(\"(column) not like\", value, \"(lowProperty)\");\n" +
            "            return (Criteria) this;\n" +
            "        }\n";

    //Criteria
    private String criteriaClass05 ="" +
            "\n" +
            "\n" +
            "    public static class Criteria extends GeneratedCriteria {\n" +
            "\n" +
            "        protected Criteria() {\n" +
            "            super();\n" +
            "        }\n" +
            "    }\n" +
            "\n" +
            " ";

    private String criterionClass06 ="" +
            "\npublic static class Criterion {\n" +
            "        private String condition;\n" +
            "\n" +
            "        private Object value;\n" +
            "\n" +
            "        private Object secondValue;\n" +
            "\n" +
            "        private boolean noValue;\n" +
            "\n" +
            "        private boolean singleValue;\n" +
            "\n" +
            "        private boolean betweenValue;\n" +
            "\n" +
            "        private boolean listValue;\n" +
            "\n" +
            "        private String typeHandler;\n" +
            "\n" +
            "        public String getCondition() {\n" +
            "            return condition;\n" +
            "        }\n" +
            "\n" +
            "        public Object getValue() {\n" +
            "            return value;\n" +
            "        }\n" +
            "\n" +
            "        public Object getSecondValue() {\n" +
            "            return secondValue;\n" +
            "        }\n" +
            "\n" +
            "        public boolean isNoValue() {\n" +
            "            return noValue;\n" +
            "        }\n" +
            "\n" +
            "        public boolean isSingleValue() {\n" +
            "            return singleValue;\n" +
            "        }\n" +
            "\n" +
            "        public boolean isBetweenValue() {\n" +
            "            return betweenValue;\n" +
            "        }\n" +
            "\n" +
            "        public boolean isListValue() {\n" +
            "            return listValue;\n" +
            "        }\n" +
            "\n" +
            "        public String getTypeHandler() {\n" +
            "            return typeHandler;\n" +
            "        }\n" +
            "\n" +
            "        protected Criterion(String condition) {\n" +
            "            super();\n" +
            "            this.condition = condition;\n" +
            "            this.typeHandler = null;\n" +
            "            this.noValue = true;\n" +
            "        }\n" +
            "\n" +
            "        protected Criterion(String condition, Object value, String typeHandler) {\n" +
            "            super();\n" +
            "            this.condition = condition;\n" +
            "            this.value = value;\n" +
            "            this.typeHandler = typeHandler;\n" +
            "            if (value instanceof List<?>) {\n" +
            "                this.listValue = true;\n" +
            "            } else {\n" +
            "                this.singleValue = true;\n" +
            "            }\n" +
            "        }\n" +
            "\n" +
            "        protected Criterion(String condition, Object value) {\n" +
            "            this(condition, value, null);\n" +
            "        }\n" +
            "\n" +
            "        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {\n" +
            "            super();\n" +
            "            this.condition = condition;\n" +
            "            this.value = value;\n" +
            "            this.secondValue = secondValue;\n" +
            "            this.typeHandler = typeHandler;\n" +
            "            this.betweenValue = true;\n" +
            "        }\n" +
            "\n" +
            "        protected Criterion(String condition, Object value, Object secondValue) {\n" +
            "            this(condition, value, secondValue, null);\n" +
            "        }\n" +
            "    }";
}