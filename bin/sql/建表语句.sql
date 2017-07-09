CREATE DATABASE `human` DEFAULT CHARACTER SET 'utf8';

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PersonCode` VARCHAR(10) COMMENT '编码',
  `PersonGuid` VARCHAR(32) COMMENT 'guid',
  `PersonName` VARCHAR(100) COMMENT '名称',
  `BirthDate` DATETIME COMMENT '出生日期',
  `Gender` TINYINT(1) COMMENT '性别',
  `CreateTime` DATETIME COMMENT '创建时间',
  `CreateOperatorId` INT(11) COMMENT '创建人,member_operator.id',
  `UpdateTime` DATETIME COMMENT '更新时间',
  `UpdateOperatorId` INT(11) COMMENT '更新人,member_operator.id',
  PRIMARY KEY (`Id`)
) COMMENT='人物信息表';


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `RoleName` VARCHAR(100) COMMENT '角色名称',
  `RoleDesc` VARCHAR(100) COMMENT '角色信息描述',
  `CreateTime` DATETIME COMMENT '创建时间',
  `CreateOperatorId` INT(11) COMMENT '创建人,member_operator.id',
  `UpdateTime` DATETIME COMMENT '更新时间',
  `UpdateOperatorId` INT(11) COMMENT '更新人,member_operator.id',
  PRIMARY KEY (`Id`)
) COMMENT='人物角色表';



DROP TABLE IF EXISTS `person_role_relation`;
CREATE TABLE `person_role_relation` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PersonId` INT(11) NOT NULL COMMENT '人物id，对应person表的id',
  `RoleId` INT(11) NOT NULL COMMENT '角色id，对应role表的id',
  `CreateTime` DATETIME COMMENT '创建时间',
  `CreateOperatorId` INT(11) COMMENT '创建人,member_operator.id',
  `UpdateTime` DATETIME COMMENT '更新时间',
  `UpdateOperatorId` INT(11) COMMENT '更新人,member_operator.id',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `idx_PersonId_RoleId`(`PersonId`,`RoleId`)
) COMMENT='人物、角色关系对应表';
