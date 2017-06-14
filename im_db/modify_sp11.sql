/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : te
Source Server Version : 110200
Source Host           : 10.211.64.108:1521
Source Schema         : IM

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2016-04-07 14:00:35
*/


-- ----------------------------
-- Table structure for IM_CSSESSION_INFO
-- ----------------------------

CREATE TABLE "IM"."IM_CSSESSION_INFO" (
"I_SESSION_ID" NUMBER(20) NOT NULL PRIMARY KEY, 
"I_CUSTOMER_ID" NUMBER(20) NOT NULL ,
"I_CUSTOMER_LEVEL" NUMBER(20) NOT NULL ,
"I_SERVICE_ID" NUMBER(20) NOT NULL ,
"I_SESSION_START_TIME" NUMBER(20) NOT NULL ,
"I_SESSION_END_TIME" NUMBER(20) NULL ,
"I_WAITING_DURATION" NUMBER(20) NULL ,
"I_FROM_DEVICE" NUMBER(3) NULL ,
"I_FROM_PAGE" NUMBER(5) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  DEFAULT systimestamp  NOT NULL 
)
TABLESPACE ecsdata;

COMMENT ON TABLE "IM"."IM_CSSESSION_INFO" IS '�ͷ��Ự��Ϣ��';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_SESSION_ID" IS 'session ID';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_CUSTOMER_ID" IS '�ͻ�ID';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_CUSTOMER_LEVEL" IS '�ͻ��ȼ�';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_SERVICE_ID" IS '�ͷ�ID';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_SESSION_START_TIME" IS '�Ự��ʼʱ��';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_SESSION_END_TIME" IS '�Ự����ʱ��';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_WAITING_DURATION" IS '�ȴ�ʱ��';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_FROM_DEVICE" IS '�豸����';
COMMENT ON COLUMN "IM"."IM_CSSESSION_INFO"."I_FROM_PAGE" IS '�������';

-- ----------------------------
-- Checks structure for table IM_CSSESSION_INFO
-- ----------------------------
ALTER TABLE "IM"."IM_CSSESSION_INFO" ADD CHECK ("I_SESSION_ID" IS NOT NULL);
ALTER TABLE "IM"."IM_CSSESSION_INFO" ADD CHECK ("I_CUSTOMER_ID" IS NOT NULL);
ALTER TABLE "IM"."IM_CSSESSION_INFO" ADD CHECK ("I_SERVICE_ID" IS NOT NULL);
ALTER TABLE "IM"."IM_CSSESSION_INFO" ADD CHECK ("I_SESSION_START_TIME" IS NOT NULL);

CREATE SEQUENCE "IM"."SEQ_IM_CSSESSION_INFO" 
INCREMENT BY 1 
START WITH 1 
NOMAXVALUE 
NOCYCLE
NOCACHE ;