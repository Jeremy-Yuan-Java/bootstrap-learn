prompt PL/SQL Developer import file
prompt Created on 2018年7月3日 by Administrator
set feedback off
set define off
prompt Creating POSITION...
create table POSITION
(
  POSID NUMBER(5) not null,
  PNAME VARCHAR2(15),
  PDESC VARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table POSITION
  add constraint PK_POSITION primary key (POSID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DEPT...
create table DEPT
(
  DEPTNO   NUMBER(3) not null,
  DEPTNAME VARCHAR2(15),
  LOCATION VARCHAR2(5)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPT
  add constraint PK_DEPT primary key (DEPTNO)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  EMPID             VARCHAR2(10) not null,
  PASSWORD          VARCHAR2(10),
  DEPTNO            NUMBER(3),
  POSID             NUMBER(5),
  MGRID             VARCHAR2(10),
  REALNAME          VARCHAR2(12),
  SEX               CHAR(3),
  BIRTHDATE         DATE,
  HIREDATE          DATE,
  LEAVEDATE         DATE,
  ONDUTY            NUMBER(1),
  EMPTYPE           NUMBER(1),
  PHONE             CHAR(11),
  QQ                VARCHAR2(10),
  EMERCONTACTPERSON VARCHAR2(200),
  IDCARD            CHAR(18)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EMPLOYEE.ONDUTY
  is '0-离职  1-在职';
comment on column EMPLOYEE.EMPTYPE
  is '1.普通员工  2.管理人员 含经理、总监、总裁等  3.管理员';
alter table EMPLOYEE
  add constraint PK_EMPLOYEE primary key (EMPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_REFERENCE_DEPT foreign key (DEPTNO)
  references DEPT (DEPTNO);
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_REFERENCE_EMPLOYEE foreign key (MGRID)
  references EMPLOYEE (EMPID);
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_REFERENCE_POSITION foreign key (POSID)
  references POSITION (POSID);

prompt Creating EXPENSE...
create table EXPENSE
(
  EXPID       NUMBER(10) not null,
  EMPID       VARCHAR2(10),
  TOTALAMOUNT NUMBER(10,2),
  EXPTIME     DATE,
  EXPDESC     VARCHAR2(100),
  NEXTAUDITOR VARCHAR2(10),
  LASTRESULT  VARCHAR2(20),
  STATUS      CHAR(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column EXPENSE.STATUS
  is '0：新创建  1：审核中   2 审核结束通过  3 审核通过驳回';
alter table EXPENSE
  add constraint PK_EXPENSE primary key (EXPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXPENSE
  add constraint FK_EXPENSE_REFERENCE_EMPLOYEE foreign key (EMPID)
  references EMPLOYEE (EMPID);

prompt Creating AUDITING...
create table AUDITING
(
  AUDITID   NUMBER(10) not null,
  EXPID     NUMBER(10),
  EMPID     VARCHAR2(10),
  RESULT    VARCHAR2(10),
  AUDITDESC VARCHAR2(50),
  TIME      DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table AUDITING
  add constraint PK_AUDITING primary key (AUDITID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUDITING
  add constraint FK_AUDITING_REFERENCE_EMPLOYEE foreign key (EMPID)
  references EMPLOYEE (EMPID);
alter table AUDITING
  add constraint FK_AUDITING_REFERENCE_EXPENSE foreign key (EXPID)
  references EXPENSE (EXPID);

prompt Creating DUTY...
create table DUTY
(
  DTID        NUMBER(10) not null,
  EMPID       VARCHAR2(10),
  DTDATE      DATE,
  SIGNINTIME  VARCHAR2(20),
  SIGNOUTTIME VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table DUTY
  add constraint PK_DUTY primary key (DTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DUTY
  add constraint FK_DUTY_REFERENCE_EMPLOYEE foreign key (EMPID)
  references EMPLOYEE (EMPID);

prompt Creating EXPENSEITEM...
create table EXPENSEITEM
(
  ITEMID   NUMBER(10) not null,
  EXPID    NUMBER(10),
  TYPE     VARCHAR2(10),
  AMOUNT   NUMBER(7,2),
  ITEMDESC VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table EXPENSEITEM
  add constraint PK_EXPENSEITEM primary key (ITEMID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXPENSEITEM
  add constraint FK_EXPENSEI_REFERENCE_EXPENSE foreign key (EXPID)
  references EXPENSE (EXPID);

prompt Creating EXPIMAGE...
create table EXPIMAGE
(
  IMGID    NUMBER(10) not null,
  EXPID    NUMBER(10),
  REALNAME VARCHAR2(100),
  FILENAME VARCHAR2(100),
  FILETYPE VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXPIMAGE
  add constraint PK_EXPIMAGE primary key (IMGID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXPIMAGE
  add constraint FK_EXPIMAGE_REFERENCE_EXPENSE foreign key (EXPID)
  references EXPENSE (EXPID);

prompt Creating INCOME...
create table INCOME
(
  ICID   NUMBER(10) not null,
  AMOUNT NUMBER(10),
  ICDATE DATE,
  ICTYPE VARCHAR2(20),
  INDESC VARCHAR2(100),
  USERID VARCHAR2(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table INCOME
  add constraint PK_INCOME primary key (ICID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INCOME
  add constraint FK_INCOME_REFERENCE_EMPLOYEE foreign key (USERID)
  references EMPLOYEE (EMPID);

prompt Creating PAYMENT...
create table PAYMENT
(
  PID      NUMBER(10) not null,
  PAYEMPID VARCHAR2(10),
  AMOUNT   NUMBER(10,2),
  PAYTIME  DATE,
  EXPID    NUMBER(10),
  EXPEMPID VARCHAR2(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table PAYMENT
  add constraint PK_PAYMENT primary key (PID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAYMENT
  add constraint FK_PAYMENT_REFERENCE_EXPENSE foreign key (EXPID)
  references EXPENSE (EXPID);

prompt Disabling triggers for POSITION...
alter table POSITION disable all triggers;
prompt Disabling triggers for DEPT...
alter table DEPT disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for EXPENSE...
alter table EXPENSE disable all triggers;
prompt Disabling triggers for AUDITING...
alter table AUDITING disable all triggers;
prompt Disabling triggers for DUTY...
alter table DUTY disable all triggers;
prompt Disabling triggers for EXPENSEITEM...
alter table EXPENSEITEM disable all triggers;
prompt Disabling triggers for EXPIMAGE...
alter table EXPIMAGE disable all triggers;
prompt Disabling triggers for INCOME...
alter table INCOME disable all triggers;
prompt Disabling triggers for PAYMENT...
alter table PAYMENT disable all triggers;
prompt Disabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE disable constraint FK_EMPLOYEE_REFERENCE_DEPT;
alter table EMPLOYEE disable constraint FK_EMPLOYEE_REFERENCE_EMPLOYEE;
alter table EMPLOYEE disable constraint FK_EMPLOYEE_REFERENCE_POSITION;
prompt Disabling foreign key constraints for EXPENSE...
alter table EXPENSE disable constraint FK_EXPENSE_REFERENCE_EMPLOYEE;
prompt Disabling foreign key constraints for AUDITING...
alter table AUDITING disable constraint FK_AUDITING_REFERENCE_EMPLOYEE;
alter table AUDITING disable constraint FK_AUDITING_REFERENCE_EXPENSE;
prompt Disabling foreign key constraints for DUTY...
alter table DUTY disable constraint FK_DUTY_REFERENCE_EMPLOYEE;
prompt Disabling foreign key constraints for EXPENSEITEM...
alter table EXPENSEITEM disable constraint FK_EXPENSEI_REFERENCE_EXPENSE;
prompt Disabling foreign key constraints for EXPIMAGE...
alter table EXPIMAGE disable constraint FK_EXPIMAGE_REFERENCE_EXPENSE;
prompt Disabling foreign key constraints for INCOME...
alter table INCOME disable constraint FK_INCOME_REFERENCE_EMPLOYEE;
prompt Disabling foreign key constraints for PAYMENT...
alter table PAYMENT disable constraint FK_PAYMENT_REFERENCE_EXPENSE;
prompt Deleting PAYMENT...
delete from PAYMENT;
commit;
prompt Deleting INCOME...
delete from INCOME;
commit;
prompt Deleting EXPIMAGE...
delete from EXPIMAGE;
commit;
prompt Deleting EXPENSEITEM...
delete from EXPENSEITEM;
commit;
prompt Deleting DUTY...
delete from DUTY;
commit;
prompt Deleting AUDITING...
delete from AUDITING;
commit;
prompt Deleting EXPENSE...
delete from EXPENSE;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting DEPT...
delete from DEPT;
commit;
prompt Deleting POSITION...
delete from POSITION;
commit;
prompt Loading POSITION...
insert into POSITION (POSID, PNAME, PDESC)
values (1, '总裁', '公司总体发展战略规划和管理');
insert into POSITION (POSID, PNAME, PDESC)
values (2, '教学经理', '负责日常教学管理');
insert into POSITION (POSID, PNAME, PDESC)
values (3, '咨询经理', '完成咨询部日常管理');
insert into POSITION (POSID, PNAME, PDESC)
values (4, '咨询师', '完成日常咨询任务');
insert into POSITION (POSID, PNAME, PDESC)
values (5, '讲师', '完成日常授课任务，优化课程设计');
insert into POSITION (POSID, PNAME, PDESC)
values (6, '财务经理', '完成日常财务工作');
commit;
prompt 6 records loaded
prompt Loading DEPT...
insert into DEPT (DEPTNO, DEPTNAME, LOCATION)
values (1, '总裁办', '502');
insert into DEPT (DEPTNO, DEPTNAME, LOCATION)
values (4, '教务部', '304');
insert into DEPT (DEPTNO, DEPTNAME, LOCATION)
values (2, '教学部', '302');
insert into DEPT (DEPTNO, DEPTNAME, LOCATION)
values (3, '咨询部', '204');
insert into DEPT (DEPTNO, DEPTNAME, LOCATION)
values (5, '宿管部', '608');
insert into DEPT (DEPTNO, DEPTNAME, LOCATION)
values (6, '财务部', '503');
commit;
prompt 6 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (EMPID, PASSWORD, DEPTNO, POSID, MGRID, REALNAME, SEX, BIRTHDATE, HIREDATE, LEAVEDATE, ONDUTY, EMPTYPE, PHONE, QQ, EMERCONTACTPERSON, IDCARD)
values ('gaoqi', '123456', 1, 1, null, '高琪', null, null, null, null, null, 2, null, null, null, null);
insert into EMPLOYEE (EMPID, PASSWORD, DEPTNO, POSID, MGRID, REALNAME, SEX, BIRTHDATE, HIREDATE, LEAVEDATE, ONDUTY, EMPTYPE, PHONE, QQ, EMERCONTACTPERSON, IDCARD)
values ('liukaili', '123456', 2, 2, 'gaoqi', '刘凯立', '男', to_date('12-12-1982', 'dd-mm-yyyy'), to_date('24-12-2010', 'dd-mm-yyyy'), null, 1, 2, '12345678901', '12345678', '刘夫人12345678901', '123456123456781234');
insert into EMPLOYEE (EMPID, PASSWORD, DEPTNO, POSID, MGRID, REALNAME, SEX, BIRTHDATE, HIREDATE, LEAVEDATE, ONDUTY, EMPTYPE, PHONE, QQ, EMERCONTACTPERSON, IDCARD)
values ('jiayansh', '123456', 3, 3, 'gaoqi', '贾颜双', '女', to_date('23-12-1992', 'dd-mm-yyyy'), to_date('23-12-2010', 'dd-mm-yyyy'), null, 1, 2, '12345678901', '12345678', '贾母12345678901', '123456123456781234');
insert into EMPLOYEE (EMPID, PASSWORD, DEPTNO, POSID, MGRID, REALNAME, SEX, BIRTHDATE, HIREDATE, LEAVEDATE, ONDUTY, EMPTYPE, PHONE, QQ, EMERCONTACTPERSON, IDCARD)
values ('gaojiazhi', '123456', 2, 5, 'liukaili', '高佳志', '男', to_date('12-12-1982', 'dd-mm-yyyy'), to_date('11-06-2016', 'dd-mm-yyyy'), null, 1, 1, '12345678901', '12345678', '高夫人', '123456123456781234');
insert into EMPLOYEE (EMPID, PASSWORD, DEPTNO, POSID, MGRID, REALNAME, SEX, BIRTHDATE, HIREDATE, LEAVEDATE, ONDUTY, EMPTYPE, PHONE, QQ, EMERCONTACTPERSON, IDCARD)
values ('lifuying', '123456', 6, 6, 'gaoqi', '李芙英', '女', null, null, null, 1, 2, null, null, null, null);
commit;
prompt 5 records loaded
prompt Loading EXPENSE...
insert into EXPENSE (EXPID, EMPID, TOTALAMOUNT, EXPTIME, EXPDESC, NEXTAUDITOR, LASTRESULT, STATUS)
values (63, 'liukaili', 630, to_date('27-06-2018', 'dd-mm-yyyy'), '通信费用和其他', null, '通过', '5');
insert into EXPENSE (EXPID, EMPID, TOTALAMOUNT, EXPTIME, EXPDESC, NEXTAUDITOR, LASTRESULT, STATUS)
values (61, 'gaojiazhi', 1700, to_date('27-06-2018', 'dd-mm-yyyy'), '6月份通信费用办公室耗材其他团建费用', null, '通过', '5');
insert into EXPENSE (EXPID, EMPID, TOTALAMOUNT, EXPTIME, EXPDESC, NEXTAUDITOR, LASTRESULT, STATUS)
values (62, 'gaojiazhi', 3200, to_date('27-06-2018', 'dd-mm-yyyy'), '住宿费用和房租水电', null, '通过', '5');
commit;
prompt 3 records loaded
prompt Loading AUDITING...
insert into AUDITING (AUDITID, EXPID, EMPID, RESULT, AUDITDESC, TIME)
values (23, 63, 'gaoqi', '通过', '同意报销；财务及时处理', to_date('27-06-2018 11:17:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into AUDITING (AUDITID, EXPID, EMPID, RESULT, AUDITDESC, TIME)
values (24, 62, 'gaoqi', '通过', '同意报销；财务及时处理', to_date('27-06-2018 11:18:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into AUDITING (AUDITID, EXPID, EMPID, RESULT, AUDITDESC, TIME)
values (21, 61, 'liukaili', '通过', '同意报销；财务及时处理', to_date('27-06-2018 11:16:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into AUDITING (AUDITID, EXPID, EMPID, RESULT, AUDITDESC, TIME)
values (22, 62, 'liukaili', '通过', '同意报销；', to_date('27-06-2018 11:16:43', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 4 records loaded
prompt Loading DUTY...
insert into DUTY (DTID, EMPID, DTDATE, SIGNINTIME, SIGNOUTTIME)
values (24, 'jiayansh', to_date('14-06-2018', 'dd-mm-yyyy'), '02:29:08', '02:29:10');
insert into DUTY (DTID, EMPID, DTDATE, SIGNINTIME, SIGNOUTTIME)
values (22, 'liukaili', to_date('14-06-2018', 'dd-mm-yyyy'), '12:07:44', '02:27:33');
insert into DUTY (DTID, EMPID, DTDATE, SIGNINTIME, SIGNOUTTIME)
values (23, 'gaojiazhi', to_date('14-06-2018', 'dd-mm-yyyy'), '12:09:24', '02:28:07');
commit;
prompt 3 records loaded
prompt Loading EXPENSEITEM...
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (65, 62, '4', 200, '2月个水电');
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (66, 63, '1', 230, '6月份通信费用');
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (67, 63, '5', 400, '团建费用2');
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (61, 61, '1', 200, null);
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (62, 61, '2', 500, '墨盒打印纸');
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (63, 61, '5', 1000, '团建费用');
insert into EXPENSEITEM (ITEMID, EXPID, TYPE, AMOUNT, ITEMDESC)
values (64, 62, '3', 3000, '外出住宿如家酒店');
commit;
prompt 7 records loaded
prompt Loading EXPIMAGE...
prompt Table is empty
prompt Loading INCOME...
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (1, 200, to_date('02-06-2018', 'dd-mm-yyyy'), '人员外包', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (2, 300, to_date('24-05-2018', 'dd-mm-yyyy'), '项目开发', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (3, 100, to_date('22-06-2016', 'dd-mm-yyyy'), '报名费', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (4, 200, to_date('24-04-2018', 'dd-mm-yyyy'), '学费 ', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (5, 500, to_date('14-06-2018', 'dd-mm-yyyy'), '其他', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (6, 400, to_date('24-03-2018', 'dd-mm-yyyy'), '人员外包', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (7, 100, to_date('04-04-2017', 'dd-mm-yyyy'), '项目开发', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (8, 200, to_date('10-03-2018', 'dd-mm-yyyy'), '报名费', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (9, 300, to_date('13-08-2015', 'dd-mm-yyyy'), '学费 ', null, 'lifuying');
insert into INCOME (ICID, AMOUNT, ICDATE, ICTYPE, INDESC, USERID)
values (10, 200, to_date('04-08-2017', 'dd-mm-yyyy'), '其他', null, 'lifuying');
commit;
prompt 10 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (PID, PAYEMPID, AMOUNT, PAYTIME, EXPID, EXPEMPID)
values (3, 'lifuying', 3200, to_date('27-06-2017 11:39:30', 'dd-mm-yyyy hh24:mi:ss'), 62, 'gaojiazhi');
insert into PAYMENT (PID, PAYEMPID, AMOUNT, PAYTIME, EXPID, EXPEMPID)
values (1, 'lifuying', 630, to_date('27-06-2018 11:38:49', 'dd-mm-yyyy hh24:mi:ss'), 63, 'liukaili');
insert into PAYMENT (PID, PAYEMPID, AMOUNT, PAYTIME, EXPID, EXPEMPID)
values (2, 'lifuying', 1700, to_date('27-08-2018 11:39:14', 'dd-mm-yyyy hh24:mi:ss'), 61, 'gaojiazhi');
commit;
prompt 3 records loaded
prompt Enabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE enable constraint FK_EMPLOYEE_REFERENCE_DEPT;
alter table EMPLOYEE enable constraint FK_EMPLOYEE_REFERENCE_EMPLOYEE;
alter table EMPLOYEE enable constraint FK_EMPLOYEE_REFERENCE_POSITION;
prompt Enabling foreign key constraints for EXPENSE...
alter table EXPENSE enable constraint FK_EXPENSE_REFERENCE_EMPLOYEE;
prompt Enabling foreign key constraints for AUDITING...
alter table AUDITING enable constraint FK_AUDITING_REFERENCE_EMPLOYEE;
alter table AUDITING enable constraint FK_AUDITING_REFERENCE_EXPENSE;
prompt Enabling foreign key constraints for DUTY...
alter table DUTY enable constraint FK_DUTY_REFERENCE_EMPLOYEE;
prompt Enabling foreign key constraints for EXPENSEITEM...
alter table EXPENSEITEM enable constraint FK_EXPENSEI_REFERENCE_EXPENSE;
prompt Enabling foreign key constraints for EXPIMAGE...
alter table EXPIMAGE enable constraint FK_EXPIMAGE_REFERENCE_EXPENSE;
prompt Enabling foreign key constraints for INCOME...
alter table INCOME enable constraint FK_INCOME_REFERENCE_EMPLOYEE;
prompt Enabling foreign key constraints for PAYMENT...
alter table PAYMENT enable constraint FK_PAYMENT_REFERENCE_EXPENSE;
prompt Enabling triggers for POSITION...
alter table POSITION enable all triggers;
prompt Enabling triggers for DEPT...
alter table DEPT enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for EXPENSE...
alter table EXPENSE enable all triggers;
prompt Enabling triggers for AUDITING...
alter table AUDITING enable all triggers;
prompt Enabling triggers for DUTY...
alter table DUTY enable all triggers;
prompt Enabling triggers for EXPENSEITEM...
alter table EXPENSEITEM enable all triggers;
prompt Enabling triggers for EXPIMAGE...
alter table EXPIMAGE enable all triggers;
prompt Enabling triggers for INCOME...
alter table INCOME enable all triggers;
prompt Enabling triggers for PAYMENT...
alter table PAYMENT enable all triggers;
set feedback on
set define on
prompt Done.
