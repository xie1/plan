/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : weixin

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-10-14 14:22:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base_config`
-- ----------------------------
DROP TABLE IF EXISTS `base_config`;
CREATE TABLE `base_config` (
  `config_id` varchar(50) NOT NULL COMMENT '参数ID',
  `config_name` varchar(100) DEFAULT NULL COMMENT '参数名称',
  `config_value` varchar(100) DEFAULT NULL COMMENT '参数值',
  `config_desc` varchar(256) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数配置表';

-- ----------------------------
-- Records of base_config
-- ----------------------------
INSERT INTO `base_config` VALUES ('CANNOT_MODIFIED_ROLE_ID', '系统中不允许修改的角色ID', 'ADMIN', '系统中不允许修改的角色ID，多个之前用,分隔');
INSERT INTO `base_config` VALUES ('CANNOT_MODIFIED_USER_ID', '系统中不允许修改的用户ID', 'admin', '系统中不允许修改的用户ID，多个之前用,分隔');
INSERT INTO `base_config` VALUES ('INTERFACE_EXTERNAL_LISTEN_PORT', '对外接口服务监听端口', '16666', '');
INSERT INTO `base_config` VALUES ('INTRANET_LAND_IP', '内网登录IP', '219.133.35.58', '配置允许登录的内网IP');
INSERT INTO `base_config` VALUES ('IS_PRODUCTION_ENVIRONMENT', '是否生产环境', 'N', '判断是否生产环境，有些方法只能在生产环境中运行');
INSERT INTO `base_config` VALUES ('PAGE_LIST', '页面每页条数列表', '20,30,50,100', '');
INSERT INTO `base_config` VALUES ('SYSTEM_NAME', '系统名称', '大财子后台管理系统', '配置系统的名称');
INSERT INTO `base_config` VALUES ('USE_RANDOM_CODE', '登录页面是否使用验证码', '0', '登录页面是否使用验证码(0:不使用,1:使用短信/邮箱验证码,2:使用图片验证码)');

-- ----------------------------
-- Table structure for `base_opt`
-- ----------------------------
DROP TABLE IF EXISTS `base_opt`;
CREATE TABLE `base_opt` (
  `opt_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `opt_val` varchar(255) DEFAULT NULL COMMENT '字典设值',
  `opt_name` varchar(255) DEFAULT NULL COMMENT '字典显示名称',
  `opt_type_id` varchar(255) DEFAULT NULL COMMENT '字典分类，关联表BASE_OPT_TYPE（废弃）',
  `opt_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `order_by` int(11) DEFAULT NULL COMMENT '显示顺序',
  `reserver1` varchar(255) DEFAULT NULL COMMENT '保留字段1',
  `opt_type_key` varchar(255) DEFAULT NULL COMMENT '字典分类KEY，关联表BASE_OPT_TYPE',
  PRIMARY KEY (`opt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=816 DEFAULT CHARSET=utf8 COMMENT='数据字典表，主要用于界面上下拉列表框选项的配置';

-- ----------------------------
-- Records of base_opt
-- ----------------------------
INSERT INTO `base_opt` VALUES ('814', '1', '是', '812', '', '1', '', 'YES_OR_NO');
INSERT INTO `base_opt` VALUES ('815', '0', '否', '812', '', '2', '', 'YES_OR_NO');

-- ----------------------------
-- Table structure for `base_opt_type`
-- ----------------------------
DROP TABLE IF EXISTS `base_opt_type`;
CREATE TABLE `base_opt_type` (
  `opt_type_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '分类编号，使用公共序列',
  `opt_type_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父级分类，暂时保留',
  `opt_type_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `opt_type_key` varchar(255) DEFAULT NULL COMMENT '分类键值，BASE_OPT表关联此字段',
  PRIMARY KEY (`opt_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_opt_type
-- ----------------------------
INSERT INTO `base_opt_type` VALUES ('812', '是否标识', '0', '', 'YES_OR_NO');

-- ----------------------------
-- Table structure for `company_struct`
-- ----------------------------
DROP TABLE IF EXISTS `company_struct`;
CREATE TABLE `company_struct` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织机构ID',
  `struct_name` varchar(50) DEFAULT NULL COMMENT '组织机构名称',
  `p_struct_id` int(11) DEFAULT NULL COMMENT '组织机构上级ID',
  `status` int(11) DEFAULT NULL COMMENT '合作状态',
  `struct_type` varchar(20) DEFAULT NULL COMMENT '组织机构类型',
  `type` varchar(4) DEFAULT NULL COMMENT '机构、门店类型',
  `struct_leader_name` varchar(50) DEFAULT NULL COMMENT '机构负责人名称',
  `struct_leader_phone` varchar(20) DEFAULT NULL COMMENT '负责人电话',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `insert_by` varchar(255) DEFAULT NULL COMMENT '插入人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `short_name` varchar(20) DEFAULT NULL COMMENT '机构简称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_struct
-- ----------------------------
INSERT INTO `company_struct` VALUES ('1', '大财子', '0', '0', 'CHAIN_STORE', '0', 'gafdS', 'SDSA', null, '2015-11-25 10:29:30', 'admin', '2015-11-25 10:29:30', null, 'RRJC');

-- ----------------------------
-- Table structure for `log_oper`
-- ----------------------------
DROP TABLE IF EXISTS `log_oper`;
CREATE TABLE `log_oper` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID，关联USER_INFO',
  `ip_addr` varchar(255) DEFAULT NULL COMMENT '操作员IP地址',
  `oper_source` varchar(255) DEFAULT NULL COMMENT '操作来源 拦截器/控制器',
  `oper_func` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `oper_type` varchar(255) DEFAULT NULL COMMENT '操作类型 增/删/改/导入/导出/..',
  `oper_target` varchar(255) DEFAULT NULL COMMENT '操作目标',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `url` varchar(4000) DEFAULT NULL COMMENT 'URL地址',
  `content` varchar(4000) DEFAULT NULL COMMENT '操作内容',
  `remark` varchar(4000) DEFAULT NULL COMMENT '备注',
  `result` varchar(255) DEFAULT NULL COMMENT '操作结果 成功/失败',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_oper
-- ----------------------------
INSERT INTO `log_oper` VALUES ('354', 'admin', '113.91.173.0, 10.10.10.1', 'INTERCEPTOR', '用户信息', 'INSERT', 'longyong', '2016-01-26 19:17:10', 'http://ceshi4.szrrjc.com/dacaizi/permission/userInfo/doAdd.do?remark=&roleIdListString=ADMIN,CUSTOMER&duty=&userId=longyong&userName=龙泳&mobilePhone=18807301126&email=&deptId=MANAGEMENT', '添加用户信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('355', 'admin', '113.91.173.0, 10.10.10.1', 'INTERCEPTOR', '用户信息', 'DELETE', '', '2016-01-26 19:17:51', 'http://ceshi4.szrrjc.com/dacaizi/permission/userInfo/doDelete.do', '删除用户信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('356', 'admin', '113.91.173.0, 10.10.10.1', 'INTERCEPTOR', '用户信息', 'INSERT', 'lonyong', '2016-01-26 19:18:12', 'http://ceshi4.szrrjc.com/dacaizi/permission/userInfo/doAdd.do?remark=aaa&roleIdListString=ADMIN&duty=aaa&userId=lonyong&userName=龙泳&mobilePhone=18807301126&email=ilongyong@qq.com&deptId=OPERATION', '添加用户信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('357', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-01-28 18:08:23', 'http://localhost:81/dacaiziManage/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('358', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-02-01 13:43:55', 'http://localhost:81/dacaiziManage/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=消息管理&status=1&pFuncId=0&link=/im/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('359', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'UPDATE', '02', '2016-02-01 13:44:08', 'http://localhost:81/dacaiziManage/permission/userFunc/doUpdate.do?funcId=02&funcFlag=0&orderBy=2&funcName=消息管理&status=1&pFuncId=&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息02', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('360', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-02-01 13:44:39', 'http://localhost:81/dacaiziManage/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=消息发送&status=1&pFuncId=02&link=/im/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('361', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-02-01 13:44:52', 'http://localhost:81/dacaiziManage/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('362', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-02-01 13:46:03', 'http://localhost:81/dacaiziManage/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('363', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-16 16:19:59', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=用户管理&status=1&pFuncId=0&link=#&funcDesc=用户管理&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('364', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-16 16:20:43', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=查看用户&status=1&pFuncId=03&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('365', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0301', '2016-03-16 16:21:29', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0301&funcFlag=0&orderBy=301&funcName=查看用户&status=1&pFuncId=&link=/user/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0301', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('366', 'admin', '192.168.1.239', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-16 16:21:59', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('367', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0301', '2016-03-16 16:39:17', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0301&funcFlag=0&orderBy=301&funcName=查看用户&status=1&pFuncId=&link=/user/baseOption/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0301', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('368', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-18 16:06:23', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=反馈&status=1&pFuncId=03&link=/my/feedback/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('369', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-18 16:06:45', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=举报&status=1&pFuncId=03&link=/my/report/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('370', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-18 16:06:54', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('371', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-18 16:45:51', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=认证管理&status=1&pFuncId=0&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('372', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-18 16:48:22', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=图片认证&status=1&pFuncId=04&link=/my/imgAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('373', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-18 16:52:07', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('374', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-22 11:20:34', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=财务管理&status=1&pFuncId=0&link=#&funcDesc=财务管理&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('375', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-22 11:21:48', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=提现管理&status=1&pFuncId=05&link=/finance/withdraw/index.do&funcDesc=提现管理&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('376', 'admin', '192.168.1.239', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 11:21:57', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('377', 'admin', '192.168.1.239', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 11:24:01', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('378', 'admin', '192.168.1.239', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 11:24:30', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('379', 'admin', '192.168.1.239', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 11:24:40', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('380', 'admin', '192.168.1.239', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0301', '2016-03-22 11:33:44', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0301&funcFlag=0&orderBy=301&funcName=查看用户&status=1&pFuncId=&link=/my/baseOption/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0301', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('381', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0401', '2016-03-22 15:57:17', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0401&funcFlag=0&orderBy=401&funcName=头像认证&status=1&pFuncId=&link=/my/imgAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0401', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('382', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-22 15:58:18', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=相册审核&status=1&pFuncId=04&link=#&funcDesc=/my/albumAudit/index.do&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('383', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0401', '2016-03-22 15:59:34', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0401&funcFlag=0&orderBy=401&funcName=头像审核&status=1&pFuncId=&link=/my/imgAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0401', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('384', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0402', '2016-03-22 15:59:58', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0402&funcFlag=0&orderBy=402&funcName=相册审核&status=1&pFuncId=&link=/my/albumAudit/index.do&funcDesc=相册审核&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0402', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('385', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0401', '2016-03-22 16:00:20', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0401&funcFlag=0&orderBy=401&funcName=头像审核&status=1&pFuncId=&link=/my/imgAudit/index.do&funcDesc=头像审核&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0401', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('386', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 16:01:46', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('387', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 16:01:55', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('388', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0402', '2016-03-22 16:09:14', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0402&funcFlag=0&orderBy=402&funcName=相册认证&status=1&pFuncId=&link=/my/albumAudit/index.do&funcDesc=相册认证&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0402', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('389', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0401', '2016-03-22 16:09:40', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0401&funcFlag=0&orderBy=401&funcName=头像认证&status=1&pFuncId=&link=/my/imgAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0401', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('390', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0402', '2016-03-22 16:09:53', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0402&funcFlag=0&orderBy=402&funcName=相册认证&status=1&pFuncId=&link=/my/albumAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0402', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('391', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-22 20:05:18', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=车辆认证&status=1&pFuncId=04&link=/my/carAuth/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('392', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-22 20:06:31', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=形象认证&status=1&pFuncId=04&link=/my/videoAuth/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('393', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-22 20:09:51', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('394', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-24 20:01:46', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=愿望标签&status=1&pFuncId=02&link=/my/desireTemplate/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('395', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0202', '2016-03-24 20:02:36', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0202&funcFlag=0&orderBy=202&funcName=愿望模板&status=1&pFuncId=&link=/my/desireTemplate/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0202', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('396', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-24 20:03:23', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=标签模板&status=1&pFuncId=02&link=/my/tagTemplate/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('397', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-24 20:04:21', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('398', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-25 15:41:23', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=小黑屋&status=1&pFuncId=03&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('399', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-25 15:41:41', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('400', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-25 15:41:51', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('401', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0304', '2016-03-25 15:48:20', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0304&funcFlag=0&orderBy=304&funcName=小黑屋&status=1&pFuncId=&link=/my/darkRoom/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0304', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('402', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-28 16:47:00', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=其他管理&status=1&pFuncId=0&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('403', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-28 16:47:26', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('404', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-28 16:48:27', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=标签模板&status=1&pFuncId=06&link=/my/tagTemplate/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('405', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-03-28 16:48:49', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=愿望模板&status=1&pFuncId=06&link=/my/desireTemplate/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('406', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-03-28 16:49:00', 'http://localhost:8083/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('407', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-03-28 16:49:12', 'http://localhost:8083/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('408', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-28 16:49:24', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('409', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-03-28 16:49:42', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('410', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-04-20 15:00:25', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=银行卡管理&status=1&pFuncId=05&link=/finance/bankcard/index.do&funcDesc=银行卡管理&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('411', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-04-20 15:01:05', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('412', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-04-20 15:01:11', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('413', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-04-20 15:01:16', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('414', 'admin', '192.168.1.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0401', '2016-04-27 16:39:35', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0401&funcFlag=0&orderBy=401&funcName=头像认证&status=1&pFuncId=&link=/my/headimgAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0401', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('415', 'admin', '192.168.1.129', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0401', '2016-04-27 16:48:11', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0401&funcFlag=0&orderBy=401&funcName=头像认证&status=1&pFuncId=&link=/my/imgAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0401', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('416', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-05-12 11:52:56', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=银行卡充值渠道管理&status=1&pFuncId=05&link=/finance/bankChannal/index.do&funcDesc=银行卡充值渠道管理&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('417', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-05-12 11:53:15', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('418', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0503', '2016-05-12 15:20:36', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0503&funcFlag=0&orderBy=503&funcName=充值渠道管理&status=1&pFuncId=&link=/finance/bankChannal/index.do&funcDesc=充值渠道管理&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0503', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('419', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-05-12 15:21:43', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=充值记录&status=1&pFuncId=05&link=/finance/rechargeRecord/index.do&funcDesc=充值记录&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('420', 'admin', '192.168.1.231', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-05-12 15:21:53', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('421', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'UPDATE', '02', '2016-07-26 11:38:42', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=02&funcFlag=0&orderBy=2&funcName=用户管理&status=1&pFuncId=&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息02', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('422', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-07-26 11:39:23', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=查看用户&status=1&pFuncId=02&link=/my/baseOption/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('423', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-07-26 11:40:15', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=相册认证&status=1&pFuncId=02&link=/my/albumAudit/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('424', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-07-26 11:41:05', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=标签模板&status=1&pFuncId=02&link=/my/tagTemplate/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('425', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-07-26 11:41:15', 'http://localhost:8083/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('426', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-07-26 11:41:29', 'http://localhost:8083/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('427', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-07-26 11:42:29', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('428', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-07-26 11:44:53', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('429', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-07-26 11:45:18', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('430', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-07-26 11:46:18', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('431', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-07-26 11:46:24', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('432', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-07-26 17:23:21', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=测试&status=1&pFuncId=02&link=/test/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('433', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-07-26 17:23:43', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('434', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0205', '2016-08-16 15:23:44', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0205&funcFlag=0&orderBy=205&funcName=测试&status=1&pFuncId=&link=/community/product.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0205', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('435', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0205', '2016-08-16 15:27:14', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0205&funcFlag=0&orderBy=205&funcName=测试&status=1&pFuncId=&link=/community/product/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0205', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('436', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-08-19 14:54:35', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=社区管理&status=1&pFuncId=0&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('437', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-08-19 14:55:11', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=服务管理&status=1&pFuncId=04&link=/community/product/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('438', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-19 14:55:20', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('439', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-19 14:55:27', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('440', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-19 14:55:35', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('441', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-08-23 15:09:04', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=反馈管理&status=1&pFuncId=04&link=/community/feedback/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('442', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-23 15:09:11', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('443', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-23 15:09:17', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('444', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-23 15:09:22', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('445', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-08-24 16:11:53', 'http://localhost:8083/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('446', 'admin', '192.168.2.129', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-08-24 19:55:30', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=帖子管理&status=1&pFuncId=04&link=/community/bbs/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('447', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-24 19:55:41', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('448', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-24 19:56:28', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('449', 'admin', '192.168.2.129', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-25 13:38:35', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('450', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0205', '2016-08-25 14:53:18', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0205&funcFlag=0&orderBy=205&funcName=测试&status=1&pFuncId=&link=/community/holiday/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0205', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('451', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-08-25 15:18:00', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=节假日设置&status=1&pFuncId=04&link=/community/holiday/index.do&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('452', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-25 15:18:10', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('453', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-25 15:18:16', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('454', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-25 15:18:23', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('455', 'admin', '192.168.2.32', 'INTERCEPTOR', '菜单信息', 'INSERT', '', '2016-08-26 10:30:13', 'http://localhost:8083/permission/userFunc/doAdd.do?funcFlag=0&orderBy=&funcName=订单管理&status=1&pFuncId=04&link=#&funcDesc=&show=1&reserve2=&reserve1=&menuFlag=1', '添加菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('456', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-26 10:31:23', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('457', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-26 10:31:28', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('458', 'admin', '192.168.2.32', 'INTERCEPTOR', '角色菜单权限', 'UPDATE', '', '2016-08-26 10:31:33', 'http://localhost:8083/permission/userRoleFunc/doUpdate.do', '修改角色菜单权限', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('459', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0404', '2016-08-30 09:46:37', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0404&funcFlag=0&orderBy=401&funcName=订单管理&status=1&pFuncId=&link=#&funcDesc=订单管理&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0404', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('460', 'admin', '192.168.1.231', 'INTERCEPTOR', '菜单信息', 'UPDATE', '0404', '2016-08-30 10:08:43', 'http://localhost:8083/permission/userFunc/doUpdate.do?funcId=0404&funcFlag=0&orderBy=401&funcName=订单管理&status=1&pFuncId=&link=/community/order/index.do&funcDesc=订单管理&show=1&reserve2=&reserve1=&menuFlag=1', '修改菜单信息0404', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('461', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:02:56', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('462', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:04', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('463', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:13', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('464', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:19', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('465', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:29', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('466', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:33', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('467', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:39', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('468', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:43', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('469', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:48', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('470', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:51', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('471', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:03:55', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('472', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:04:03', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('473', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:04:14', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('474', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:04:20', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');
INSERT INTO `log_oper` VALUES ('475', 'admin', '127.0.0.1', 'INTERCEPTOR', '菜单信息', 'DELETE', '', '2016-10-13 17:04:23', 'http://localhost:8080/dcz-back/permission/userFunc/doDelete.do', '删除菜单信息', '', 'SUCCESS');

-- ----------------------------
-- Table structure for `log_user_login`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_login`;
CREATE TABLE `log_user_login` (
  `log_id` varchar(255) NOT NULL COMMENT '日志编号 程序生成',
  `session_id` varchar(255) DEFAULT NULL COMMENT '会话ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '操作员ID，关联表USEROPER',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '访问IP地址',
  `state` int(11) DEFAULT NULL COMMENT '状态 1-在线 0-离线',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '登出时间',
  `active_time` datetime DEFAULT NULL COMMENT '最近一次活动时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_user_login
-- ----------------------------
INSERT INTO `log_user_login` VALUES ('0030CE2F15AD4BDE901BE72A2CC65D4E', '0CC24D952E3FBA4D5DD3A1A6C0400230', 'admin', '192.168.2.32', '0', '2016-09-18 16:17:26', '2016-09-18 19:19:07', '2016-09-18 16:17:26');
INSERT INTO `log_user_login` VALUES ('0062B1C877204DD4A5C4B309D5E1BC93', '8EC7D8756415F5326FF28C4E48CF572C', 'admin', '192.168.1.239', '0', '2016-03-28 18:04:26', '2016-03-28 20:16:42', '2016-03-28 18:04:26');
INSERT INTO `log_user_login` VALUES ('01A362D7E85E48B9A5A46B7116EE075C', 'CF2F5EB57ED6BEB2791123EBE6902B28', 'admin', '192.168.1.231', '0', '2016-03-31 17:14:11', '2016-03-31 19:43:36', '2016-03-31 17:37:04');
INSERT INTO `log_user_login` VALUES ('01DE2DAE83FE43898EC33DE54D75A34F', 'EB8450B0BFC16FDEB4C3669BA38D1CE4', 'admin', '192.168.1.231', '0', '2016-03-25 15:42:13', '2016-03-26 14:02:57', '2016-03-25 15:47:03');
INSERT INTO `log_user_login` VALUES ('03E2DC45F1D442CD90EDA8D900397A79', '3347BF566B3CCF47B2B6EA5D5E8AE347', 'admin', '192.168.2.32', '0', '2016-04-05 19:26:48', '2016-04-06 15:35:30', '2016-04-05 19:32:41');
INSERT INTO `log_user_login` VALUES ('051E5D76F0B74DFE9DACC6AF5DB103E1', '7DD3CAF861E25E4F4BA7638C4A53AB1B', 'admin', '192.168.2.129', '0', '2016-08-24 14:56:41', '2016-08-24 17:11:16', '2016-08-24 14:56:41');
INSERT INTO `log_user_login` VALUES ('0560618DE62042BDAF31FA83701E3A2B', '6EB986D6E85499B8D3A1B906D68DEB1E', 'admin', '192.168.1.129', '0', '2016-05-03 15:46:07', '2016-05-03 17:52:00', '2016-05-03 15:46:07');
INSERT INTO `log_user_login` VALUES ('05651AC0BF314E53A594AFCD053F5425', '863816F1C7532BE92CE763A6B355AB4F', 'admin', '192.168.2.210', '0', '2016-03-31 19:43:28', '2016-03-31 21:52:15', '2016-03-31 19:43:28');
INSERT INTO `log_user_login` VALUES ('0583C2D0B7BD49198DFA5E6BC282BD76', '0FEA2254F644958F519050C0C6D823B6', 'admin', '113.91.173.0, 10.10.10.1', '0', '2016-01-26 20:00:33', '2016-01-26 20:05:51', '2016-01-26 20:05:47');
INSERT INTO `log_user_login` VALUES ('05FAB014A80640EEBFB06F9063FC7517', '919F02C904F9BDF5536E6D6CB32ACBD3', 'admin', '192.168.2.210', '0', '2016-03-31 17:15:49', '2016-03-31 20:24:18', '2016-03-31 18:15:17');
INSERT INTO `log_user_login` VALUES ('060B85DAEFEA45B582038DBA705CD839', '71B0376C291ACADCED3382AB15D89F60', 'admin', '192.168.2.129', '0', '2016-08-30 09:16:41', '2016-08-30 12:08:24', '2016-08-30 09:59:43');
INSERT INTO `log_user_login` VALUES ('06310670535841758139598AFF35BF86', 'D1005F5AB83E3C383BFB85A51F350424', 'admin', '127.0.0.1', '0', '2016-03-31 16:56:17', '2016-03-31 19:03:14', '2016-03-31 16:56:17');
INSERT INTO `log_user_login` VALUES ('07DB1C0733594D19BA49FF7A811103EC', '36B19830B6A63CBA70A5358D12CAAE70', 'admin', '192.168.1.239', '0', '2016-03-16 16:38:44', '2016-03-17 14:41:10', '2016-03-16 16:38:44');
INSERT INTO `log_user_login` VALUES ('08AB2D29CD3D4FCCAA5C68574C070783', 'A02F18F5FFFC9A0050D0AD34CE0C1AA2', 'admin', '192.168.2.129', '0', '2016-09-26 16:08:44', '2016-09-26 18:18:47', '2016-09-26 16:08:44');
INSERT INTO `log_user_login` VALUES ('08EBF6DFC8D6488C8F884133A40EF920', '2F933F9B112ED292CD08A758C98A8F8C', 'admin', '192.168.1.231', '0', '2016-05-25 10:44:29', '2016-05-25 12:53:32', '2016-05-25 10:44:29');
INSERT INTO `log_user_login` VALUES ('0964FA5F07A34CD19917501DD0A31466', '21134876380A8ED63767B9B8F6E03BE8', 'admin', '192.168.2.129', '0', '2016-08-30 10:25:22', '2016-08-30 12:38:24', '2016-08-30 10:33:03');
INSERT INTO `log_user_login` VALUES ('09EF8B1325B4478CB3111F39CA03948B', 'F6955AA78F9AC4C7DF024818DDE6B051', 'admin', '192.168.2.129', '0', '2016-08-19 14:02:26', '2016-08-19 16:14:02', '2016-08-19 14:02:26');
INSERT INTO `log_user_login` VALUES ('0AB0CCE9C8E74624BEC9C069365C5F07', 'EBE5F741C40DF67E587C06118AB0794F', 'admin', '192.168.1.239', '0', '2016-03-17 14:31:23', '2016-03-17 17:50:10', '2016-03-17 14:54:04');
INSERT INTO `log_user_login` VALUES ('0AEEEA696D9B4A5A96E5ABD657C04C65', 'CF11A2EF72314F1A97D418CF12923A7A', 'admin', '192.168.2.129', '0', '2016-03-24 13:59:23', '2016-03-24 16:19:08', '2016-03-24 14:13:45');
INSERT INTO `log_user_login` VALUES ('0B02F8AE9B7149B28F404F17CABA716F', 'B528A73F0ECBB10CF39557C6EA751122', 'admin', '192.168.2.32', '0', '2016-03-21 20:25:36', '2016-03-21 23:41:27', '2016-03-21 21:31:55');
INSERT INTO `log_user_login` VALUES ('0B8F0E80FFDE4C119828A3525A21868F', '2B4BC04FFF5CA0EB8BDB397F7652E624', 'admin', '192.168.2.32', '0', '2016-03-30 18:19:32', '2016-03-30 20:40:42', '2016-03-30 18:35:06');
INSERT INTO `log_user_login` VALUES ('0BCB74B65C3A4CBAB08B055FC82A1177', '2D7CFCFE941C8B434902B4DCF5B5862D', 'admin', '192.168.1.239', '0', '2016-03-17 15:47:05', '2016-03-17 18:00:10', '2016-03-17 15:47:05');
INSERT INTO `log_user_login` VALUES ('0BD048F3DF544564A49D93D670ED74EB', '0CA2B97D1DFE73893E70D88204FF2B75', 'admin', '192.168.2.129', '0', '2016-09-20 15:19:05', '2016-09-20 18:47:33', '2016-09-20 16:40:09');
INSERT INTO `log_user_login` VALUES ('0C3690F5FEE64F8A893DCCD118036EAE', '170CEA75FC6355BD4BB7F7CEB050A811', 'admin', '192.168.2.129', '0', '2016-03-23 16:17:04', '2016-03-23 18:50:32', '2016-03-23 16:45:27');
INSERT INTO `log_user_login` VALUES ('0C6FA9D30EFB4940A5DC8D87D5FF249E', 'FABDF942C5048DCE4A6CCAEE0B3BE20B', 'admin', '192.168.1.231', '0', '2016-03-31 11:20:36', '2016-03-31 13:29:26', '2016-03-31 11:20:36');
INSERT INTO `log_user_login` VALUES ('0D23A5BCC1214CAEA9EC1AC593875195', '1FBB474F6305899622418F7625A7C06D', 'admin', '192.168.1.129', '0', '2016-05-03 17:16:59', '2016-05-05 15:13:36', '2016-05-03 17:41:05');
INSERT INTO `log_user_login` VALUES ('0E35303D847C43379C81549EBACFF772', '22A9D6620A47D9822D4BBDDDC4A8937F', 'admin', '192.168.2.210', '0', '2016-04-26 11:27:47', '2016-04-26 13:42:12', '2016-04-26 11:27:47');
INSERT INTO `log_user_login` VALUES ('0E3B456D55AC41CBAD7371417630A0F2', '1862DD0BE9722193469509FC98F1ED54', 'admin', '127.0.0.1', '0', '2016-03-18 16:23:30', '2016-03-21 16:18:00', '2016-03-18 16:23:31');
INSERT INTO `log_user_login` VALUES ('0E9ACD7F5BF14CCAB9CF7AD06A09D431', '826009D36137B1D492B78ECFA6732B5A', 'admin', '192.168.2.32', '0', '2016-09-18 16:11:57', '2016-09-18 19:19:07', '2016-09-18 16:11:57');
INSERT INTO `log_user_login` VALUES ('0ED29AC44F924795805BB1C7EFD8233F', 'C3ABF325778E449229848FD0497839A3', 'admin', '192.168.1.129', '0', '2016-04-07 10:44:49', '2016-04-07 13:14:32', '2016-04-07 11:04:47');
INSERT INTO `log_user_login` VALUES ('0F90995F3ACD4F0CA01E3D9DC2C5FC73', '33181F847FE0A157A06E2C0569C2A7C2', 'admin', '192.168.2.129', '0', '2016-09-26 16:12:30', '2016-09-26 18:18:47', '2016-09-26 16:12:30');
INSERT INTO `log_user_login` VALUES ('0FA9DD9DED0F483DB24A48A67539A41C', 'F3987501F7FAD251D49A169081D702AF', 'admin', '192.168.2.129', '0', '2016-08-31 09:41:27', '2016-08-31 12:05:22', '2016-08-31 09:54:33');
INSERT INTO `log_user_login` VALUES ('10A27BC7247543DA9C0CB052F3AB0BE4', '5193CBA63CECC3CC7F2893FAC59380AD', 'admin', '192.168.2.32', '0', '2016-03-22 15:42:36', '2016-03-22 19:11:29', '2016-03-22 17:05:42');
INSERT INTO `log_user_login` VALUES ('119FC080D25A4F8DBA099EB52E6A7509', '0755A36BD502D0E097064348356A792C', 'admin', '192.168.2.32', '0', '2016-02-22 15:23:44', '2016-02-22 20:23:52', '2016-02-22 15:23:45');
INSERT INTO `log_user_login` VALUES ('11A740002383426F95F7997157941652', '4D79118412CCA5DE2E6E5F0CAF2FD259', 'admin', '192.168.2.129', '0', '2016-08-30 17:29:14', '2016-08-30 19:41:04', '2016-08-30 17:35:49');
INSERT INTO `log_user_login` VALUES ('11E03D2D521340B8BAAE4CE179B103C0', '4E615B06992C82A54BC9209E48F34106', 'admin', '192.168.2.32', '0', '2016-07-26 11:37:30', '2016-07-26 14:07:20', '2016-07-26 11:55:50');
INSERT INTO `log_user_login` VALUES ('1213F6A1396D46A1B84A6A7A43D30798', '91246E547650F21291154174039D07B0', 'admin', '192.168.2.32', '0', '2016-08-18 22:39:22', '2016-08-19 00:54:01', '2016-08-18 22:39:22');
INSERT INTO `log_user_login` VALUES ('12AD81F1FB024C478D6D898E20DC1110', 'A92E28B55A1CCCD6FA59E0F15EAD7F49', 'admin', '192.168.1.231', '0', '2016-08-30 17:32:20', '2016-08-30 19:41:04', '2016-08-30 17:32:20');
INSERT INTO `log_user_login` VALUES ('12E9D79A1ECD4789AB4DE97044E48D28', '960802DEE07CEF4063ED2EB99CF66A3A', 'admin', '192.168.2.129', '0', '2016-09-18 19:09:17', '2016-09-18 21:29:07', '2016-09-18 19:19:06');
INSERT INTO `log_user_login` VALUES ('13072D55B72A4C73AEA4AE31DAF9DD44', 'AC4F5DABEAECE66578E2C2DDF0895204', 'admin', '192.168.2.129', '0', '2016-09-19 17:20:05', '2016-09-19 22:09:48', '2016-09-19 19:55:40');
INSERT INTO `log_user_login` VALUES ('1427DC4EC9EB46069BA5F55C9EEC6964', 'E5063CA6376F82DA6D12EE261B3CF9CF', 'admin', '192.168.2.32', '0', '2016-08-17 14:08:37', '2016-08-17 16:44:57', '2016-08-17 14:37:49');
INSERT INTO `log_user_login` VALUES ('14797CE29A6C48AC90B16A283AAA8B86', '366C5B7AC334DB42073397EB93889393', 'admin', '192.168.2.129', '0', '2016-03-22 17:19:46', '2016-03-22 19:28:06', '2016-03-22 17:19:46');
INSERT INTO `log_user_login` VALUES ('147B4ACA13D7402AA9B6119E22752DD3', '4BCB0E1DC9F960F694C1AF73B96F975E', 'admin', '192.168.2.223', '0', '2016-03-22 16:56:06', '2016-03-22 19:01:29', '2016-03-22 16:56:06');
INSERT INTO `log_user_login` VALUES ('14FBD65B521442E0A17943A07D9DF296', '105D8321F8E5DF1217A8FB8F121D107E', 'admin', '192.168.2.32', '0', '2016-07-26 14:19:58', '2016-07-26 18:59:04', '2016-07-26 16:40:51');
INSERT INTO `log_user_login` VALUES ('15A7F0C94A6B4EF18DC3AB4A62F03972', '5B13A04CF1D143B6FB485BE6D6B540DF', 'admin', '192.168.2.129', '0', '2016-03-24 15:01:26', '2016-03-24 18:04:50', '2016-03-24 15:54:29');
INSERT INTO `log_user_login` VALUES ('1678DF620DB14480A95F026EFF1A2E84', 'C0A371A13E5B71FA89B4F8001CEFB67B', 'admin', '192.168.2.129', '0', '2016-09-26 19:40:32', '2016-09-26 21:51:35', '2016-09-26 19:40:32');
INSERT INTO `log_user_login` VALUES ('16A03D99269E4673AA17B5F11D1A6F18', '06D4318347C960C6926F01A034D69DCB', 'admin', '192.168.1.129', '0', '2016-03-25 15:58:08', '2016-03-26 14:02:57', '2016-03-25 17:12:36');
INSERT INTO `log_user_login` VALUES ('16B85C15E782435E90116ABA6C495F02', 'D51A03BC17FA747166B8313CB5619E44', 'admin', '192.168.2.32', '0', '2016-03-21 22:17:38', '2016-03-22 00:31:27', '2016-03-21 22:17:38');
INSERT INTO `log_user_login` VALUES ('16E201A330974D6AB61A7FF42A20A2F8', '5A7928E2B8E73B0599BE5AC79D90EDA5', 'admin', '192.168.3.117', '0', '2016-04-20 18:42:19', '2016-04-20 20:52:17', '2016-04-20 18:42:19');
INSERT INTO `log_user_login` VALUES ('171ADFEEFB6F4075B76C8118FB7B6EA3', '5E60696E1C9CC266F5F02483303AB61F', 'admin', '192.168.1.239', '0', '2016-03-30 15:14:39', '2016-03-30 17:40:01', '2016-03-30 15:29:43');
INSERT INTO `log_user_login` VALUES ('17926BC2D41543928ABD3FE756D93FCF', '91C8BEB9877E0C57D6DFE0A39944E2D5', 'admin', '192.168.2.32', '0', '2016-08-17 14:06:56', '2016-08-17 16:14:48', '2016-08-17 14:06:56');
INSERT INTO `log_user_login` VALUES ('17A429BCEC0041E0BCFDB6921DF98A3F', 'E0A499154A7E9162AF15CEA00A4589F3', 'admin', '192.168.2.32', '0', '2016-08-24 14:09:38', '2016-08-24 17:01:16', '2016-08-24 14:55:32');
INSERT INTO `log_user_login` VALUES ('17FA0161B18B426C9326DD74789A9A5D', '237D9D41DC33A1A1F157A34A2A57B9D9', 'admin', '192.168.2.129', '0', '2016-09-23 14:34:37', '2016-09-23 17:42:25', '2016-09-23 15:27:56');
INSERT INTO `log_user_login` VALUES ('1850CB43B3F1471C90A1D4A993343FCB', 'DC0B41F6CDA955996276706CFFA2C896', 'admin', '192.168.2.32', '0', '2016-07-26 14:09:52', '2016-07-26 16:20:05', '2016-07-26 14:09:52');
INSERT INTO `log_user_login` VALUES ('18C09893913140FE90B0DD1E14A708B5', '6E56F88A5A8D21AFC39268FA093F932E', 'admin', '192.168.2.129', '0', '2016-03-18 16:46:10', '2016-03-21 16:18:00', '2016-03-18 16:46:10');
INSERT INTO `log_user_login` VALUES ('198B418A357F49EF97257F91530FA367', '37D762EBF5FEE01E0AF718F36FB57810', 'admin', '192.168.2.32', '0', '2016-03-22 12:44:00', '2016-03-22 16:08:06', '2016-03-22 14:00:57');
INSERT INTO `log_user_login` VALUES ('19C6B30A30AB47E4AFAEF40C1EBD066C', '783DB4F2F33F04973E1887A953BB7865', 'admin', '192.168.2.32', '0', '2016-07-27 11:02:27', '2016-07-27 13:12:29', '2016-07-27 11:06:50');
INSERT INTO `log_user_login` VALUES ('19E07653B3D0489CB683B223C4CF2D61', 'D772AF3FECDDFB325D97EFB656EE9F42', 'admin', '192.168.2.129', '0', '2016-03-23 17:42:09', '2016-03-23 22:22:38', '2016-03-23 20:10:53');
INSERT INTO `log_user_login` VALUES ('19F4250C096B4ED3B7755BCAD7680B38', '791C0ACFC5B233FB5D1AAD9B922984F7', 'admin', '192.168.2.129', '0', '2016-08-25 10:07:42', '2016-08-25 13:01:17', '2016-08-25 10:47:10');
INSERT INTO `log_user_login` VALUES ('1A8916CC48F1400AADB799F0210A94CA', '1EAC85BB45BB9DEF628BFF4440656C88', 'admin', '113.91.173.0, 10.10.10.1', '0', '2016-01-26 18:32:21', '2016-01-26 18:34:31', '2016-01-26 18:32:21');
INSERT INTO `log_user_login` VALUES ('1B81B5E124854CD4ABDB18A26AD5109C', '6609FCB0465BADF693C292D5550C2213', 'admin', '192.168.1.239', '0', '2016-03-17 17:42:45', '2016-03-18 10:56:59', '2016-03-17 19:09:19');
INSERT INTO `log_user_login` VALUES ('1B830F2595974D2A817D980E4EC800C0', 'BACA9800FE1757532291A9880E158111', 'admin', '192.168.2.32', '0', '2016-08-30 10:01:46', '2016-08-30 12:08:24', '2016-08-30 10:01:46');
INSERT INTO `log_user_login` VALUES ('1B88EB9AD5B2496C9CAA80C6A87205CE', '9A92E899481BF69476263743058268F3', 'admin', '192.168.1.129', '0', '2016-04-07 10:05:47', '2016-04-07 12:34:32', '2016-04-07 10:28:33');
INSERT INTO `log_user_login` VALUES ('1B968A7430714134A03E6372439C6497', 'B68FFF4B75651488DAD38E6DA4C5E0B8', 'admin', '192.168.2.129', '0', '2016-09-29 11:23:46', '2016-09-29 13:48:32', '2016-09-29 11:23:46');
INSERT INTO `log_user_login` VALUES ('1BB2102FBA4C434AB67D5E5DEAA09E1D', '364633BDDC504B3E7BF041FDDB3D1CAA', 'admin', '192.168.2.223', '0', '2016-05-11 22:01:30', '2016-05-12 11:56:52', '2016-05-11 22:01:30');
INSERT INTO `log_user_login` VALUES ('1C3B992C28BE437AAA5E736362E57AD8', '61A6F6D05471DB90D880879F2A2B7D49', 'admin', '192.168.2.129', '0', '2016-09-08 14:17:16', '2016-09-08 16:37:51', '2016-09-08 14:30:37');
INSERT INTO `log_user_login` VALUES ('1C7527247AD84B5F963DCDE8760B5F08', '6B51B135AC2EF8C03C82B55D74BDFE92', 'admin', '192.168.1.231', '0', '2016-04-20 15:01:27', '2016-04-20 17:09:40', '2016-04-20 15:01:27');
INSERT INTO `log_user_login` VALUES ('1D172A60E4254DEE92D8808AE2DAC39A', '2B66EA1043A90D9A265227CB4BBF1E50', 'admin', '113.99.100.42, 10.10.10.1', '0', '2016-03-21 17:15:46', '2016-03-21 19:21:26', '2016-03-21 17:15:47');
INSERT INTO `log_user_login` VALUES ('1D8BF95F2DB24722AA39BCC4CD9AE773', 'B6DA5FFCAC730753AEB4EBD8F5BAB80F', 'admin', '192.168.1.239', '0', '2016-03-16 16:32:30', '2016-03-17 14:41:10', '2016-03-16 16:32:30');
INSERT INTO `log_user_login` VALUES ('1E1A157DC3DA418CBD1141D7CFC119F4', '8E72FC2F1B5CD4E8E48884EECBCFDB5C', 'admin', '192.168.1.239', '0', '2016-03-22 20:08:09', '2016-03-22 22:13:36', '2016-03-22 20:08:09');
INSERT INTO `log_user_login` VALUES ('1E1B05F17420406C95095DF2DD38C293', '054500718B03A05FD6DCE2589F7E47C9', 'admin', '127.0.0.1', '0', '2016-04-25 14:02:37', '2016-04-25 17:52:05', '2016-04-25 15:44:14');
INSERT INTO `log_user_login` VALUES ('1E2E2C838B95435C91C77446AC05DBF6', 'EB95D5E5F409F14F9B8A6968AF9CD3B8', 'admin', '127.0.0.1', '0', '2016-08-17 16:29:09', '2016-08-17 18:34:57', '2016-08-17 16:29:09');
INSERT INTO `log_user_login` VALUES ('1E72C0C1112B4A10AA6993B0378A4A73', 'DBDE77953006038350AE42B1A55AA20C', 'admin', '192.168.2.239', '0', '2016-06-02 18:06:23', '2016-07-22 16:38:20', '2016-06-02 18:06:23');
INSERT INTO `log_user_login` VALUES ('1E8A2DED57A94D2FB1BAC6F178AA90B8', '52B83B7995B17B74C1B78E20A5F0509C', 'admin', '192.168.1.231', '0', '2016-05-12 15:08:47', '2016-05-12 17:17:14', '2016-05-12 15:08:48');
INSERT INTO `log_user_login` VALUES ('1EDDF71D8D06458791BE5515EBB5324C', '14AE026062D1ABAF09A71201F89491CB', 'admin', '192.168.2.32', '0', '2016-09-22 10:44:38', '2016-09-22 12:50:46', '2016-09-22 10:44:38');
INSERT INTO `log_user_login` VALUES ('1F4D1600DAB9439D91998406F4C3E7FB', 'CD680B151A45B16D25B61FEE173D001B', 'admin', '192.168.2.32', '0', '2016-03-18 10:47:09', '2016-03-18 13:03:41', '2016-03-18 10:58:28');
INSERT INTO `log_user_login` VALUES ('1FA0928D984B4C10BE2ADCA986370C63', '7E0448C57B3B2ECC62B9BC05F61DB40B', 'admin', '192.168.2.210', '0', '2016-04-01 14:02:37', '2016-04-01 16:08:18', '2016-04-01 14:02:37');
INSERT INTO `log_user_login` VALUES ('1FBE75F368DF47EE9012DC8BB9730AD9', '1152AD05738D1CC9E790D3A21367C741', 'admin', '192.168.1.239', '0', '2016-03-17 16:01:39', '2016-03-17 18:20:10', '2016-03-17 16:13:41');
INSERT INTO `log_user_login` VALUES ('209F857FDB9446408FB686E25FB88EE4', '013F15D57D6AD621866F344649092AAF', 'admin', '192.168.2.32', '0', '2016-07-26 14:15:52', '2016-07-26 16:30:05', '2016-07-26 14:15:52');
INSERT INTO `log_user_login` VALUES ('20C14201868242EE9DA10E8461988736', '64D08D78C7DADF2FC0C9AE58A3A18BC2', 'admin', '192.168.2.129', '0', '2016-08-26 17:29:02', '2016-08-29 10:08:52', '2016-08-26 17:29:02');
INSERT INTO `log_user_login` VALUES ('21C175B5ACCD4B40B641CB40FE405DCB', '3842DC5276B7031CF7713142B44AD936', 'admin', '192.168.1.239', '0', '2016-03-23 15:24:13', '2016-03-23 17:32:37', '2016-03-23 15:24:13');
INSERT INTO `log_user_login` VALUES ('21FE83F8562C4DA9857CD1E6B051FD60', '2BD0EED857C61BEA6A9B2B1FFDCDCB5C', 'admin', '192.168.2.32', '0', '2016-08-16 16:57:36', '2016-08-17 10:01:48', '2016-08-16 17:03:28');
INSERT INTO `log_user_login` VALUES ('2246ABEE446E4E199FDADB44CF959BD2', '7F20BA4259E0F90BB35C2AB7284D9F2D', 'admin', '192.168.2.129', '0', '2016-08-26 14:17:58', '2016-08-26 16:44:29', '2016-08-26 14:38:11');
INSERT INTO `log_user_login` VALUES ('224CA89BB12C41F3AD87DFF29EFFD351', '5178DF320E88582CFE74FEBFAB7C32EC', 'admin', '192.168.2.32', '0', '2016-09-18 16:01:36', '2016-09-18 19:19:07', '2016-09-18 16:08:37');
INSERT INTO `log_user_login` VALUES ('228DFB32D47A484EA967B133EC3EE624', '8CF8DA25806D0F520D41CF2DED609ED1', 'admin', '192.168.2.210', '0', '2016-04-05 15:42:16', '2016-04-05 17:52:38', '2016-04-05 15:42:16');
INSERT INTO `log_user_login` VALUES ('22A876D22C1D4AFAB4A55501242A7C38', '0F207B9B1F0B60550D9F6102D3F0F571', 'admin', '192.168.2.32', '0', '2016-03-22 14:41:36', '2016-03-22 16:48:06', '2016-03-22 14:41:36');
INSERT INTO `log_user_login` VALUES ('23375A1EC48C49B1A10A7BDB8B11265E', '657ED50A3CBCA4FE99658DE6846F6B39', 'admin', '192.168.1.239', '0', '2016-03-23 14:50:44', '2016-03-23 17:22:37', '2016-03-23 15:16:50');
INSERT INTO `log_user_login` VALUES ('237FFE538510485BBD6641F4F33FC124', 'C9F2C3EB63563F21C02433D253D13C04', 'admin', '192.168.1.129', '0', '2016-04-27 17:36:04', '2016-04-28 15:40:26', '2016-04-27 17:51:28');
INSERT INTO `log_user_login` VALUES ('242077799AF649669B4D5B282729C1DE', '8D6AFF16A0A11EF8FA03045EB1B9B3E2', 'admin', '192.168.2.210', '0', '2016-05-11 21:53:51', '2016-05-12 11:56:52', '2016-05-11 22:00:14');
INSERT INTO `log_user_login` VALUES ('2449E1C622924AD9AE8EB4640420556D', '5CEDE8BDE8BECCFEC29ED5311A43A4F7', 'admin', '192.168.2.210', '0', '2016-03-30 11:19:19', '2016-03-30 13:30:56', '2016-03-30 11:19:19');
INSERT INTO `log_user_login` VALUES ('2562817E9C624AB1856E6327DA48C232', '0023A39A6AABF2319B515578ACF7381D', 'admin', '192.168.2.32', '0', '2016-03-16 10:25:25', '2016-03-16 15:04:33', '2016-03-16 10:25:25');
INSERT INTO `log_user_login` VALUES ('25BD3667B97648B695DE1D351742D130', '18EC4F7BDB661572669DD7ADB1582015', 'admin', '192.168.3.117', '0', '2016-04-20 17:32:47', '2016-04-20 19:59:41', '2016-04-20 17:51:22');
INSERT INTO `log_user_login` VALUES ('25F986FA7A3E40FCA73C853ACBCE99CD', 'CFA129DB7D00E78569EF77B321FCF9C9', 'admin', '192.168.2.32', '0', '2016-08-16 16:48:43', '2016-08-17 10:01:48', '2016-08-16 16:48:44');
INSERT INTO `log_user_login` VALUES ('25FC7C1777214BEAAE7BD1B4ECC62FD6', 'C5D3613BC13188157CA01979A2030173', 'admin', '192.168.3.117', '0', '2016-03-24 16:55:19', '2016-03-24 19:04:50', '2016-03-24 16:55:19');
INSERT INTO `log_user_login` VALUES ('262785E0623747A7A2BE9A4CE4DE3C5D', 'A3C05F59BDB05FA89220D4433DE0898B', 'admin', '192.168.2.32', '0', '2016-02-01 13:45:05', '2016-02-22 15:23:52', '2016-02-01 13:45:05');
INSERT INTO `log_user_login` VALUES ('26E05EC4870C4372A11A9BD3CE2F0C3D', '9B9927601BE9E52D58BB8BBF897E35E8', 'admin', '192.168.2.129', '0', '2016-08-26 12:10:46', '2016-08-26 14:24:29', '2016-08-26 12:10:46');
INSERT INTO `log_user_login` VALUES ('27BC9C8A70E240E6BCBDC1DCC0E3B296', '1042244BEBDD30CF0174472BA1418119', 'admin', '192.168.2.129', '0', '2016-08-29 16:25:48', '2016-08-29 19:17:28', '2016-08-29 17:08:58');
INSERT INTO `log_user_login` VALUES ('27F86115A3CC4B6F9A5EF6CD4EA37D06', '559F2068A589287C3FC9A405D5E4096C', 'admin', '192.168.2.129', '0', '2016-03-22 15:54:59', '2016-03-22 18:18:06', '2016-03-22 16:08:58');
INSERT INTO `log_user_login` VALUES ('283018CCE6264F5B87C231F0AFA4D05D', '84E1FC8E39AF637B68D42E6D0CE25B36', 'admin', '192.168.2.129', '0', '2016-08-26 17:13:08', '2016-08-29 10:08:52', '2016-08-26 17:13:08');
INSERT INTO `log_user_login` VALUES ('2858843D585A4FD28A19C48FF1082605', '15F17FAF33ED656DD9EF96707156E0D6', 'admin', '192.168.2.210', '0', '2016-03-30 16:00:42', '2016-03-30 18:28:08', '2016-03-30 16:22:45');
INSERT INTO `log_user_login` VALUES ('288C0FFC2CB341A9B7C87DBBD04EF167', 'B5EF6675C9797B862417FDD62CA20F3D', 'admin', '192.168.2.32', '0', '2016-03-23 16:23:32', '2016-03-23 21:52:38', '2016-03-23 19:39:11');
INSERT INTO `log_user_login` VALUES ('28991CF9EC884C4A81015B82BD5B2075', '2A0704A6D6D5D69964FD1A30314E60F4', 'admin', '192.168.2.210', '0', '2016-04-26 14:26:16', '2016-04-26 17:34:57', '2016-04-26 14:55:03');
INSERT INTO `log_user_login` VALUES ('28A9E25D438749D085F0F46AD467A5FD', '6B308115CCE58CD9BC2D71612B15C998', 'admin', '192.168.1.231', '0', '2016-04-20 15:21:37', '2016-04-20 17:39:41', '2016-04-20 15:30:34');
INSERT INTO `log_user_login` VALUES ('292DCFF44D804AF1968571D53774B11F', '2202260D96F30194F35E78DF86ABA5AD', 'admin', '192.168.2.129', '0', '2016-08-18 16:21:21', '2016-08-18 18:54:01', '2016-08-18 16:46:55');
INSERT INTO `log_user_login` VALUES ('2931E5DBBEFE4C3C8F16B84A7B0EF40F', '188B7B1BBF3BBFC35DD36E728FDD6ED7', 'admin', '192.168.2.129', '0', '2016-09-08 15:05:24', '2016-09-08 17:27:51', '2016-09-08 15:18:08');
INSERT INTO `log_user_login` VALUES ('2A23E511AA274A58A35FFCD16BA9FD7C', '91F730908C8A38277BB339DC320EC383', 'admin', '192.168.1.129', '0', '2016-03-28 15:56:46', '2016-03-28 18:39:12', '2016-03-28 16:31:42');
INSERT INTO `log_user_login` VALUES ('2B71E25822A54094992F4A115A614EC7', '0A2A7E2AA7B6945152A788A012EA3E03', 'admin', '192.168.1.129', '0', '2016-04-26 09:36:54', '2016-04-26 11:42:12', '2016-04-26 09:36:54');
INSERT INTO `log_user_login` VALUES ('2BC0FD299FEA43A8A52F931351C1C9AA', '94FEC2B44E4B6FC5545BEDB6629D0F73', 'admin', '192.168.2.223', '0', '2016-03-25 16:38:22', '2016-03-26 14:02:57', '2016-03-25 16:38:22');
INSERT INTO `log_user_login` VALUES ('2BD27E718A554DBE940BCEA91F76BEDB', 'C716EB797B63CE74BDA943E1322A9B3B', 'admin', '192.168.2.32', '0', '2016-03-18 11:03:45', '2016-03-18 15:13:29', '2016-03-18 11:32:46');
INSERT INTO `log_user_login` VALUES ('2BF67A0C6CA34B2D9E7189D8DD2BE7AA', '0FCEE719EB181726D134FFA10852DDE5', 'admin', '192.168.1.231', '0', '2016-08-31 14:14:17', '2016-08-31 16:49:29', '2016-08-31 14:41:50');
INSERT INTO `log_user_login` VALUES ('2C348B40DC304A3587CBFD3944A42E90', '39AD130E2CD07526F3A129074FFD7DCD', 'admin', '192.168.2.32', '0', '2016-09-08 20:18:54', '2016-09-08 22:33:37', '2016-09-08 20:18:54');
INSERT INTO `log_user_login` VALUES ('2C8F8DBB98A5460A8A63F7530191CF1A', '2507C4DDF9AEF5A4DE5E146CEC6D6ED6', 'admin', '192.168.2.129', '0', '2016-09-27 09:55:36', '2016-09-27 12:08:24', '2016-09-27 09:55:36');
INSERT INTO `log_user_login` VALUES ('2CAACA5E092B4486B04D6BAF3FC6FC8B', 'B24FCCD61625D6C2722995A322D0104E', 'admin', '192.168.1.231', '0', '2016-09-12 10:16:12', '2016-09-12 12:25:43', '2016-09-12 10:16:12');
INSERT INTO `log_user_login` VALUES ('2CC89FDDDCBA4B14ACA4367C63044C95', '611BFE05FE48C788862DB4F4DC2F4490', 'admin', '192.168.2.210', '0', '2016-05-11 22:36:49', '2016-05-12 11:56:52', '2016-05-11 22:36:49');
INSERT INTO `log_user_login` VALUES ('2D52A9F8C08045D4B99067AEF9A9B7FF', '7D92CAEBF54959A94157A7AA78072A5F', 'admin', '192.168.2.129', '0', '2016-09-23 16:59:53', '2016-09-24 11:42:29', '2016-09-23 18:15:01');
INSERT INTO `log_user_login` VALUES ('2E0C3EF164894B4581468EABF18C0F84', '24594F69ECCE2522B2C64A87683B438E', 'admin', '192.168.2.129', '0', '2016-08-26 17:56:22', '2016-08-29 10:08:52', '2016-08-26 18:11:39');
INSERT INTO `log_user_login` VALUES ('2E2A9555320A4E3C80A64E720F292FEF', '88A9C5DD0462960BC87C44E2A0382AAB', 'admin', '192.168.2.32', '0', '2016-01-27 11:00:39', '2016-01-28 18:09:03', '2016-01-27 11:00:39');
INSERT INTO `log_user_login` VALUES ('2E43A90BB09A420EACBA0881C26E7BFB', 'CBE570A5E2E490BEAA3BA84BF852FF72', 'admin', '192.168.2.129', '0', '2016-03-24 10:41:07', '2016-03-24 12:49:08', '2016-03-24 10:41:07');
INSERT INTO `log_user_login` VALUES ('2E49E91D33CE4ECD8358F6485CE0E216', '141E7ABD99FD7AB6C60DDDF9B8885E24', 'admin', '192.168.2.32', '0', '2016-08-19 14:16:05', '2016-08-19 17:04:03', '2016-08-19 14:54:17');
INSERT INTO `log_user_login` VALUES ('2E5EFB32AC5941818F410F0F014406AF', '2B4585CF6D910756AD540DBEAD6C92EB', 'admin', '192.168.2.129', '0', '2016-08-31 14:40:31', '2016-08-31 17:36:30', '2016-08-31 15:08:06');
INSERT INTO `log_user_login` VALUES ('2E9394DB3C3B4073B0FFC5AC7F400486', 'F1802BF4A480A44B8ACE5BF8235D80F1', 'admin', '192.168.2.32', '0', '2016-08-18 12:12:40', '2016-08-18 14:35:32', '2016-08-18 12:24:53');
INSERT INTO `log_user_login` VALUES ('2F5546AD73F34A75B37CB685BB65576D', 'F123B9AE4B146404F4D817F9D983154D', 'admin', '192.168.2.129', '0', '2016-08-26 15:38:00', '2016-08-26 17:44:29', '2016-08-26 15:38:00');
INSERT INTO `log_user_login` VALUES ('2FAC6C3101404DC58A47782563FFA15D', '90F706C3FC36F2C9829504A296329852', 'admin', '192.168.2.129', '0', '2016-03-21 17:31:41', '2016-03-21 21:21:26', '2016-03-21 19:11:42');
INSERT INTO `log_user_login` VALUES ('2FFC0AD24D7D49349953C29574827FEA', '793EA358F9163481698B149FC9A3AF8E', 'admin', '192.168.2.32', '0', '2016-08-18 15:54:14', '2016-08-18 19:34:01', '2016-08-18 17:27:22');
INSERT INTO `log_user_login` VALUES ('316F0170A3694C15B7C51399838D20D6', 'D57B97D1CADAAB9F27E46863846EEDC8', 'admin', '192.168.2.210', '0', '2016-03-30 10:59:04', '2016-03-30 13:20:56', '2016-03-30 11:11:39');
INSERT INTO `log_user_login` VALUES ('316F80B8F1D6419EB88E734989A1FAEF', '793272E8D76163302D24E4263A9224CF', 'admin', '192.168.2.32', '0', '2016-03-22 17:09:43', '2016-03-22 19:28:06', '2016-03-22 17:20:19');
INSERT INTO `log_user_login` VALUES ('32419A422F5A4029924D213A00C32E43', 'FA06A2E9208C2D410606E99CC469F92C', 'admin', '192.168.1.239', '0', '2016-03-31 13:52:44', '2016-03-31 16:13:00', '2016-03-31 14:06:11');
INSERT INTO `log_user_login` VALUES ('327736BC292B42D88047B04BBBE4DFFB', 'FCE4B34521246AA85AB3ABCEC9795057', 'admin', '192.168.2.210', '0', '2016-04-28 15:30:32', '2016-05-03 15:41:59', '2016-04-28 17:04:41');
INSERT INTO `log_user_login` VALUES ('338613505D1A4BF2BAE6ABEF8F327333', '3320A17AC559D7A54A57FB2EAE81ACF2', 'admin', '192.168.2.32', '0', '2016-07-27 09:38:25', '2016-07-27 12:12:28', '2016-07-27 09:59:28');
INSERT INTO `log_user_login` VALUES ('339CE4E787A749DBAA910FACD6770760', '3C08701601962889CF5FEDEF40D2C78C', 'admin', '192.168.2.129', '0', '2016-08-25 11:31:58', '2016-08-25 13:41:17', '2016-08-25 11:31:58');
INSERT INTO `log_user_login` VALUES ('35A50951E29043B699A4503802D829A2', '60FAD48908AD198F4E6D0171505098FC', 'admin', '192.168.2.210', '0', '2016-04-05 15:27:15', '2016-04-05 17:32:39', '2016-04-05 15:27:15');
INSERT INTO `log_user_login` VALUES ('36DA0327EE6542A48048637800FC54E9', '11A677F09E20A1CCAAC8B55C4F0EAEDB', 'admin', '192.168.2.32', '0', '2016-07-26 11:57:18', '2016-07-26 14:07:20', '2016-07-26 11:57:18');
INSERT INTO `log_user_login` VALUES ('37559C7F61454E76AD6A79E2D562F883', '8404D44CBC62292830BE605206A56BF2', 'admin', '127.0.0.1', '0', '2016-10-13 18:08:33', '2016-10-13 20:23:02', '2016-10-13 18:08:33');
INSERT INTO `log_user_login` VALUES ('376DCF56B531499A9F2BCE87D90A6A8D', 'D3378EAE7AACB5D0A4E7913692C36381', 'admin', '192.168.2.32', '0', '2016-08-24 11:17:22', '2016-08-24 14:06:55', '2016-08-24 11:52:57');
INSERT INTO `log_user_login` VALUES ('37820B712534464A9F56B307D1F3E309', '332CE582C042CCE4A2E2529E15D35453', 'admin', '192.168.2.129', '0', '2016-08-30 10:38:36', '2016-08-30 13:13:42', '2016-08-30 11:07:58');
INSERT INTO `log_user_login` VALUES ('378BF10D761D4DA98BE35CE1432DD994', '39874D937F882863B338B97E81E82CA1', 'admin', '192.168.1.123', '0', '2016-09-21 14:34:43', '2016-09-21 17:37:38', '2016-09-21 15:16:22');
INSERT INTO `log_user_login` VALUES ('379450C492704C1C826E1064620AD17B', '16CB80B0EEE92CBD94D9602881E32A51', 'admin', '192.168.1.239', '0', '2016-03-22 19:59:46', '2016-03-22 22:08:06', '2016-03-22 19:59:46');
INSERT INTO `log_user_login` VALUES ('37B1858F60844CCBBF443F01061CD9DB', '7C7639C6BA5271963C8428A8ACFC09E2', 'admin', '192.168.1.239', '0', '2016-03-16 12:01:08', '2016-03-16 15:04:33', '2016-03-16 12:01:08');
INSERT INTO `log_user_login` VALUES ('37C079553C33482AB501C2BE1C60E934', '9B2CE71C4AB33298610DFAA25A2CB3F5', 'admin', '127.0.0.1', '0', '2016-04-01 11:08:07', '2016-04-01 13:18:18', '2016-04-01 11:08:07');
INSERT INTO `log_user_login` VALUES ('3801997AD4CA490C8CFDE8CFDF32320D', '3599CC62A8D6560AC3303829375B3F1A', 'admin', '192.168.1.239', '0', '2016-03-17 15:04:47', '2016-03-17 17:50:10', '2016-03-17 15:04:47');
INSERT INTO `log_user_login` VALUES ('3A127D090C0A447AAAAF856B1574D414', 'ACFAC46806E0E316738A41BAE101025A', 'admin', '192.168.1.129', '0', '2016-05-23 18:22:35', '2016-05-23 20:32:40', '2016-05-23 18:22:35');
INSERT INTO `log_user_login` VALUES ('3A27529A61B14EA2AAC63C96FBE82CAE', '150021D1C53DCD3183C2F6B494D0C8CC', 'admin', '192.168.2.129', '0', '2016-08-24 10:00:46', '2016-08-24 12:06:55', '2016-08-24 10:00:46');
INSERT INTO `log_user_login` VALUES ('3AE9DA28D1994CD89DA4F1658D551C94', 'ECDA17CE7C71F75151AA0FE7EBEFF575', 'admin', '192.168.1.129', '0', '2016-07-27 09:53:29', '2016-07-27 12:02:28', '2016-07-27 09:53:29');
INSERT INTO `log_user_login` VALUES ('3BB6DBD5EC5747768CA46BA57E79C566', '970E1D2A6DBBE3D74D8EC6292C281937', 'admin', '127.0.0.1', '0', '2016-06-16 00:09:58', '2016-07-22 16:38:20', '2016-06-16 00:09:58');
INSERT INTO `log_user_login` VALUES ('3C34222BD42A494DB017CF278ECE7EE1', '7B2F14BF0E97374BB5A3671979B972A0', 'admin', '192.168.2.32', '0', '2016-03-21 16:08:09', '2016-03-21 18:21:26', '2016-03-21 16:08:09');
INSERT INTO `log_user_login` VALUES ('3CCBAECCFA9544E889733842E8941C7F', '660D05189139F666B606BE7C199483FD', 'admin', '192.168.2.129', '0', '2016-08-26 16:08:11', '2016-08-26 18:14:29', '2016-08-26 16:08:11');
INSERT INTO `log_user_login` VALUES ('3E0CE68EC95B441390846FCD501D732E', 'B2D2243B2A1AAC521DBFB589E2928EED', 'admin', '192.168.1.239', '0', '2016-03-16 16:19:25', '2016-03-17 14:41:10', '2016-03-16 16:20:55');
INSERT INTO `log_user_login` VALUES ('3E24A76497C04150B3498DC34311D6DB', '271BE474827CCD4C8EB3342A634CCB1F', 'admin', '192.168.1.231', '0', '2016-05-12 15:16:02', '2016-05-12 15:22:32', '2016-05-12 15:16:02');
INSERT INTO `log_user_login` VALUES ('3E8E895FD18146CE8F8A754D1A7EB7D3', '4AAD9AEB8098B2B7A64617AA3E596570', 'admin', '192.168.3.117', '0', '2016-03-25 14:06:11', '2016-03-25 16:46:07', '2016-03-25 14:33:17');
INSERT INTO `log_user_login` VALUES ('3E9CE41D49DD47558477BB4BF6F5B00D', 'AA4F1BEE36528B14D9EDB79BDAC660BD', 'admin', '192.168.1.231', '0', '2016-03-31 11:49:24', '2016-03-31 13:59:26', '2016-03-31 11:49:24');
INSERT INTO `log_user_login` VALUES ('3EA86672DD384E01B3FDB72964B0BF03', 'DEED6B55819FD6659CBFEF4E00A26673', 'admin', '192.168.1.239', '0', '2016-03-16 15:02:56', '2016-03-17 14:41:10', '2016-03-16 15:02:56');
INSERT INTO `log_user_login` VALUES ('3EFB63483A5C47FB8923398CAF9FE75C', 'C923ED6746D53D802CB18B37F46ACB00', 'admin', '127.0.0.1', '0', '2016-04-05 16:16:33', '2016-04-05 18:21:45', '2016-04-05 16:16:33');
INSERT INTO `log_user_login` VALUES ('3FB20FCEC0D6437FAE53C97F032A587B', '510E7E9A85B0E3DA2BDC034CA6B2CA8D', 'admin', '192.168.2.129', '0', '2016-08-26 16:01:05', '2016-08-26 18:09:02', '2016-08-26 16:01:05');
INSERT INTO `log_user_login` VALUES ('405622DF5E10473F9303524CE100C5DB', '768C5FD2A6B85F800AD83F2B6DC9C29E', 'admin', '192.168.1.239', '0', '2016-03-18 14:59:51', '2016-03-18 17:05:04', '2016-03-18 14:59:51');
INSERT INTO `log_user_login` VALUES ('406EABCAA88D4F6A997D63E54D603ABC', 'A270B5477F4D559730D92748CD99C355', 'admin', '192.168.2.32', '0', '2016-09-18 16:23:35', '2016-09-18 19:19:07', '2016-09-18 16:23:35');
INSERT INTO `log_user_login` VALUES ('41256EDA2D76495B9AA4E0EE65BCD9E4', '77DDFF72304E1DC4818EEF7302B725AF', 'admin', '192.168.2.129', '0', '2016-08-31 10:55:07', '2016-08-31 13:24:32', '2016-08-31 11:17:06');
INSERT INTO `log_user_login` VALUES ('41A5684BB2E7400AA678DD5AD9BEDC4F', '201EE0AA27C09410C210CBF530F74107', 'admin', '192.168.1.239', '0', '2016-03-31 16:37:14', '2016-03-31 18:43:14', '2016-03-31 16:37:14');
INSERT INTO `log_user_login` VALUES ('41E916A871344DF790C1BC311F4FF606', '06F5E06D094CBEF677B607ED3237A635', 'admin', '192.168.2.32', '0', '2016-03-22 15:12:02', '2016-03-22 17:18:06', '2016-03-22 15:12:02');
INSERT INTO `log_user_login` VALUES ('425BC3D6F2264EE28ED101CA78B6C04C', 'C0CBE213D6AB80D3A49E397E9CAC4D11', 'admin', '192.168.2.129', '0', '2016-08-25 19:22:44', '2016-08-26 09:11:42', '2016-08-25 19:22:45');
INSERT INTO `log_user_login` VALUES ('428551D65951494281284EC763ECA254', '81B31D612F734E78CCACF7F50BB8721A', 'admin', '192.168.2.223', '0', '2016-04-22 17:37:56', '2016-04-25 10:29:07', '2016-04-22 17:37:56');
INSERT INTO `log_user_login` VALUES ('43D8E30EC9724056ACB5EA4C009C78F0', '45B141A57F4C906F8744ACA156BFE0E1', 'admin', '192.168.2.210', '0', '2016-03-30 10:09:15', '2016-03-30 13:00:55', '2016-03-30 10:51:21');
INSERT INTO `log_user_login` VALUES ('44734AFBFB8A475B9598C01882C3228F', '0159407CDF553A468B93215AD9338B59', 'admin', '192.168.1.231', '0', '2016-08-31 12:43:17', '2016-08-31 14:49:29', '2016-08-31 12:43:17');
INSERT INTO `log_user_login` VALUES ('449CBC80ECB8488E9125B758E862A4E6', '271BE474827CCD4C8EB3342A634CCB1F', 'admin', '192.168.1.231', '0', '2016-05-12 15:22:38', '2016-05-12 18:37:14', '2016-05-12 16:26:20');
INSERT INTO `log_user_login` VALUES ('44A3173ECD8F4CE0AB56700A694D64EC', 'FB66681816EFD5085E73C6A5353B5302', 'admin', '192.168.3.117', '0', '2016-03-25 10:49:53', '2016-03-25 12:56:29', '2016-03-25 10:49:54');
INSERT INTO `log_user_login` VALUES ('44F8C1C03E16416E91E43F3F77B03C0B', '7BCD9A30A49BFDA790FC2D3EBDF6BC7F', 'admin', '192.168.2.129', '0', '2016-08-26 15:25:28', '2016-08-26 17:34:29', '2016-08-26 15:25:28');
INSERT INTO `log_user_login` VALUES ('452CF1BEAD5B431A99140C6430097129', '0A3D03C2D10FCC51ACA55F449E2BBF02', 'admin', '192.168.2.32', '0', '2016-08-31 17:26:32', '2016-08-31 19:45:36', '2016-08-31 17:33:54');
INSERT INTO `log_user_login` VALUES ('45B00ADAE9864D8680ACA5F9B819D18E', 'CF418F1346631898F98775A46B5E9235', 'admin', '192.168.1.231', '0', '2016-05-26 14:21:51', '2016-05-26 16:29:53', '2016-05-26 14:21:51');
INSERT INTO `log_user_login` VALUES ('4616E3A3A62745119907DED212ED7DD2', '2304EA64FB3AED212BA7D54D813AD18B', 'admin', '192.168.3.117', '0', '2016-03-22 15:24:59', '2016-03-22 18:11:29', '2016-03-22 16:04:58');
INSERT INTO `log_user_login` VALUES ('464F3397042043E69720568940EBC6C3', '376E169C7048A5694DAFFF9E9F09B4A7', 'admin', '192.168.2.32', '0', '2016-08-23 15:07:26', '2016-08-23 18:46:25', '2016-08-23 16:35:22');
INSERT INTO `log_user_login` VALUES ('467A6F929E6A4D8CB175CFD315184EE2', 'D73DC90236761A57C022222E07E99911', 'admin', '192.168.2.223', '0', '2016-03-25 17:20:33', '2016-03-26 14:02:57', '2016-03-25 17:44:14');
INSERT INTO `log_user_login` VALUES ('47B5DAB64A034F538FEAC90DAEE198C5', '0EB86D1645000F829FC865FFDEC94E7A', 'admin', '192.168.2.129', '0', '2016-08-30 11:18:24', '2016-08-30 13:23:42', '2016-08-30 11:18:25');
INSERT INTO `log_user_login` VALUES ('47C77AB6E1034536A55DC0BA8649F1FB', '5A12A59570F668655048A3AC64B3AEC6', 'admin', '192.168.2.129', '0', '2016-09-29 13:46:39', '2016-09-29 16:09:44', '2016-09-29 14:01:40');
INSERT INTO `log_user_login` VALUES ('47E2435E88A54228830D256FDF71F73C', 'D4BB69595A77CB280E6BD1A66C10106F', 'admin', '192.168.2.32', '0', '2016-09-20 15:31:36', '2016-09-20 17:37:33', '2016-09-20 15:31:36');
INSERT INTO `log_user_login` VALUES ('4803B2A052CA4EC788C2B7BE894FD773', '9C5F7FB1846ED54D1A0F16D8C08D7DC1', 'admin', '192.168.1.239', '0', '2016-03-31 16:32:56', '2016-03-31 18:38:27', '2016-03-31 16:32:56');
INSERT INTO `log_user_login` VALUES ('48411080655B4D6EA6ACC48644A3257C', 'B9F34E8908A0AAE85A32D32098C13BDA', 'admin', '192.168.1.239', '0', '2016-03-16 15:04:24', '2016-03-17 14:41:10', '2016-03-16 15:04:24');
INSERT INTO `log_user_login` VALUES ('48AF073656AC4FC9B145CFF1EEA6D1C7', 'ED6297D7794B7D41A275FC38FFC4977B', 'admin', '192.168.1.239', '0', '2016-03-17 15:19:25', '2016-03-17 17:50:10', '2016-03-17 15:19:25');
INSERT INTO `log_user_login` VALUES ('49734CE641CE4F1F96BD1D6245175D83', 'BCF04E71A4038D31AD8C0272B89C1BBF', 'admin', '192.168.1.129', '0', '2016-04-21 16:06:11', '2016-04-21 18:29:47', '2016-04-21 16:22:14');
INSERT INTO `log_user_login` VALUES ('4A7A2E66C5704C6B822E111DC16D87E5', '7A7BDD5188122AC3E0597633D9018BDF', 'admin', '192.168.1.231', '0', '2016-03-31 14:33:15', '2016-03-31 18:43:14', '2016-03-31 16:38:10');
INSERT INTO `log_user_login` VALUES ('4AB70EF7FF3B41649C69B301B32A20DF', '759993A7697489E4E668C33E418551C2', 'admin', '192.168.1.239', '0', '2016-03-22 11:18:25', '2016-03-22 13:38:28', '2016-03-22 11:33:22');
INSERT INTO `log_user_login` VALUES ('4B5F773CFF7E45F3974113052528B630', '7E59954B76BC1C6AAA5C5E655122C802', 'admin', '192.168.2.32', '0', '2016-08-26 10:06:54', '2016-08-26 13:04:28', '2016-08-26 10:59:22');
INSERT INTO `log_user_login` VALUES ('4B881B10EDED43858656C44A06F38339', 'FDE10BA0051F0A2D48203985BC143AE3', 'admin', '192.168.2.32', '0', '2016-09-18 16:31:51', '2016-09-18 19:19:07', '2016-09-18 16:31:52');
INSERT INTO `log_user_login` VALUES ('4BA3BCDE0D2247ED968AD6CAB28ECAC7', '6F027663917458B3DCBB48E51EDB6A3D', 'admin', '192.168.2.223', '0', '2016-03-28 16:41:27', '2016-03-28 18:49:12', '2016-03-28 16:41:27');
INSERT INTO `log_user_login` VALUES ('4C2EE311356A480298948272DE825AE2', '4D281AEE7DCCCE3C393407085362DBAB', 'admin', '192.168.2.129', '0', '2016-08-26 17:44:05', '2016-08-29 10:08:52', '2016-08-26 17:44:05');
INSERT INTO `log_user_login` VALUES ('4CD9BECB60434331B3CBDFC669F80C88', 'A2DD8825EEA83D0CBD23EC1AB18E4556', 'admin', '192.168.1.231', '0', '2016-08-31 17:49:09', '2016-08-31 19:55:36', '2016-08-31 17:49:09');
INSERT INTO `log_user_login` VALUES ('4D3CE1DD605849979835F3D58A3497A0', '6BD1B823B740A6C417AC29B7CFA7475A', 'admin', '192.168.2.129', '0', '2016-08-31 10:39:07', '2016-08-31 12:50:01', '2016-08-31 10:39:07');
INSERT INTO `log_user_login` VALUES ('4EF0EF1B05E04FFFB50CD18328321763', '52389889AAD14F1E727997552F1D226F', 'admin', '192.168.2.32', '0', '2016-09-18 17:23:32', '2016-09-18 19:49:07', '2016-09-18 17:36:02');
INSERT INTO `log_user_login` VALUES ('4F25EC5628904A1C9E8895D5FA142D56', '17EEA94C55106CC71D4DF04ACAF44A8A', 'admin', '192.168.2.32', '0', '2016-08-25 18:15:03', '2016-08-26 09:11:42', '2016-08-25 18:15:03');
INSERT INTO `log_user_login` VALUES ('4F8EBD995829418A8E425EDDD4BF23DA', '83F7F2A3A770A576E0D135D61046232E', 'admin', '192.168.2.32', '0', '2016-08-24 16:01:10', '2016-08-24 18:51:16', '2016-08-24 16:41:44');
INSERT INTO `log_user_login` VALUES ('5077A699C50A4AE98070730DEFB5E45B', '9532B91059D18D20EDAB09F4A08CFF6E', 'admin', '192.168.1.239', '0', '2016-03-31 14:44:00', '2016-03-31 17:15:51', '2016-03-31 15:03:05');
INSERT INTO `log_user_login` VALUES ('508BA9815EBB46FE9CEC452F0379300E', 'E27E3055FA8878018767C14902950EE0', 'admin', '192.168.1.123', '0', '2016-09-19 17:56:12', '2016-09-19 21:29:47', '2016-09-19 19:23:44');
INSERT INTO `log_user_login` VALUES ('5173DCECBFE84D089BAB8B431CF9ECBE', '2A99DF666BB4DD04DF6F085E0ED60DC3', 'admin', '192.168.2.129', '0', '2016-09-19 15:11:41', '2016-09-19 17:19:47', '2016-09-19 15:11:41');
INSERT INTO `log_user_login` VALUES ('5190E3731B5B45DD8D9F911C7F0302E1', 'CCF0E18D5BEFF90E6044293FFA8C42C1', 'admin', '192.168.2.129', '0', '2016-08-30 15:20:46', '2016-08-30 17:33:40', '2016-08-30 15:20:46');
INSERT INTO `log_user_login` VALUES ('523A55D632EE4029B88E21A6528B2242', 'A9318F47B626AC9622B4A13CF4A56396', 'admin', '192.168.1.239', '0', '2016-03-23 10:15:18', '2016-03-23 13:17:25', '2016-03-23 11:11:57');
INSERT INTO `log_user_login` VALUES ('52B85F5FDEFC4B5B92E97F8D0B83677A', 'E915A9DE9F51A614422700984D14423F', 'admin', '192.168.2.210', '0', '2016-05-11 22:13:12', '2016-05-12 11:56:52', '2016-05-11 22:23:35');
INSERT INTO `log_user_login` VALUES ('532B509E87CB48A98C76646396AEDDF2', '013CF9BEE8977A0E9306FDB89A433CAC', 'admin', '192.168.2.129', '0', '2016-09-22 10:46:11', '2016-09-22 12:54:41', '2016-09-22 10:46:11');
INSERT INTO `log_user_login` VALUES ('538072F3F4524CFE81A373BE9C47318A', 'DCB5BB28C9EC4DDFBDDDA73C2C900A34', 'admin', '192.168.2.32', '0', '2016-08-29 15:38:43', '2016-08-29 18:32:54', '2016-08-29 16:25:22');
INSERT INTO `log_user_login` VALUES ('5392134F9550451997350B691CC39E84', '5AA9ACF67FB94E4E0E0EB1CC42971AD3', 'admin', '192.168.2.129', '0', '2016-03-22 16:44:32', '2016-03-22 18:49:35', '2016-03-22 16:44:32');
INSERT INTO `log_user_login` VALUES ('546CA7A7A5104692B0951F5A2F55324A', '0A947543C371EB4B8AD12723028031E9', 'admin', '127.0.0.1', '1', '2016-10-14 11:10:01', null, '2016-10-14 11:10:01');
INSERT INTO `log_user_login` VALUES ('54A3F5EBE3C443BB9EE68A2149306B71', '1E5458565AA6C55E0295E620D280F1B6', 'admin', '192.168.1.231', '0', '2016-04-01 11:17:58', '2016-04-01 13:58:18', '2016-04-01 11:45:33');
INSERT INTO `log_user_login` VALUES ('55BB516A432D415C84FAA31A464238F5', '5F2966351F9C207D8E61C62318012F9E', 'admin', '192.168.2.210', '0', '2016-03-30 17:29:52', '2016-03-30 20:28:10', '2016-03-30 18:20:32');
INSERT INTO `log_user_login` VALUES ('56A9E5D76E3249E8B7630E52976CE045', '95F6F90E0FB00698200117E832276098', 'admin', '192.168.2.129', '0', '2016-08-31 10:00:39', '2016-08-31 12:15:22', '2016-08-31 10:00:40');
INSERT INTO `log_user_login` VALUES ('576852FF8D1A4AFD9714145160388A34', 'D8E8423E511B079CF2C662EACFBDC54F', 'admin', '192.168.2.129', '0', '2016-09-19 15:17:34', '2016-09-19 18:22:36', '2016-09-19 16:15:18');
INSERT INTO `log_user_login` VALUES ('5854BD4DA069486FAAFA11E6EA40DBF2', '5DC2AE1E2C86B627E380873E669FFA51', 'admin', '192.168.2.129', '0', '2016-09-28 17:22:40', '2016-09-28 19:32:12', '2016-09-28 17:22:40');
INSERT INTO `log_user_login` VALUES ('58EF0A72C77A459CB7408B003F913BCE', '83B4727F9D553F99088A56A0C031DF52', 'admin', '192.168.2.32', '0', '2016-08-25 14:55:42', '2016-08-25 17:03:22', '2016-08-25 14:55:42');
INSERT INTO `log_user_login` VALUES ('59CC424C859E4BE5B37E07B9A54B917D', '80743E2905D5A5F11CB3A38437E04CBC', 'admin', '192.168.2.129', '0', '2016-03-24 11:07:15', '2016-03-24 13:24:01', '2016-03-24 11:18:40');
INSERT INTO `log_user_login` VALUES ('5A35909E0830457D935860B2C0440BF9', 'B99288D2B75F6A490C01C6725D0B7448', 'admin', '192.168.3.117', '0', '2016-03-24 16:00:48', '2016-03-24 18:09:09', '2016-03-24 16:00:48');
INSERT INTO `log_user_login` VALUES ('5A47D93E81FE4BD895DAEFD5F46A5C0D', 'CBC5535F525D28ACE07AD179B6C55C56', 'admin', '192.168.1.239', '0', '2016-03-23 15:47:42', '2016-03-23 18:10:31', '2016-03-23 16:03:41');
INSERT INTO `log_user_login` VALUES ('5BA669142D5045C988C46789EE5F097B', '6A8D8D1DD804C9081F59BDCF48ED71D7', 'admin', '192.168.2.210', '0', '2016-04-20 14:39:11', '2016-04-20 18:22:16', '2016-04-20 16:15:10');
INSERT INTO `log_user_login` VALUES ('5C0113A3C9F64D8492379C20654D4466', '265651BB56A315DAC0C2E26B26F8BAB3', 'admin', '192.168.3.117', '0', '2016-03-24 16:56:17', '2016-03-24 19:04:50', '2016-03-24 16:56:17');
INSERT INTO `log_user_login` VALUES ('5C167856655342C59B2FE5257A6F78B7', 'B1282C8ECACF411C7FDADDADF968393D', 'admin', '192.168.2.129', '0', '2016-09-26 16:15:00', '2016-09-26 18:28:47', '2016-09-26 16:22:09');
INSERT INTO `log_user_login` VALUES ('5D1FECCCA7864095A01F02DE4631DBA4', 'D3C9EB979CF4C76A952AF9101E4DC10B', 'admin', '127.0.0.1', '0', '2016-08-29 11:13:53', '2016-08-29 13:25:10', '2016-08-29 11:13:53');
INSERT INTO `log_user_login` VALUES ('5D8B96C7FE5941E88CEDB3A0A30E6469', 'B9B0C4FF5CE427279785F6E8168A091B', 'admin', '192.168.1.231', '0', '2016-08-30 14:13:19', '2016-08-30 16:33:49', '2016-08-30 14:26:06');
INSERT INTO `log_user_login` VALUES ('5DA94A2960FC4A9A992DAAE9AE8FD020', 'AAEBC061E068A9F0BA6E57A69E816560', 'admin', '192.168.2.32', '0', '2016-08-29 15:19:01', '2016-08-29 17:27:28', '2016-08-29 15:19:01');
INSERT INTO `log_user_login` VALUES ('5DA9D666DAD64B49B8768757B9665C5B', '7D92CAEBF54959A94157A7AA78072A5F', 'admin', '192.168.2.129', '0', '2016-09-23 16:22:26', '2016-09-23 16:54:22', '2016-09-23 16:54:22');
INSERT INTO `log_user_login` VALUES ('5DABB6FCDB374538A48899B114B8A690', 'E5B3D42655F9962D19BF62E545AF049A', 'admin', '192.168.1.129', '0', '2016-03-25 15:38:27', '2016-03-26 14:02:57', '2016-03-25 15:46:43');
INSERT INTO `log_user_login` VALUES ('5E8796728AB547B4B415EBFF008B5ADA', '9307C48E2B646F380A13269ED632E7A1', 'admin', '192.168.2.223', '0', '2016-03-28 16:33:47', '2016-03-28 18:39:12', '2016-03-28 16:33:47');
INSERT INTO `log_user_login` VALUES ('5E9F025445474123B17624FB471C3850', '25672510D07608E6D90DE3FA840B488B', 'admin', '192.168.1.231', '0', '2016-05-12 11:48:47', '2016-05-12 11:53:19', '2016-05-12 11:50:07');
INSERT INTO `log_user_login` VALUES ('5EAB4070E4D74585BE5BAB6C5897CDA7', '82BA530558D63248810DD9AF7A396CCA', 'admin', '113.99.100.91, 10.10.10.1', '0', '2016-04-21 14:08:16', '2016-04-21 18:19:47', '2016-04-21 16:12:12');
INSERT INTO `log_user_login` VALUES ('5ED2D16541404CE88A3E55EDFC836ED2', '7B24E0D92E5747C6494F1ADC9F1D1044', 'admin', '192.168.3.117', '0', '2016-03-23 11:02:51', '2016-03-23 13:21:31', '2016-03-23 11:16:22');
INSERT INTO `log_user_login` VALUES ('5F03CA4635F14904B0074FB900C83705', 'C93590953B5E72CA119FC2EFD3A9EAE1', 'admin', '192.168.2.210', '0', '2016-04-21 14:07:49', '2016-04-21 16:19:47', '2016-04-21 14:13:09');
INSERT INTO `log_user_login` VALUES ('5F992298A3C1411F86CA26444D9AC1F0', '48A11F1B63F6829B6EEF5B1940FA2C25', 'admin', '192.168.2.129', '0', '2016-09-14 15:41:42', '2016-09-18 16:01:42', '2016-09-14 15:57:18');
INSERT INTO `log_user_login` VALUES ('5FD170C1453546FFAE70530A3855F879', 'A5DF8AF19BA5A35910DB59EEAF67C041', 'admin', '192.168.2.32', '0', '2016-09-19 16:22:45', '2016-09-19 19:39:47', '2016-09-19 17:32:59');
INSERT INTO `log_user_login` VALUES ('5FFA9D604F8543C8BB4BFE39CF12E9BA', 'C3C5212943D9260C8A309DD086B71E9F', 'admin', '192.168.2.32', '0', '2016-03-16 09:57:22', '2016-03-16 15:04:33', '2016-03-16 10:11:43');
INSERT INTO `log_user_login` VALUES ('605C2A21ACB9468AA20B5FD4FA73DBDD', 'AA0B75AB70B9A13E35A1B827EDB151B6', 'admin', '192.168.2.32', '0', '2016-08-17 16:34:54', '2016-08-17 20:34:58', '2016-08-17 18:27:16');
INSERT INTO `log_user_login` VALUES ('60618F4FDF0346D2A333D701A309B456', '05D8BA40F43E579D5B4A52CAB1183226', 'admin', '192.168.3.117', '0', '2016-03-24 15:59:03', '2016-03-24 18:04:50', '2016-03-24 15:59:03');
INSERT INTO `log_user_login` VALUES ('6089E0002C474A7880CD0389E39F6485', '301BAA580A4B2FB43675E8B2148C883D', 'admin', '192.168.2.129', '0', '2016-03-24 19:55:46', '2016-03-24 22:25:12', '2016-03-24 20:10:48');
INSERT INTO `log_user_login` VALUES ('6163AC271E0545F3A7080FC1E323787E', '4B6B130E7D8A9FAC4151D004DB80460F', 'admin', '192.168.2.129', '0', '2016-09-01 14:15:37', '2016-09-01 16:25:37', '2016-09-01 14:15:37');
INSERT INTO `log_user_login` VALUES ('6252457968514E7AA7AFD3130079C933', '8AD2BD6F02E1F00141CDFA22914337C6', 'admin', '192.168.1.231', '0', '2016-05-12 17:33:17', '2016-05-12 19:46:58', '2016-05-12 17:33:17');
INSERT INTO `log_user_login` VALUES ('62EF3089A236402EA8C98FE80191D8B8', '376B4AA2F3561B3CAD914786088D5449', 'admin', '192.168.2.210', '0', '2016-05-12 17:17:07', '2016-05-12 19:27:14', '2016-05-12 17:17:07');
INSERT INTO `log_user_login` VALUES ('63196C8EA37248F6BE7EB2D59E483F99', '6EA0D47E5396A769C87728C7A37C2AAF', 'admin', '192.168.1.239', '0', '2016-03-16 16:07:28', '2016-03-17 14:41:10', '2016-03-16 16:07:28');
INSERT INTO `log_user_login` VALUES ('63818FB8148E4777A37D454961A9CFB2', 'A14C811419401CC212AB6752BFC6649D', 'admin', '192.168.2.32', '0', '2016-07-28 10:18:27', '2016-07-28 12:40:33', '2016-07-28 10:27:19');
INSERT INTO `log_user_login` VALUES ('63C5A96FBB304FD39BFE2E3892B39540', '88A9C5DD0462960BC87C44E2A0382AAB', 'admin', '192.168.2.32', '0', '2016-01-27 10:59:09', '2016-01-27 11:00:33', '2016-01-27 11:00:08');
INSERT INTO `log_user_login` VALUES ('6445E034465A4740AC98B0A1216E2F57', '0260E03BBA2BC7818FB185E321A2D7AA', 'admin', '192.168.2.210', '0', '2016-04-19 14:56:02', '2016-04-19 19:01:01', '2016-04-19 16:53:26');
INSERT INTO `log_user_login` VALUES ('6498EE5F896F467F9628B2869FB0535E', 'BA1DA7F39143C1289BE6FECF6D46F044', 'admin', '192.168.2.129', '0', '2016-03-23 11:47:20', '2016-03-23 15:57:30', '2016-03-23 13:52:18');
INSERT INTO `log_user_login` VALUES ('65C6DDA857664D329E9D8AFE7FA8F486', 'EDF39E98D3567FF6F3F1148AAF609CA4', 'admin', '192.168.1.231', '0', '2016-08-31 09:13:24', '2016-08-31 11:55:22', '2016-08-31 09:47:37');
INSERT INTO `log_user_login` VALUES ('662533566AA040C9B3C6F5A6B3704454', 'A847B0C16B9BFD2D63B812CC2893A1EB', 'admin', '192.168.1.239', '0', '2016-03-28 17:53:42', '2016-03-28 20:06:42', '2016-03-28 17:53:42');
INSERT INTO `log_user_login` VALUES ('663958E45D5845749F965F84D34418FB', 'EA593021A7ACDE433740321A79E772C3', 'admin', '192.168.2.32', '0', '2016-03-17 16:28:43', '2016-03-17 18:40:10', '2016-03-17 16:28:43');
INSERT INTO `log_user_login` VALUES ('6691CC46308E4D99B4AFEAA1212E8137', 'DC5F9B620712727190411490856B6998', 'admin', '192.168.2.210', '0', '2016-04-05 14:59:04', '2016-04-05 17:32:39', '2016-04-05 15:25:25');
INSERT INTO `log_user_login` VALUES ('67432484CD984CA9841D1EC0012CC592', 'A5F78F4E78FD37DD97F58EFA2435289B', 'admin', '192.168.3.117', '0', '2016-03-25 10:53:07', '2016-03-25 13:03:05', '2016-03-25 10:56:19');
INSERT INTO `log_user_login` VALUES ('674782C9572B48FF8CAA13D03B19DB25', 'BD3B751AC05AB7AB4A61CDC2526DC41B', 'admin', '192.168.2.129', '0', '2016-03-22 20:04:01', '2016-03-22 22:58:06', '2016-03-22 20:51:54');
INSERT INTO `log_user_login` VALUES ('676B7BE3620B4FAE89134B5DC4501E1B', '4B586BCD634558450FCDA783AB1C43A9', 'admin', '192.168.2.129', '0', '2016-08-25 13:44:56', '2016-08-25 15:59:21', '2016-08-25 13:53:15');
INSERT INTO `log_user_login` VALUES ('67C2376E5A1C4D0DBC52D3C15C2CEF17', '5E2ECEEB0FE0FC3E645EDC7D84FD963F', 'admin', '192.168.2.223', '0', '2016-04-28 17:11:59', '2016-05-03 15:41:59', '2016-04-28 17:12:00');
INSERT INTO `log_user_login` VALUES ('67EA8617BC1C4EFFBA74CC73AFFFDC33', '4F8B08E52587A9D3EEBDED5B0C8EA670', 'admin', '192.168.2.32', '0', '2016-02-16 17:14:03', '2016-02-22 15:23:52', '2016-02-16 17:16:45');
INSERT INTO `log_user_login` VALUES ('68462900919B4F5F9E012F9371051840', '27D5D81D67D434738467D9AF5D0BF286', 'admin', '192.168.1.239', '0', '2016-03-16 16:58:29', '2016-03-17 14:41:10', '2016-03-16 16:58:29');
INSERT INTO `log_user_login` VALUES ('68616C14F42345D4B64DC6DA5F9B5323', 'F4EAEF78CB55B2BCDE760E5272CC9D5B', 'admin', '192.168.1.129', '0', '2016-05-11 21:41:45', '2016-05-12 11:56:52', '2016-05-11 21:55:34');
INSERT INTO `log_user_login` VALUES ('68DD371A19424F8EA73590F6621B52D1', '21FEFDBE1F7444DB4B7CC2F88BAC274B', 'admin', '127.0.0.1', '0', '2016-10-13 18:05:58', '2016-10-13 20:13:02', '2016-10-13 18:05:58');
INSERT INTO `log_user_login` VALUES ('6942E70AB78F4F0BB1E5469D3F4CAB92', '04A16B28940D703691B85968A26A37C7', 'admin', '127.0.0.1', '0', '2016-01-28 18:07:29', '2016-01-28 23:07:15', '2016-01-28 18:07:29');
INSERT INTO `log_user_login` VALUES ('6A3169CF9D5F44D3BEE186CFD859DEED', 'CF35C1304750548B4C2930F67245FC10', 'admin', '192.168.2.129', '0', '2016-08-31 11:27:05', '2016-08-31 14:34:20', '2016-08-31 12:28:05');
INSERT INTO `log_user_login` VALUES ('6A461E83358347B184EE15A61902D253', 'F205FED1B52EF2BDA7583265964593B5', 'admin', '192.168.1.129', '0', '2016-04-25 17:49:31', '2016-04-25 20:29:18', '2016-04-25 18:20:18');
INSERT INTO `log_user_login` VALUES ('6A4E6358C8D14517BC0FE1C36BBE02E4', '34AB5229FC2B8C3A107CCCE1DAD13860', 'admin', '192.168.1.129', '0', '2016-04-07 17:52:28', '2016-04-07 21:32:17', '2016-04-07 19:17:55');
INSERT INTO `log_user_login` VALUES ('6A7800E0221A4C5BBBA42C20591D3823', 'EC31AA5155004E2B6B98E9A7C630C762', 'admin', '192.168.2.32', '0', '2016-08-18 10:53:44', '2016-08-18 14:00:49', '2016-08-18 11:36:16');
INSERT INTO `log_user_login` VALUES ('6B7CAB7579DF4937B9FD16A93845FF30', 'CE7CC3C76C038898EC052CABBCE64D15', 'admin', '192.168.2.32', '0', '2016-03-21 21:54:30', '2016-03-22 00:01:27', '2016-03-21 21:54:30');
INSERT INTO `log_user_login` VALUES ('6C5475F5F6FD46DC9ED4A2DBAF3B0A25', '41EC06C1F65B2B97C627797924DA6E68', 'admin', '192.168.2.129', '0', '2016-09-21 15:08:29', '2016-09-21 17:37:38', '2016-09-21 15:08:29');
INSERT INTO `log_user_login` VALUES ('6C85902496E44BB09B43CC97A408F1AF', 'C591FD760174D6D3E5543B2CE581E76F', 'admin', '192.168.2.32', '0', '2016-07-27 10:18:17', '2016-07-27 12:32:28', '2016-07-27 10:18:17');
INSERT INTO `log_user_login` VALUES ('6CB2EBA760724C20A784F5601DC103D5', '8FBC4147B468BDB364592B8BFA57D741', 'admin', '192.168.2.32', '0', '2016-09-09 17:12:31', '2016-09-12 10:25:43', '2016-09-09 17:12:31');
INSERT INTO `log_user_login` VALUES ('6D8D007E468B409F8D1A0417B1EA22FF', '0C0AF0F8E0619D42EA9C50BF30B25D4D', 'admin', '192.168.1.129', '0', '2016-04-21 17:13:19', '2016-04-22 16:17:44', '2016-04-21 17:44:03');
INSERT INTO `log_user_login` VALUES ('6DA4E9BA779B447C94F07B850E034FB7', '4906464C19687AFFCA5F061CB7946E0A', 'admin', '192.168.2.32', '0', '2016-03-18 16:01:46', '2016-03-21 16:18:00', '2016-03-18 16:01:46');
INSERT INTO `log_user_login` VALUES ('6DB0056947ED4BFCBE0CE06775EAF3B0', '99FC26A73CAD48712536123DD86A9533', 'admin', '192.168.1.239', '0', '2016-03-16 17:55:59', '2016-03-17 14:41:10', '2016-03-16 17:55:59');
INSERT INTO `log_user_login` VALUES ('6E47DB9110CA410E8DB591FA7A219E01', '79043A747957114854F27CD8B1ACA552', 'admin', '192.168.2.129', '0', '2016-09-27 10:36:52', '2016-09-27 13:38:24', '2016-09-27 11:24:57');
INSERT INTO `log_user_login` VALUES ('6EAE5316AD594A598A01685825657E20', '07CF312BC236888B32418AFDF311F23B', 'admin', '192.168.2.210', '0', '2016-03-30 18:28:02', '2016-03-30 20:35:00', '2016-03-30 18:28:02');
INSERT INTO `log_user_login` VALUES ('6F166B063B4648A986D18A2F85DB4EC6', 'E3C8F4614A0FC486464849561C79BB30', 'admin', '192.168.1.129', '0', '2016-04-27 18:17:54', '2016-04-28 15:40:26', '2016-04-27 18:25:26');
INSERT INTO `log_user_login` VALUES ('6F20520C6CFB4AF699287371A1C80A02', '65D82EC8737C24CC5265B2E523315CDB', 'admin', '192.168.1.239', '0', '2016-03-16 16:44:19', '2016-03-17 14:41:10', '2016-03-16 16:44:19');
INSERT INTO `log_user_login` VALUES ('6F58D62FF93149FA83C7F8E26A492F05', '366731068DABE8D9F2749B399B024FF7', 'admin', '127.0.0.1', '0', '2016-08-30 17:07:25', '2016-08-30 19:13:40', '2016-08-30 17:07:26');
INSERT INTO `log_user_login` VALUES ('6FED0AC896E74368AE69984A1DF0572A', 'CA526741A06DF44582B62205AB2EBE5E', 'admin', '192.168.2.32', '0', '2016-02-01 17:58:24', '2016-02-22 15:23:52', '2016-02-01 17:58:24');
INSERT INTO `log_user_login` VALUES ('7022DEB6355241D6B435C539F1AD891D', '72E875ED3DC938324F9AF2B89ED64A06', 'admin', '192.168.1.129', '0', '2016-04-21 17:50:58', '2016-04-22 16:17:44', '2016-04-21 17:56:28');
INSERT INTO `log_user_login` VALUES ('70936C9E13ED42B58F039A1B2B0BF505', 'C5DD36525EC15FA93CFDA95478B0F51B', 'admin', '192.168.2.129', '0', '2016-09-21 15:32:35', '2016-09-21 18:57:04', '2016-09-21 16:47:02');
INSERT INTO `log_user_login` VALUES ('70E9E3292AAC4781B133250E262F72E6', '416DA4BB0D4D694D464BF472DF98646F', 'admin', '192.168.2.210', '0', '2016-04-01 14:22:10', '2016-04-01 16:32:14', '2016-04-01 14:22:10');
INSERT INTO `log_user_login` VALUES ('70FF651034A24421B1ACEF8043DA7BD8', 'F0E190BA3A9343B3D0C39D790D53C69C', 'admin', '192.168.2.32', '0', '2016-04-05 16:22:35', '2016-04-05 18:51:45', '2016-04-05 16:40:27');
INSERT INTO `log_user_login` VALUES ('710CEF5BE49B4C678C6898388C74832D', '1E0EB21D5D6B94F164A3F18436706329', 'admin', '192.168.2.210', '0', '2016-03-31 19:50:20', '2016-03-31 21:58:27', '2016-03-31 19:50:20');
INSERT INTO `log_user_login` VALUES ('714562169D104ED7B7F4D4E8DCD4FCBC', '54B6081C6EE56A60B9CEBC308A28634A', 'admin', '192.168.2.32', '0', '2016-08-25 18:14:37', '2016-08-26 09:11:42', '2016-08-25 18:14:37');
INSERT INTO `log_user_login` VALUES ('724ADE5F7408432FA633DD52E232161A', '1C76EA5FEF0AE5C01693A3A9CB2FB799', 'admin', '192.168.2.32', '0', '2016-03-31 17:28:28', '2016-03-31 21:18:27', '2016-03-31 19:11:46');
INSERT INTO `log_user_login` VALUES ('72A84B78B96447678548625EB54556DD', '94859E2DE96B7977633EEFA57BBDE604', 'admin', '192.168.2.32', '0', '2016-08-18 12:41:45', '2016-08-18 14:55:32', '2016-08-18 12:41:45');
INSERT INTO `log_user_login` VALUES ('73548E2F203344D6854802429A3AEA46', '414E8E61244ECA0D278A37E8FE97EBBA', 'admin', '192.168.2.129', '0', '2016-09-08 15:58:19', '2016-09-08 18:07:51', '2016-09-08 15:58:19');
INSERT INTO `log_user_login` VALUES ('73607356BDDC43EB9117FC9A6F971DDD', '7C90439C95967FBA028B7E4439BAECD1', 'admin', '192.168.1.129', '0', '2016-04-27 17:24:34', '2016-04-28 15:40:26', '2016-04-27 17:24:34');
INSERT INTO `log_user_login` VALUES ('736B5D2B09FD4A50AC78F6022089EDAC', '4D89E53B8022D2D0DE5B91173A2F680E', 'admin', '192.168.1.129', '0', '2016-04-06 16:11:15', '2016-04-07 10:12:32', '2016-04-06 16:11:15');
INSERT INTO `log_user_login` VALUES ('7427E62B5F7A4153845CF76251C3534E', '2A03EA70742499C7241238C2577E83A7', 'admin', '127.0.0.1', '0', '2016-04-25 13:42:20', '2016-04-25 16:32:05', '2016-04-25 14:01:18');
INSERT INTO `log_user_login` VALUES ('743E7466C46D44CD983A6C9F85268743', '15D749B96B56656F5974EC01738ADE72', 'admin', '192.168.1.231', '0', '2016-05-12 17:35:38', '2016-05-12 19:47:14', '2016-05-12 17:42:07');
INSERT INTO `log_user_login` VALUES ('74A60CB63A1D40F197E8BD8284325643', '78F34D8AEEBB85DBF431EB89BBBE3AAB', 'admin', '192.168.1.239', '0', '2016-03-16 16:46:18', '2016-03-17 14:41:10', '2016-03-16 16:46:18');
INSERT INTO `log_user_login` VALUES ('74AC4B1C4A214D87A0C1E052309AA5D1', 'BEED5510E26CC0628D501A1466B8B604', 'admin', '192.168.2.129', '0', '2016-09-20 16:47:56', '2016-09-20 18:57:33', '2016-09-20 16:47:56');
INSERT INTO `log_user_login` VALUES ('75227D124A904D6FB37FD0DC8362A172', '0408D414462D1B919664467B817C1DFE', 'admin', '192.168.2.129', '0', '2016-08-29 17:22:57', '2016-08-29 20:37:28', '2016-08-29 18:30:29');
INSERT INTO `log_user_login` VALUES ('75BB9378D76346F2A49E1E4F022E9EDB', '78D4AE35B96F110145DDEC53599FDC63', 'admin', '192.168.2.129', '0', '2016-09-27 13:41:34', '2016-09-28 17:29:59', '2016-09-27 13:56:29');
INSERT INTO `log_user_login` VALUES ('76029F24A78D4A338CEAE978BC02ABEA', '0FCBA4F7488D455AF2D7E2D28B17DDDF', 'admin', '192.168.1.239', '0', '2016-03-16 17:14:29', '2016-03-17 14:41:10', '2016-03-16 17:14:29');
INSERT INTO `log_user_login` VALUES ('7606F8DBE58D4C3696E731CAA2E4F493', '797FBC29CE6F1272082215C5C5B0BA46', 'admin', '192.168.2.129', '0', '2016-08-24 19:35:03', '2016-08-24 21:41:16', '2016-08-24 19:35:03');
INSERT INTO `log_user_login` VALUES ('76C5F88AD0FF454CBDE7DAC9C5E23D82', '29B13C7336C7996AB4FABD134E09A990', 'admin', '192.168.2.129', '0', '2016-09-19 09:56:03', '2016-09-19 15:15:52', '2016-09-19 09:56:03');
INSERT INTO `log_user_login` VALUES ('76F4EE1D03A84628BA836458657058B1', '490C7CB3B1DB63D08FCD4518290F9277', 'admin', '127.0.0.1', '1', '2016-10-14 11:09:03', null, '2016-10-14 11:09:03');
INSERT INTO `log_user_login` VALUES ('7700DEF8618443FABBA26AB68962D4ED', '294D290B5D3053F96F045FE06BEF97B9', 'admin', '192.168.2.129', '0', '2016-08-26 11:33:41', '2016-08-26 13:44:28', '2016-08-26 11:33:41');
INSERT INTO `log_user_login` VALUES ('77D14D44CBD04886854C28758C5D4906', '92AD76455C8EC75F39FD85D066F965FE', 'admin', '192.168.1.239', '0', '2016-03-22 16:38:44', '2016-03-22 18:48:06', '2016-03-22 16:38:44');
INSERT INTO `log_user_login` VALUES ('77EFE8CE6AD2488EA857539148D55817', '72F1C466E1576E4FC546F47C33073BD8', 'admin', '192.168.2.129', '0', '2016-09-01 09:54:14', '2016-09-01 12:05:37', '2016-09-01 09:54:14');
INSERT INTO `log_user_login` VALUES ('77F99C624CCF420CBF200F9A2A47DD05', 'FFB736A5B96F03177C43D44C28229C72', 'admin', '192.168.2.32', '0', '2016-03-18 16:20:32', '2016-03-21 16:18:00', '2016-03-18 16:20:32');
INSERT INTO `log_user_login` VALUES ('78B856C1312F4C2E8E200F39BBD5EBEC', '2BFFB05647588DF9CAF542D176250ACB', 'admin', '192.168.2.129', '0', '2016-08-30 18:13:48', '2016-08-30 20:31:04', '2016-08-30 18:25:21');
INSERT INTO `log_user_login` VALUES ('7951C810BDAF4E25B47441C72A2836F8', '25A1A0DD2918E24AAC01276DB365CF2D', 'admin', '192.168.2.210', '0', '2016-04-01 17:38:22', '2016-04-05 10:07:06', '2016-04-01 17:38:22');
INSERT INTO `log_user_login` VALUES ('798911729EDE4B83A1A2EF6D867CFE8D', '0AC5F960569809354968425440961B54', 'admin', '192.168.2.210', '0', '2016-04-20 16:55:04', '2016-04-20 19:39:41', '2016-04-20 17:33:47');
INSERT INTO `log_user_login` VALUES ('79F6479194FD4D11B54FEBAC8047707F', '92492D43C17BF43E49C3F16CCF8D0E1D', 'admin', '192.168.2.129', '0', '2016-08-31 12:55:44', '2016-08-31 16:09:29', '2016-08-31 14:02:14');
INSERT INTO `log_user_login` VALUES ('7A914C8ED57542F084C200AC3B311C6F', '3CAA934A463C2ACB679CEFF0D7204886', 'admin', '192.168.1.129', '0', '2016-04-25 10:19:16', '2016-04-25 13:19:08', '2016-04-25 11:12:14');
INSERT INTO `log_user_login` VALUES ('7AB34D5F6C5D46EBBEF05B2A0168665E', '3E0E440DA4C1ACFBDDF7013FEA6FD0EA', 'admin', '192.168.2.129', '0', '2016-09-12 10:20:33', '2016-09-12 12:35:43', '2016-09-12 10:25:10');
INSERT INTO `log_user_login` VALUES ('7B08A96B03E14490877B8D80768223D8', '3FBF93B972FF831A8286644D548C4FF4', 'admin', '192.168.1.231', '0', '2016-03-31 17:43:50', '2016-03-31 19:50:29', '2016-03-31 17:43:50');
INSERT INTO `log_user_login` VALUES ('7BB3FE4E392940848DB54AC6FF613A27', '078CB43A6B5312547666AE2CD958B49D', 'admin', '192.168.1.231', '0', '2016-05-26 14:30:49', '2016-05-26 16:49:53', '2016-05-26 14:39:57');
INSERT INTO `log_user_login` VALUES ('7BC774D4A4654EB0920279CFFFB10ADD', 'B420C38A9404B3FEB22C937D5DD15D55', 'admin', '192.168.2.129', '0', '2016-09-22 10:50:42', '2016-09-22 13:00:46', '2016-09-22 10:50:43');
INSERT INTO `log_user_login` VALUES ('7C69C4FFC0DC44CAA39996AD54D5AB10', '048B099B6DA30CBD2C7170259478FFCC', 'admin', '192.168.2.129', '0', '2016-09-20 10:25:07', '2016-09-20 13:31:58', '2016-09-20 11:18:22');
INSERT INTO `log_user_login` VALUES ('7CA7575FAC0D40C29CDECCE68D2B919A', '5B22CDFF77BED5238B05C712CDD5CA75', 'admin', '192.168.2.210', '0', '2016-03-30 20:54:13', '2016-03-31 11:29:26', '2016-03-30 20:54:14');
INSERT INTO `log_user_login` VALUES ('7CEF977087D04248B76C713551A5254B', '752E83D5DBD2DBC953FC1D97CFCCA2BF', 'admin', '192.168.2.210', '0', '2016-05-13 15:16:19', '2016-05-13 17:26:28', '2016-05-13 15:16:19');
INSERT INTO `log_user_login` VALUES ('7D839AD8687E42E6954D3B2A67C75A86', 'AE2A966ECCC6AB91D386B56F5CA66BD2', 'admin', '192.168.2.32', '0', '2016-08-24 15:43:50', '2016-08-24 18:11:16', '2016-08-24 16:00:27');
INSERT INTO `log_user_login` VALUES ('7DCDD6E28959453CBC7CD5543E0E7DF3', '3160EC5256EA861EBE375F729B1B9B2D', 'admin', '192.168.2.210', '0', '2016-03-30 19:55:36', '2016-03-30 22:10:43', '2016-03-30 20:02:22');
INSERT INTO `log_user_login` VALUES ('7E1B3EEC78844230AA88BE53102731A1', '1812AA4484F40F805A67EF68CDE6DDEE', 'admin', '192.168.2.32', '0', '2016-08-25 18:07:21', '2016-08-26 09:11:42', '2016-08-25 18:07:21');
INSERT INTO `log_user_login` VALUES ('7E2039C736614565A2416D2D7479AAC5', 'FE4F71BCFFAC2820CD7FA800AB3B0FA6', 'admin', '192.168.1.231', '0', '2016-08-31 17:04:30', '2016-08-31 19:15:36', '2016-08-31 17:04:30');
INSERT INTO `log_user_login` VALUES ('7E34DF8864794BF580F17D2CD2F905CD', 'D00D6A7D47AF1C80D2DD3B92648E3D29', 'admin', '192.168.2.129', '0', '2016-09-22 14:31:49', '2016-09-22 16:40:45', '2016-09-22 14:31:49');
INSERT INTO `log_user_login` VALUES ('7E79AA0186574714BBAB5A8673DDC6F5', '39295D1D250C640491248A4C604BA9DF', 'admin', '192.168.2.129', '0', '2016-08-30 16:25:26', '2016-08-30 18:33:38', '2016-08-30 16:25:26');
INSERT INTO `log_user_login` VALUES ('7E7E9964948340DD8737DAF5BC92BA5E', '1D7C1B4480BCE5175EE29E67EA0BA279', 'admin', '192.168.2.210', '0', '2016-03-30 16:36:09', '2016-03-30 19:36:56', '2016-03-30 17:27:16');
INSERT INTO `log_user_login` VALUES ('7F523FBC85A14F419E00F977596D3C98', 'EEB1BA82047CFB1CEE2E323696708B4F', 'admin', '192.168.2.32', '0', '2016-03-22 17:21:28', '2016-03-22 21:28:06', '2016-03-22 19:22:46');
INSERT INTO `log_user_login` VALUES ('7F65C6D6872B4873AEC65D187E1EDD1D', 'D73165B72C4C40EFDF7A674F4F3688DF', 'admin', '192.168.2.32', '0', '2016-09-19 15:38:23', '2016-09-19 18:09:47', '2016-09-19 16:03:59');
INSERT INTO `log_user_login` VALUES ('7FCB05B0BF894B9F8D0DA008F832DBFE', 'E3B750C41B02E091EFFE6ABEFC71BCE6', 'admin', '192.168.2.129', '0', '2016-09-26 20:52:10', '2016-09-26 23:01:35', '2016-09-26 20:52:10');
INSERT INTO `log_user_login` VALUES ('7FD3255E641642639EE7F5DFB00B232F', 'FD6EB0F17E56734CB122495B4B2203C7', 'admin', '192.168.2.129', '0', '2016-08-31 19:15:02', '2016-08-31 21:25:36', '2016-08-31 19:15:02');
INSERT INTO `log_user_login` VALUES ('80781326A78044A4B1B13B3CE8E5755C', 'BD0E0820419AE76BD5CB0BF50EA15316', 'admin', '192.168.2.129', '0', '2016-09-26 19:32:00', '2016-09-26 21:41:35', '2016-09-26 19:32:00');
INSERT INTO `log_user_login` VALUES ('809AE9D5F4274EA4B94172F93B5FC01A', 'DAA390381AC56F966233CEF87460C9B3', 'admin', '192.168.2.129', '0', '2016-09-26 20:05:09', '2016-09-26 22:11:35', '2016-09-26 20:05:09');
INSERT INTO `log_user_login` VALUES ('815BE2437938490AA5404B31E9AE3B24', 'FC941B392B9090EABA69B311FB57C927', 'admin', '192.168.1.129', '0', '2016-07-27 10:39:22', '2016-07-27 12:52:29', '2016-07-27 10:39:22');
INSERT INTO `log_user_login` VALUES ('8174D9CEBF174F9383A933953047B369', '755E1EEEC4ACBD735889452CD852F7AB', 'admin', '127.0.0.1', '0', '2016-10-13 18:11:33', '2016-10-13 20:23:02', '2016-10-13 18:11:33');
INSERT INTO `log_user_login` VALUES ('81B3EA08FE514FDBA14CC6F1E4CAC4C3', '15B51DB4769BABB8D73FEF3D0D5AEEFC', 'admin', '192.168.2.210', '0', '2016-03-30 19:52:52', '2016-03-30 22:00:43', '2016-03-30 19:52:52');
INSERT INTO `log_user_login` VALUES ('81E7B4F2A22E42FEB71EDEBB3870B48F', '51C8E8550C4AA094C7D7C892F2A14B60', 'admin', '192.168.2.129', '0', '2016-09-26 16:04:28', '2016-09-26 18:18:47', '2016-09-26 16:04:28');
INSERT INTO `log_user_login` VALUES ('81EEA7F8B1424D129ACC89A2AE0959C5', '35D789626AEFD30B4199DD7186A37112', 'admin', '192.168.1.231', '0', '2016-03-26 13:56:47', '2016-03-28 10:59:38', '2016-03-26 14:02:27');
INSERT INTO `log_user_login` VALUES ('81F2F6ECFE4941DFA25615A4892A2E8A', '9EF93D19375A086E46927415BD0BE8C6', 'admin', '192.168.1.231', '0', '2016-04-01 11:55:41', '2016-04-01 14:10:15', '2016-04-01 11:55:41');
INSERT INTO `log_user_login` VALUES ('82321027120A4C34BEA0690FB82FED60', '786332DE49033ED45644199936E5FED0', 'admin', '192.168.2.32', '0', '2016-03-23 14:51:45', '2016-03-23 16:57:24', '2016-03-23 14:51:45');
INSERT INTO `log_user_login` VALUES ('8273090482764CBCB25ADA0DABB4FBF9', '2FA01E5E94691A2EC4947DF161AA2672', 'admin', '192.168.2.32', '0', '2016-08-18 13:53:07', '2016-08-18 16:14:00', '2016-08-18 14:00:23');
INSERT INTO `log_user_login` VALUES ('827A76DD997A4ECDBD806EC4D87BB4CF', '1D0A465A4E8302440842429480085ACE', 'admin', '192.168.1.129', '0', '2016-05-20 16:08:50', '2016-05-23 18:22:38', '2016-05-20 16:08:50');
INSERT INTO `log_user_login` VALUES ('83B42D98A11E4171A931EA3F2BBE762B', '8327AC9984106384BEB4866F1B859CF2', 'admin', '192.168.1.129', '0', '2016-04-06 15:25:53', '2016-04-07 10:12:32', '2016-04-06 15:46:44');
INSERT INTO `log_user_login` VALUES ('83B882CFF907449BBA47C57F3908B1ED', '0E1EE712E75A975E4E9B4F867F7D80F8', 'admin', '192.168.2.32', '0', '2016-08-25 14:52:46', '2016-08-25 17:03:22', '2016-08-25 14:52:46');
INSERT INTO `log_user_login` VALUES ('84C70A430A764BA487C600C4ED4A0479', 'E8131FB3672B59E869FC2AC47D25D212', 'admin', '192.168.2.129', '0', '2016-03-23 11:35:12', '2016-03-23 13:41:31', '2016-03-23 11:35:12');
INSERT INTO `log_user_login` VALUES ('85C5A1D7E7604B30A6C999D762C57A68', '22D31755872CB529917F5A0963ACA4CA', 'admin', '192.168.2.210', '0', '2016-04-18 15:30:52', '2016-04-18 18:43:58', '2016-04-18 16:37:38');
INSERT INTO `log_user_login` VALUES ('85F431EBF13D4D5088193973252DE048', 'F3414BE9FA911B481B3822F4B52911D9', 'admin', '192.168.2.223', '0', '2016-04-22 17:55:05', '2016-04-25 10:29:07', '2016-04-22 17:55:05');
INSERT INTO `log_user_login` VALUES ('860649FAEA734C549164829F94012F8D', 'EB79A3A06842C8B0AB10E2141CDBAC58', 'admin', '192.168.2.32', '0', '2016-08-18 14:25:24', '2016-08-18 17:04:00', '2016-08-18 14:55:02');
INSERT INTO `log_user_login` VALUES ('8647466E68D64956A999C3D768FAFFF0', 'CAF70283D7BB716D9922C326B274FBB7', 'admin', '192.168.2.32', '0', '2016-08-24 11:59:16', '2016-08-24 14:06:55', '2016-08-24 11:59:16');
INSERT INTO `log_user_login` VALUES ('865AD2D6D59A42B6A78A108F55569D48', 'BEF4D1E0FF57DEDD01A808FDB9E22881', 'admin', '127.0.0.1', '0', '2016-04-05 16:09:14', '2016-04-05 18:21:45', '2016-04-05 16:09:14');
INSERT INTO `log_user_login` VALUES ('866D71298A864344ADCAA947EDC97AC9', '6273CD23A23D9C01AD122BDCC522B705', 'admin', '192.168.2.129', '0', '2016-03-23 16:14:15', '2016-03-23 18:20:32', '2016-03-23 16:14:15');
INSERT INTO `log_user_login` VALUES ('868040A9EB5E414982FA85114AA883F0', '2DECE6F0B91E7BCB9C78E01826FB4E47', 'admin', '192.168.1.231', '0', '2016-03-31 20:02:19', '2016-03-31 22:08:27', '2016-03-31 20:02:19');
INSERT INTO `log_user_login` VALUES ('868AA95D0D714611A8C0237267AD0F9F', '9EC563A8EB402C157FD40985F6644D9B', 'admin', '192.168.1.231', '0', '2016-03-31 14:26:25', '2016-03-31 16:33:00', '2016-03-31 14:26:25');
INSERT INTO `log_user_login` VALUES ('8735AA0F5E75493895AD9CA39B24F4CA', 'B3FEE62257A823F42B4E9F8B10A00751', 'admin', '192.168.1.129', '0', '2016-03-25 11:17:10', '2016-03-25 13:23:05', '2016-03-25 11:17:10');
INSERT INTO `log_user_login` VALUES ('87510D994A7044A59E12ED56F76A7110', '13D5DF4B3DA034ABF2EE1946226FEC1D', 'admin', '192.168.2.129', '0', '2016-08-26 13:59:20', '2016-08-26 16:04:29', '2016-08-26 13:59:20');
INSERT INTO `log_user_login` VALUES ('876B7F2F3AF84705906505CD81ACE26B', '723D1AEBA6D21EC7F0E38F25CBFE7558', 'admin', '192.168.2.129', '0', '2016-09-26 16:40:37', '2016-09-26 18:48:47', '2016-09-26 16:40:37');
INSERT INTO `log_user_login` VALUES ('87B5B55A7FAA45F4BECB463B135A8D1D', 'E6A865C5357707658E94D7EC5DD68670', 'admin', '192.168.2.32', '0', '2016-03-18 16:37:55', '2016-03-21 16:18:00', '2016-03-18 16:37:55');
INSERT INTO `log_user_login` VALUES ('87DA3C521D344B4097B248E16EEAEDC8', '0E48A2A51297885EA6EDDA7A3E779544', 'admin', '127.0.0.1', '1', '2016-10-14 10:14:23', null, '2016-10-14 10:14:24');
INSERT INTO `log_user_login` VALUES ('8836AEFF2A114A8FB1E53BCBE34F8164', '3EABC659D44AF2134309F883BF4F1AB3', 'admin', '192.168.1.129', '0', '2016-04-27 14:42:14', '2016-04-27 16:59:46', '2016-04-27 14:42:14');
INSERT INTO `log_user_login` VALUES ('884E211CCAC242EE9F8E619BE5CF530F', '3EE06DD4D28F257BC7D874BFB33F53AE', 'admin', '192.168.1.231', '0', '2016-03-24 11:33:08', '2016-03-24 13:39:08', '2016-03-24 11:33:08');
INSERT INTO `log_user_login` VALUES ('88D0E3C025D24912AA0816E67C766A32', 'C7FFD132ADF098D5D6B81E18E753E680', 'admin', '192.168.2.210', '0', '2016-06-02 17:51:27', '2016-07-22 16:38:20', '2016-06-02 17:51:28');
INSERT INTO `log_user_login` VALUES ('8903F6142E1449B1931F95C2AE26E1F1', 'D5A2F7A559CF5CB4DF4C7C91063EF28A', 'admin', '192.168.2.210', '0', '2016-03-30 11:32:42', '2016-03-30 13:40:56', '2016-03-30 11:32:42');
INSERT INTO `log_user_login` VALUES ('895DAEAE7A31425093DDEC2058FF539D', 'FC1DBC1C5C7A1E066706B77EF98F13AD', 'admin', '192.168.2.129', '0', '2016-09-27 10:07:01', '2016-09-27 12:28:24', '2016-09-27 10:18:50');
INSERT INTO `log_user_login` VALUES ('8994BDE0D1724FFB8DB82DE640ECA3D3', '02F3ED7BC4E716B110AEA67640C4DE7A', 'admin', '192.168.2.210', '0', '2016-03-31 19:13:02', '2016-03-31 21:18:27', '2016-03-31 19:13:02');
INSERT INTO `log_user_login` VALUES ('8A056BE0368146D2BD7A0C21A646BD47', '5EF1A9D4363B8F6358CC368327149A1F', 'admin', '192.168.2.210', '0', '2016-04-21 17:59:05', '2016-04-22 16:17:44', '2016-04-21 17:59:05');
INSERT INTO `log_user_login` VALUES ('8A212D6F6D2047EC9540B55157891B08', '976CCDC9CA866DBF95553A409D5CC44B', 'admin', '192.168.2.32', '0', '2016-02-01 14:30:08', '2016-02-22 15:23:52', '2016-02-01 14:30:08');
INSERT INTO `log_user_login` VALUES ('8A719DD9C39846A48CDA17295A8ABE69', 'BE94030366A424FC32EC39B85DCBCD77', 'admin', '192.168.1.239', '0', '2016-03-30 16:51:39', '2016-03-30 18:56:56', '2016-03-30 16:51:39');
INSERT INTO `log_user_login` VALUES ('8B0F28063DAC478D88E866EA017929CD', '77C99AAB246D3B9569365EF0D5D70837', 'admin', '192.168.2.32', '0', '2016-03-22 11:53:11', '2016-03-22 14:48:06', '2016-03-22 12:38:17');
INSERT INTO `log_user_login` VALUES ('8BAFEF10C15146978E4DAAD46CF07BEA', '64594DE140D22C7BEEE2F5A49D937357', 'admin', '192.168.2.32', '0', '2016-07-28 10:31:38', '2016-07-28 12:40:33', '2016-07-28 10:31:38');
INSERT INTO `log_user_login` VALUES ('8BD8FED0761447829408802D160ABA04', '1419E29059A8B4754783A51733DD7ACD', 'admin', '192.168.2.129', '0', '2016-09-27 11:29:05', '2016-09-27 13:38:24', '2016-09-27 11:29:05');
INSERT INTO `log_user_login` VALUES ('8C84B50B0B3F47B8A99FF64B55CD46D3', '727055679A5D68249CAE1E0616F230E1', 'admin', '192.168.2.32', '0', '2016-03-23 15:15:17', '2016-03-23 17:40:31', '2016-03-23 15:29:11');
INSERT INTO `log_user_login` VALUES ('8CDDAA19BC264820A31EF572E566E5C8', 'F86658E9D3150FC6996FBD9A9CFCE879', 'admin', '192.168.2.32', '0', '2016-03-24 14:25:31', '2016-03-24 16:34:50', '2016-03-24 14:25:31');
INSERT INTO `log_user_login` VALUES ('8CF09DEA0238466391796E25E328ED7E', '9EA6548C8E8FF00F3484B1DB10BA9F9F', 'admin', '192.168.2.32', '0', '2016-07-26 14:12:40', '2016-07-26 16:20:05', '2016-07-26 14:12:40');
INSERT INTO `log_user_login` VALUES ('8ED9E43D17BE45B38C62643854723275', 'D495EBC1D9D968FD59976CC2AADF6C8E', 'admin', '192.168.2.32', '0', '2016-04-05 19:20:09', '2016-04-06 15:35:30', '2016-04-05 19:20:09');
INSERT INTO `log_user_login` VALUES ('8F092869AD474589A8E73121166386A6', 'CFDCFDEFDBF883070A6DA140AE90269E', 'admin', '192.168.2.210', '0', '2016-03-28 15:36:36', '2016-03-28 18:39:12', '2016-03-28 16:24:45');
INSERT INTO `log_user_login` VALUES ('8FA76665DEA64465A1C1E2BEF6AE4C6A', 'B445DA602C24E106669653B994AAB140', 'admin', '192.168.2.32', '0', '2016-07-27 16:58:20', '2016-07-28 10:27:47', '2016-07-27 16:58:20');
INSERT INTO `log_user_login` VALUES ('8FDC1FC59A304A8298C15A6E7DF8AC9A', 'E2957691F9899619DBCD6C162A74F115', 'admin', '127.0.0.1', '0', '2016-01-28 18:09:02', '2016-01-28 23:07:15', '2016-01-28 18:09:02');
INSERT INTO `log_user_login` VALUES ('92176D5ED505497D82EF232CDA05C68E', '4F00D11D7738CE6CA8F1141AB2F2B3D0', 'admin', '192.168.1.239', '0', '2016-03-23 15:32:18', '2016-03-23 17:50:31', '2016-03-23 15:39:16');
INSERT INTO `log_user_login` VALUES ('92C6D56EAD534B5E95951D0E0DC2B6F0', 'A0052EC8BC623308C4DE27AD89FDA9DA', 'admin', '192.168.1.129', '0', '2016-04-25 15:58:57', '2016-04-25 18:09:18', '2016-04-25 15:58:57');
INSERT INTO `log_user_login` VALUES ('92FF69727BF44DB8B38803B4D3323FEF', '8D206643DD3E89D2AB909E26550DB623', 'admin', '192.168.2.210', '0', '2016-04-05 16:32:50', '2016-04-05 19:31:45', '2016-04-05 17:21:17');
INSERT INTO `log_user_login` VALUES ('9322E0AFE10E4733A81DF96CFA9CF352', 'C0C3835E34C13D8E4455010D619044AC', 'admin', '192.168.1.129', '0', '2016-04-27 16:45:30', '2016-04-28 15:40:26', '2016-04-27 16:45:30');
INSERT INTO `log_user_login` VALUES ('9345B329B4DA425197464ACAD81AB1ED', '0C0AF0F8E0619D42EA9C50BF30B25D4D', 'admin', '192.168.1.129', '0', '2016-04-21 16:48:31', '2016-04-21 17:13:14', '2016-04-21 17:00:38');
INSERT INTO `log_user_login` VALUES ('93A6BD4C0F134D7D9E68807EFB47118C', '0EEE74178F1BC009B477DBFD10CA6151', 'admin', '192.168.2.129', '0', '2016-09-28 18:12:10', '2016-09-28 21:12:12', '2016-09-28 19:04:34');
INSERT INTO `log_user_login` VALUES ('93DF075081444C5F987ED7437018426C', 'E77E19E1F6CBAE9ED66A9C244116237F', 'admin', '192.168.1.231', '0', '2016-05-25 15:45:09', '2016-05-25 17:53:33', '2016-05-25 15:45:09');
INSERT INTO `log_user_login` VALUES ('941065A88096413694E7FB33DA7868BE', 'FA603241D0143394F505C50B4AD5D9B7', 'admin', '192.168.2.129', '0', '2016-08-26 11:20:37', '2016-08-26 13:34:28', '2016-08-26 11:20:37');
INSERT INTO `log_user_login` VALUES ('94848CB3E27F41EBB8A19CE52D2BFF97', '826C1563D09C2C966EA8350167535663', 'admin', '192.168.3.117', '0', '2016-03-25 10:53:31', '2016-03-25 13:43:06', '2016-03-25 11:34:39');
INSERT INTO `log_user_login` VALUES ('94958D29A2744457AD88351648D7DB1C', 'D772AF3FECDDFB325D97EFB656EE9F42', 'admin', '192.168.2.129', '0', '2016-03-23 17:30:35', '2016-03-23 17:31:34', '2016-03-23 17:30:35');
INSERT INTO `log_user_login` VALUES ('94E6744B789E4143B0F6F8A3BAB0E4F8', '714747056E32BB240A2694D2199E7979', 'admin', '192.168.3.117', '0', '2016-03-25 09:57:39', '2016-03-25 12:56:29', '2016-03-25 10:49:17');
INSERT INTO `log_user_login` VALUES ('95BB8CA3585C4A968362A304878A2399', '8B7F7E239DC0CC9E46C1C1A0D76E0BE7', 'admin', '192.168.1.129', '0', '2016-04-28 17:50:12', '2016-05-03 15:41:59', '2016-04-28 17:50:12');
INSERT INTO `log_user_login` VALUES ('95C8223304644918A75517CA6F9EBECB', 'B0EB775CE8306A7C93190E3F300F5B4A', 'admin', '192.168.1.231', '0', '2016-08-31 12:00:42', '2016-08-31 14:08:44', '2016-08-31 12:00:42');
INSERT INTO `log_user_login` VALUES ('95FD8A4209AF47E29ABD3E7904014B08', 'F66608CF801121AF09BE966B047DDEFB', 'admin', '192.168.1.239', '0', '2016-03-28 18:57:29', '2016-03-28 21:06:42', '2016-03-28 18:57:29');
INSERT INTO `log_user_login` VALUES ('961CF7C0A8144F36BD241501BAFC9195', 'EA61264EF3652756DDF290E0BCACA1CD', 'admin', '192.168.2.129', '0', '2016-03-23 14:47:12', '2016-03-23 16:52:37', '2016-03-23 14:47:12');
INSERT INTO `log_user_login` VALUES ('9704288D23CA49969CA85C5C5283C0DA', 'B6FA4619A04906F6B13FB1F8E35B7591', 'admin', '192.168.2.129', '0', '2016-09-20 11:22:03', '2016-09-20 13:31:58', '2016-09-20 11:22:03');
INSERT INTO `log_user_login` VALUES ('971889EB1C4646ECB8873F4784171BCF', '6B4BDA7B126DA82D21D88B9B26949923', 'admin', '192.168.1.239', '0', '2016-03-16 17:22:36', '2016-03-17 14:41:10', '2016-03-16 17:22:36');
INSERT INTO `log_user_login` VALUES ('976BDD7350854E349A5575B4D6F52545', '6AD8C5B5D5A688587FD6DF399474337C', 'admin', '192.168.1.129', '0', '2016-04-27 16:38:21', '2016-04-28 15:40:26', '2016-04-27 16:38:21');
INSERT INTO `log_user_login` VALUES ('979717D5617D4467A885A087623C6909', '9D1A49AC46062A5E8C038B02A7425286', 'admin', '192.168.2.129', '0', '2016-09-29 16:38:29', '2016-09-30 11:00:59', '2016-09-29 17:24:19');
INSERT INTO `log_user_login` VALUES ('982F1BD948FB480BA94A3258768BDC4F', 'D21EB0E239249B39CA6E8E6932F6691E', 'admin', '192.168.2.129', '0', '2016-03-24 14:23:26', '2016-03-24 16:39:08', '2016-03-24 14:33:24');
INSERT INTO `log_user_login` VALUES ('987B060BD2534736B06D5A4781A9E77B', 'D3BA1F2F1AD36EA9D5DB7FDAA40D0246', 'admin', '192.168.2.129', '0', '2016-09-22 13:45:35', '2016-09-22 16:00:44', '2016-09-22 13:50:54');
INSERT INTO `log_user_login` VALUES ('988EA060661C4782898E43FDC2489F10', 'A07FD3D6832AD976F3B7D30CA19C30D9', 'admin', '192.168.1.239', '0', '2016-03-23 11:18:43', '2016-03-23 13:27:25', '2016-03-23 11:18:43');
INSERT INTO `log_user_login` VALUES ('98AA82093E8A421EB090B8FDFCFBFB16', '056580AE9F1E7FDB08E252A1B6706922', 'admin', '192.168.2.210', '0', '2016-03-30 21:05:21', '2016-03-31 11:29:26', '2016-03-30 21:05:21');
INSERT INTO `log_user_login` VALUES ('98AECE33C22D44BCB600E92B36C244C8', 'A43795834C230CEC184C40DA95569FBF', 'admin', '192.168.2.129', '0', '2016-08-30 20:48:01', '2016-08-30 23:03:40', '2016-08-30 20:53:50');
INSERT INTO `log_user_login` VALUES ('98D717A289BC455F9F1A0F4FAE58AAF3', 'E4CD96191783A968BDEA154B1C87608F', 'admin', '192.168.2.129', '0', '2016-08-29 10:01:02', '2016-08-29 12:45:10', '2016-08-29 10:38:50');
INSERT INTO `log_user_login` VALUES ('99B8F42189C94726B6AFE9A744F7E937', '25672510D07608E6D90DE3FA840B488B', 'admin', '192.168.1.231', '0', '2016-05-12 11:53:26', '2016-05-12 16:35:53', '2016-05-12 14:28:44');
INSERT INTO `log_user_login` VALUES ('99D0788F4E774430B83A2AE66F0EE6E0', '5932A0A1A26FF960C907A91594A2E59F', 'admin', '192.168.1.239', '0', '2016-03-17 15:10:21', '2016-03-17 17:50:10', '2016-03-17 15:10:21');
INSERT INTO `log_user_login` VALUES ('9A182B2F88434A51ABC7C0B7B3282E26', '5A02B004015FD8B41AE89837EC4BA7B0', 'admin', '192.168.2.32', '0', '2016-07-27 09:52:06', '2016-07-27 12:02:28', '2016-07-27 09:52:06');
INSERT INTO `log_user_login` VALUES ('9A9EBD523A5C4FEAB6A3613082CC15EF', 'BE6B11C46C39D3A92D19C94CF43C1F7E', 'admin', '192.168.1.129', '0', '2016-05-20 10:19:14', '2016-05-23 18:22:38', '2016-05-20 10:19:14');
INSERT INTO `log_user_login` VALUES ('9B53D09962E0472C82ACA21A9DC868C2', 'BD8ED75D8D38E867C80F3B6E2B5F0B89', 'admin', '192.168.1.231', '0', '2016-04-20 16:01:44', '2016-04-20 18:09:41', '2016-04-20 16:01:44');
INSERT INTO `log_user_login` VALUES ('9B6C02F6D73948368F1828636053B853', '045DAF483DD799C6A19F422026091A09', 'admin', '192.168.2.32', '0', '2016-08-17 09:53:04', '2016-08-17 13:31:49', '2016-08-17 11:26:38');
INSERT INTO `log_user_login` VALUES ('9BDC04A8756640EB95D68F0D9FEFF85B', '1525C6AE722F2F9ECEA565DD524FDECA', 'admin', '192.168.2.223', '0', '2016-04-18 16:44:13', '2016-04-19 15:01:01', '2016-04-18 17:55:35');
INSERT INTO `log_user_login` VALUES ('9C1CF5379C9B4AC992440B9AEE9C360F', '180A8AFF1951087F93559F0E5CFF58E0', 'admin', '192.168.2.32', '0', '2016-08-25 18:13:32', '2016-08-26 09:11:42', '2016-08-25 18:13:32');
INSERT INTO `log_user_login` VALUES ('9C8016FC52014B2FBE53B904DBFF0F74', '6CB9CA106508C31FF1607D71EB1A1008', 'admin', '192.168.1.231', '0', '2016-08-31 12:18:36', '2016-08-31 14:24:20', '2016-08-31 12:18:36');
INSERT INTO `log_user_login` VALUES ('9C8B458F8E5749F4957469C85DD5AE10', '272F15958E1395266016CE4AE286BAEC', 'admin', '192.168.2.129', '0', '2016-09-19 16:28:46', '2016-09-19 18:35:57', '2016-09-19 16:28:46');
INSERT INTO `log_user_login` VALUES ('9CA5BD19C13049699E72F17A3668CA1F', 'D5073C36B731D3A217087C3AC1EB3F43', 'admin', '192.168.2.223', '0', '2016-05-11 21:43:53', '2016-05-12 11:56:52', '2016-05-11 21:43:54');
INSERT INTO `log_user_login` VALUES ('9CFCCCE7FE9B40DCB57F86F2DD6C4A03', '21342871C1637E4F84150BA4976A2A98', 'admin', '127.0.0.1', '0', '2016-04-05 16:21:58', '2016-04-05 18:31:45', '2016-04-05 16:21:58');
INSERT INTO `log_user_login` VALUES ('9D20A2E9720D4D4288B92E62FDAC963F', '4727ACDA93E64C29A36CA46C27FB4807', 'admin', '192.168.1.239', '0', '2016-03-28 18:52:52', '2016-03-28 21:06:42', '2016-03-28 18:52:52');
INSERT INTO `log_user_login` VALUES ('9D9C0C2F5AD849A0B9D574909353D35D', '83AEBE52B43FE65EF84310F5626CB6CB', 'admin', '192.168.2.32', '0', '2016-04-05 16:14:12', '2016-04-05 18:21:45', '2016-04-05 16:14:12');
INSERT INTO `log_user_login` VALUES ('9DABAC225A2E457AB37F88AF29EB6FCD', '2725400BC6BF42629725AE7693D07097', 'admin', '192.168.2.129', '0', '2016-03-23 15:18:57', '2016-03-23 17:32:37', '2016-03-23 15:25:02');
INSERT INTO `log_user_login` VALUES ('9DF807FEA1354D50827E84828EFBF3A0', '95EBD7DA4635988EFB4954F0B6E56507', 'admin', '192.168.2.129', '0', '2016-08-31 18:35:08', '2016-08-31 20:45:36', '2016-08-31 18:35:08');
INSERT INTO `log_user_login` VALUES ('9E591AC873D14F89BF5FE0253A48AF24', '4444BB6B7200DE2508A46948699F740A', 'admin', '127.0.0.1', '0', '2016-08-29 11:32:12', '2016-08-29 15:57:28', '2016-08-29 13:45:35');
INSERT INTO `log_user_login` VALUES ('9F0B45A94328450A9647264C6B57BDD6', '97C0204F70FBE50B574456A4C27AAA06', 'admin', '192.168.1.239', '0', '2016-03-30 16:34:49', '2016-03-30 18:46:56', '2016-03-30 16:34:50');
INSERT INTO `log_user_login` VALUES ('9F76A60FB43C4790BD3AA932BF7DF285', '25DABB26C6C06FBC970A655C87A9CE46', 'admin', '192.168.2.129', '0', '2016-08-25 17:08:58', '2016-08-25 19:37:32', '2016-08-25 17:08:58');
INSERT INTO `log_user_login` VALUES ('9F960D0733684492A981CEC73FC5B233', '5C8CF6A13A078588CCD0B249309A76F6', 'admin', '192.168.2.32', '0', '2016-07-26 13:59:28', '2016-07-26 16:10:05', '2016-07-26 13:59:28');
INSERT INTO `log_user_login` VALUES ('9FB80DE7EBE84F078CEC24FE461A9627', 'A72181725845C963D9D8D9FEF3BBAD7B', 'admin', '192.168.1.129', '0', '2016-05-19 16:54:41', '2016-05-20 10:29:06', '2016-05-19 16:54:41');
INSERT INTO `log_user_login` VALUES ('A048DEC7533545D99F427C71D1EE1440', '5E40818EFEF167FC14289660171307C2', 'admin', '192.168.2.32', '0', '2016-09-18 15:51:44', '2016-09-18 18:03:39', '2016-09-18 15:57:42');
INSERT INTO `log_user_login` VALUES ('A0C084C02E5845049C685ABEAD7DCF2F', '2240B02A7FF54DBB9CA1778C35454DDE', 'admin', '192.168.2.129', '0', '2016-09-29 11:01:36', '2016-09-29 13:48:32', '2016-09-29 11:12:27');
INSERT INTO `log_user_login` VALUES ('A0F5D7234D924A55A3A65F90A539D026', '09EBAA4CE49EA8635F1F8B8E6018DF85', 'admin', '192.168.2.32', '0', '2016-03-24 09:58:12', '2016-03-24 12:04:00', '2016-03-24 09:58:12');
INSERT INTO `log_user_login` VALUES ('A13E45EEF420495DBFBEA57C7BA50D8B', '7ABEEDD734B5031FE3A33EE3AB53BDFA', 'admin', '127.0.0.1', '0', '2016-10-10 10:18:31', '2016-10-13 16:57:23', '2016-10-10 10:18:31');
INSERT INTO `log_user_login` VALUES ('A153FB5F88014E2E80366600E09093ED', '82BA90CE22A5696E11AF9FE6A23654EC', 'admin', '192.168.2.210', '0', '2016-04-05 15:39:48', '2016-04-05 17:52:38', '2016-04-05 15:39:48');
INSERT INTO `log_user_login` VALUES ('A1AFFB7A07784394BAB79F3E0A1B35AA', '812B8A8503C46E606FCBF538C32F82C2', 'admin', '192.168.2.32', '0', '2016-03-21 22:13:18', '2016-03-22 00:21:27', '2016-03-21 22:13:18');
INSERT INTO `log_user_login` VALUES ('A1B4ACE5B583419EA1FF1CD47CA6EDEB', '6ECCCAD380ADDB7E4C29AAA31BA4FD5E', 'admin', '192.168.2.210', '0', '2016-04-25 16:22:21', '2016-04-25 19:19:18', '2016-04-25 17:09:43');
INSERT INTO `log_user_login` VALUES ('A1F03479199B4613ABF14B4958E8E12B', '2469904ADD3613846124696E705F8D1F', 'admin', '192.168.2.210', '0', '2016-03-30 18:36:52', '2016-03-30 21:50:43', '2016-03-30 19:38:40');
INSERT INTO `log_user_login` VALUES ('A256070960E64AFA8CCDDE57EBB08B42', 'DCA2A22F68EEAA98C6006315B58ECEB0', 'admin', '192.168.2.32', '0', '2016-08-29 19:54:32', '2016-08-29 22:07:28', '2016-08-29 19:54:32');
INSERT INTO `log_user_login` VALUES ('A2A8EF06702E44B486E4E8F0D471D79D', '90E5E08F26569C233F79AFA56DC7882F', 'admin', '192.168.2.32', '0', '2016-03-21 20:15:38', '2016-03-21 22:21:27', '2016-03-21 20:15:38');
INSERT INTO `log_user_login` VALUES ('A3297D433D8046B8A98A0C3628A1EB47', '5FEE07D6C059BD9C984FC746A2B0BC2D', 'admin', '192.168.1.231', '0', '2016-05-12 17:08:28', '2016-05-12 19:28:11', '2016-05-12 17:22:39');
INSERT INTO `log_user_login` VALUES ('A355AE456C294F76848D717E21CBE492', 'B889146D14940D6DB05F9B76596D32C3', 'admin', '192.168.1.129', '0', '2016-04-07 11:21:21', '2016-04-07 13:44:32', '2016-04-07 11:37:32');
INSERT INTO `log_user_login` VALUES ('A35E8E2288074B179DCC126814814E66', '300076CD912755E029AD6E50AFA85E12', 'admin', '192.168.2.32', '0', '2016-03-30 18:40:54', '2016-03-30 22:00:43', '2016-03-30 19:50:47');
INSERT INTO `log_user_login` VALUES ('A365DB359EF2460EA4AEA9CFDC310ED1', '36201A74777BCE65FB3E7813BC9B04C4', 'admin', '192.168.2.210', '0', '2016-03-30 14:03:15', '2016-03-30 16:36:16', '2016-03-30 14:30:04');
INSERT INTO `log_user_login` VALUES ('A37BD9884BFD468A9C9F63E8D3C918BC', '0021563407759298E0601BC2C0068F2F', 'admin', '192.168.2.129', '0', '2016-08-26 16:21:09', '2016-08-29 10:08:52', '2016-08-26 16:37:33');
INSERT INTO `log_user_login` VALUES ('A3C627ADD0CB42EFB4B95D2F76F730C9', '0FA0829D0CD77E095A87FDB7450C2028', 'admin', '192.168.2.129', '0', '2016-08-30 11:14:40', '2016-08-30 13:23:42', '2016-08-30 11:14:40');
INSERT INTO `log_user_login` VALUES ('A3CE24AE993F44D39489FB77E51E10B1', 'E4D6CA6E3282ABFA94D19B9EC00C89FD', 'admin', '192.168.2.210', '0', '2016-03-31 19:28:53', '2016-03-31 21:48:27', '2016-03-31 19:42:14');
INSERT INTO `log_user_login` VALUES ('A3E1755C32B64C8AB0F4CEA32FD3A44B', '402911DA07956E01F9F630E230CBEA8B', 'admin', '192.168.2.32', '0', '2016-03-23 13:56:57', '2016-03-23 16:02:37', '2016-03-23 13:56:57');
INSERT INTO `log_user_login` VALUES ('A43C3ADD886441499C0D2A687D928634', '1EAC85BB45BB9DEF628BFF4440656C88', 'admin', '113.91.173.0, 10.10.10.1', '0', '2016-01-26 18:34:38', '2016-01-26 21:20:47', '2016-01-26 19:12:30');
INSERT INTO `log_user_login` VALUES ('A4540C86D26749E19534D33351E38BE3', '0BCB894FDB348D7927C62E74D399F147', 'admin', '127.0.0.1', '0', '2016-08-30 16:53:56', '2016-08-30 19:03:38', '2016-08-30 16:53:56');
INSERT INTO `log_user_login` VALUES ('A4914349EE424BD9A955F9D1E2AC7030', '4BA8DBAB5E7C5002F53F33E4A6E24602', 'admin', '192.168.2.129', '0', '2016-09-26 15:39:13', '2016-09-26 17:48:47', '2016-09-26 15:39:13');
INSERT INTO `log_user_login` VALUES ('A5081A00F0484B5C8BF1131CBA7A7802', 'D6F2B21D8198964C30A629E6F0BA4BFD', 'admin', '192.168.2.210', '0', '2016-04-22 16:08:01', '2016-04-22 18:17:44', '2016-04-22 16:12:07');
INSERT INTO `log_user_login` VALUES ('A67BFAFB935B4B258183D7E2706F85F1', '83D9BD76F7BF9EFEDB0343B326FCDAB5', 'admin', '192.168.1.231', '0', '2016-08-31 09:52:33', '2016-08-31 12:15:22', '2016-08-31 10:02:52');
INSERT INTO `log_user_login` VALUES ('A68B3DAFC8F34B6BBD454DABFEE35B64', '7137B35B9C20F3619D06EDD0EB2E5318', 'admin', '192.168.2.129', '0', '2016-09-26 16:10:16', '2016-09-26 18:18:47', '2016-09-26 16:10:16');
INSERT INTO `log_user_login` VALUES ('A6E84E6A9ABF4215B37C0B4E2F616A6A', '56867C39C9F7FA6D24B94B443DB18092', 'admin', '192.168.2.210', '0', '2016-03-30 14:50:11', '2016-03-30 16:56:16', '2016-03-30 14:50:11');
INSERT INTO `log_user_login` VALUES ('A6EC321ACB7341E9AB539B599971B447', '5111C454E8FCFD82E29A10026230A84D', 'admin', '192.168.3.117', '0', '2016-04-21 09:42:48', '2016-04-21 11:49:46', '2016-04-21 09:42:48');
INSERT INTO `log_user_login` VALUES ('A7114920F31F475DA4EEFC5EF2EE00AF', '78E057F3DA829969FBCC57E5F730BABE', 'admin', '192.168.2.32', '0', '2016-03-15 19:54:08', '2016-03-16 00:53:32', '2016-03-15 20:04:33');
INSERT INTO `log_user_login` VALUES ('A7220A148049469A9EAE13F6532DC38D', '9E125BFFD033B2DE5F7F445C88381351', 'admin', '192.168.2.210', '0', '2016-04-05 09:57:07', '2016-04-05 12:07:06', '2016-04-05 09:57:08');
INSERT INTO `log_user_login` VALUES ('A72330D5383642C184C6FF60B1BA70B0', '3FE2572052EE52DD19CA5E4F72D28A1D', 'admin', '192.168.2.32', '0', '2016-07-26 18:58:58', '2016-07-27 09:38:30', '2016-07-26 18:58:58');
INSERT INTO `log_user_login` VALUES ('A735159954FE4949BF5DE87F15CE5BD1', '7AD57233AB6A8B85B1EE4D1A3389EC38', 'admin', '192.168.1.129', '0', '2016-04-21 16:24:24', '2016-04-21 18:39:47', '2016-04-21 16:29:18');
INSERT INTO `log_user_login` VALUES ('A751C94B7ABD475D848C892BDB0D2275', 'D6D199F0E2FAD311D2F7DB11DB7458EC', 'admin', '192.168.2.210', '0', '2016-05-13 17:58:11', '2016-05-16 15:49:14', '2016-05-13 17:58:11');
INSERT INTO `log_user_login` VALUES ('A75B514700A741B4B46BA63F8546BEE2', 'E79066EC3378B39EE5D08441D4ED3CEC', 'admin', '192.168.1.129', '0', '2016-04-28 17:46:55', '2016-05-03 15:41:59', '2016-04-28 17:46:56');
INSERT INTO `log_user_login` VALUES ('A7A4FD8CEE794DCCA12DC33B9B2693B6', '3F320D6122C7DD34F703D5E828E9B0B8', 'admin', '192.168.2.210', '0', '2016-05-11 22:26:02', '2016-05-12 11:56:52', '2016-05-11 22:26:02');
INSERT INTO `log_user_login` VALUES ('A7D9D8A85E4F4977A93114B723C12892', 'FBE186FA7A3477F955614C1A59A505FF', 'admin', '192.168.2.129', '0', '2016-09-26 17:18:43', '2016-09-26 21:11:35', '2016-09-26 19:00:26');
INSERT INTO `log_user_login` VALUES ('A80B2C2729F947DCB2296FA814D4D685', '62374A9185E935C726EB0B41F93AE9DB', 'admin', '192.168.1.129', '0', '2016-04-27 14:36:40', '2016-04-27 16:59:46', '2016-04-27 14:36:41');
INSERT INTO `log_user_login` VALUES ('A818071C537C4069A7BE440FA622A019', '61DAEBD0E6700D6DB99040F34EBFF4D3', 'admin', '192.168.2.32', '0', '2016-08-26 11:04:39', '2016-08-26 13:14:28', '2016-08-26 11:04:39');
INSERT INTO `log_user_login` VALUES ('A8339E79707A410897A707D1B7EEE5B1', '89B591540F1DFA0DCDA5056C853704D1', 'admin', '192.168.3.117', '0', '2016-04-20 17:55:16', '2016-04-20 20:42:17', '2016-04-20 18:37:13');
INSERT INTO `log_user_login` VALUES ('A90BCC8D907B4B0EB80662A593F5787F', 'D7ABE328C6517C870E3B1D5CF1AE9DE7', 'admin', '192.168.2.32', '0', '2016-09-24 11:33:41', '2016-09-24 13:42:29', '2016-09-24 11:33:41');
INSERT INTO `log_user_login` VALUES ('A9F1287DF4414C198BAF39DD2ED94D8C', 'A6F6F8002374EE16BBC27C06761B0D9A', 'admin', '192.168.1.129', '0', '2016-04-27 16:49:48', '2016-04-28 15:40:26', '2016-04-27 17:08:53');
INSERT INTO `log_user_login` VALUES ('AB78DBE145B5475E8AECB8A919C1CDCB', '576D4D317A7EACDBC418DF0902E3EB09', 'admin', '192.168.2.129', '0', '2016-03-24 09:52:52', '2016-03-24 12:19:08', '2016-03-24 10:12:02');
INSERT INTO `log_user_login` VALUES ('AB82E330915847F9BC11A47B8149DD69', 'EBA7D5E82A6D8903054AB62E110D160F', 'admin', '192.168.2.32', '0', '2016-09-18 17:03:39', '2016-09-18 19:19:07', '2016-09-18 17:13:05');
INSERT INTO `log_user_login` VALUES ('ACAD75888442448394EBD88B88567152', '9CC3B40AF5D9EFDD6FDC2B0B71DA1AAA', 'admin', '192.168.2.129', '0', '2016-03-24 10:50:33', '2016-03-24 13:04:49', '2016-03-24 10:59:20');
INSERT INTO `log_user_login` VALUES ('ACDBF12CE8F6456AAC04F5EBE0FEB6FF', 'AAB0D844D312A928284B94F8571B6F86', 'admin', '192.168.2.210', '0', '2016-05-11 21:31:58', '2016-05-12 11:56:52', '2016-05-11 21:39:07');
INSERT INTO `log_user_login` VALUES ('AD9AC096301F4F189D2E530D9BEAD78C', 'E575ECE4730979BED9E9F75C7A8AD090', 'admin', '192.168.2.32', '0', '2016-09-20 18:11:15', '2016-09-20 20:17:33', '2016-09-20 18:11:16');
INSERT INTO `log_user_login` VALUES ('ADA23EF01633405C909F34E77CA7BA32', 'ED6AEB87DC67D4D35DC7B07EB23FFBA1', 'admin', '192.168.1.239', '0', '2016-03-17 15:49:58', '2016-03-17 18:00:10', '2016-03-17 15:49:58');
INSERT INTO `log_user_login` VALUES ('ADCA0E82947D44958B503747A84A54A0', 'DDB48E74614B772FD3A92B4B7CCD9D0F', 'admin', '192.168.2.129', '0', '2016-09-26 17:16:06', '2016-09-26 19:24:30', '2016-09-26 17:16:06');
INSERT INTO `log_user_login` VALUES ('ADCE2684976E4A989087747D9A55B902', '92BC9A45D213A464BB9068E5F3C0F578', 'admin', '192.168.1.239', '0', '2016-03-31 14:38:49', '2016-03-31 16:56:22', '2016-03-31 14:38:49');
INSERT INTO `log_user_login` VALUES ('AE44EFC41A9E4A00BFC25F93BAC5D74C', '4873B1C5BB57EEEFA0FEF22F7D0F62C1', 'admin', '192.168.2.210', '0', '2016-04-05 17:55:27', '2016-04-05 20:01:45', '2016-04-05 17:55:27');
INSERT INTO `log_user_login` VALUES ('AFA880E9C8ED43CC8D2B6034F66D1F06', '9E2B82CAEA90CC75A4698B5A4E3D89D9', 'admin', '192.168.2.129', '0', '2016-03-18 16:35:17', '2016-03-21 16:18:00', '2016-03-18 16:35:17');
INSERT INTO `log_user_login` VALUES ('AFFCB11464B3484E82956D213A353D7C', 'DF4F96FE0384CAB31FCA013E2364DDAF', 'admin', '192.168.2.32', '0', '2016-03-16 09:38:05', '2016-03-16 15:04:33', '2016-03-16 09:38:05');
INSERT INTO `log_user_login` VALUES ('B02FD2163158470EA020E26BD3C8A57C', 'EAFD44A722631ED59D3F42100FB27BC1', 'admin', '192.168.2.210', '0', '2016-03-30 20:58:38', '2016-03-31 11:29:26', '2016-03-30 20:58:39');
INSERT INTO `log_user_login` VALUES ('B05309C5912145EB9B65809B25E9078D', 'E5E967CCCB222C083BB384F705B5D672', 'admin', '192.168.2.210', '0', '2016-03-31 19:56:56', '2016-03-31 22:02:15', '2016-03-31 19:56:56');
INSERT INTO `log_user_login` VALUES ('B10DC69688094925BC5B1793FB7C7422', 'DC3C000BC52DD5DFC261D43BE49B4929', 'admin', '192.168.2.129', '0', '2016-09-26 15:51:28', '2016-09-26 18:08:47', '2016-09-26 16:03:05');
INSERT INTO `log_user_login` VALUES ('B1381971E3CB424AB9165942181DCDB4', '232FFE78D576C4F011948CA30B06ED1D', 'admin', '192.168.2.210', '0', '2016-03-31 18:27:48', '2016-03-31 20:38:27', '2016-03-31 18:27:48');
INSERT INTO `log_user_login` VALUES ('B147328D459044BAA2289227BE9A0EB4', '5461C9CFC39E3B613214633CBB9AD16A', 'admin', '192.168.1.231', '0', '2016-05-12 17:56:36', '2016-05-12 20:06:48', '2016-05-12 17:56:36');
INSERT INTO `log_user_login` VALUES ('B17105D919F44F46AC9C7818F8D30562', 'C96D9EFA7B558A18DBB7CA6B29E9284C', 'admin', '192.168.2.210', '0', '2016-03-30 09:55:36', '2016-03-30 12:00:55', '2016-03-30 09:55:36');
INSERT INTO `log_user_login` VALUES ('B1B957852F854ACE9E5A8302C87DDA94', '3B18B2BAE357FA7237CA3867990450B4', 'admin', '192.168.2.129', '0', '2016-03-23 10:21:42', '2016-03-23 12:37:25', '2016-03-23 10:29:19');
INSERT INTO `log_user_login` VALUES ('B264337CCA584044B265D4078869F645', 'A3C05F59BDB05FA89220D4433DE0898B', 'admin', '192.168.2.32', '0', '2016-02-01 13:42:10', '2016-02-01 13:45:01', '2016-02-01 13:42:10');
INSERT INTO `log_user_login` VALUES ('B2A8D2ECCDD34C2DADA6C0BAF66A4077', 'BDF7011895660C17D0E4384C1F0FE3B2', 'admin', '192.168.1.239', '0', '2016-03-16 16:36:21', '2016-03-17 14:41:10', '2016-03-16 16:36:21');
INSERT INTO `log_user_login` VALUES ('B2C11B9A3F8E4CEDB27C4C336B83B1FE', '9724144E3D317C23D580F9B127C49A69', 'admin', '192.168.2.223', '0', '2016-05-11 22:04:00', '2016-05-12 11:56:52', '2016-05-11 22:04:00');
INSERT INTO `log_user_login` VALUES ('B2CB41236D594376B8A37BF90B0A8B72', '283FBF38336811DD9242EAD9FEE72A95', 'admin', '192.168.2.129', '0', '2016-09-26 16:33:51', '2016-09-26 18:48:47', '2016-09-26 16:33:51');
INSERT INTO `log_user_login` VALUES ('B3164334BB7D4CF29447F99AB8D2945F', 'F538410AE67BB4E9CC24011F3BA85F9D', 'admin', '192.168.2.129', '0', '2016-09-12 16:13:10', '2016-09-14 15:49:09', '2016-09-12 16:13:10');
INSERT INTO `log_user_login` VALUES ('B3FD979361C64F5DB53C519BC38B98DD', '99C214832BCF70866D6AE761BAB76170', 'admin', '192.168.1.239', '0', '2016-03-30 16:10:33', '2016-03-30 18:20:01', '2016-03-30 16:10:33');
INSERT INTO `log_user_login` VALUES ('B46748731F954572B13187214F1F1D01', 'DA5477E648D2F81941D3860D2D5F2ABB', 'admin', '192.168.1.239', '0', '2016-03-23 16:49:33', '2016-03-23 19:00:32', '2016-03-23 16:49:33');
INSERT INTO `log_user_login` VALUES ('B467D60E88E444129E4A4F5E5BC50DEB', 'B196D5AF516F4ADB63481FF787E54BF8', 'admin', '192.168.2.32', '0', '2016-09-21 17:37:22', '2016-09-21 19:47:04', '2016-09-21 17:37:22');
INSERT INTO `log_user_login` VALUES ('B559756780F3429790A2CFB0AF54692A', 'DC6E7A7F9E1A1CBE7619002E4D022266', 'admin', '192.168.3.117', '0', '2016-03-24 16:04:48', '2016-03-24 18:19:09', '2016-03-24 16:12:37');
INSERT INTO `log_user_login` VALUES ('B5EC778DE66046C78BCA2BEA61D76462', '3097A5B1974F32ABD5DEADC88A6A8683', 'admin', '192.168.1.239', '0', '2016-03-23 16:30:14', '2016-03-23 18:40:32', '2016-03-23 16:30:14');
INSERT INTO `log_user_login` VALUES ('B8195BA0CD9E41C4BEA5011030ED81E0', '9C6EFE755060FF2320DA17DB056B92AF', 'admin', '192.168.2.32', '0', '2016-07-28 10:40:38', '2016-07-28 12:50:33', '2016-07-28 10:40:38');
INSERT INTO `log_user_login` VALUES ('B8748E30899A43018365B73625AA4B33', '0AB1C7EBB63CCDD36C456F06CC80F0C4', 'admin', '192.168.1.231', '0', '2016-04-01 14:26:50', '2016-04-01 16:32:14', '2016-04-01 14:26:50');
INSERT INTO `log_user_login` VALUES ('B876F28798AE48E3ACC1CD9B1C09C786', '416A84543ED41D1551A6E7601DBC900D', 'admin', '192.168.1.98', '0', '2016-07-22 16:54:11', '2016-07-26 11:12:24', '2016-07-22 16:54:11');
INSERT INTO `log_user_login` VALUES ('B94D6B653A604134B2C24167CE181B4A', 'FFB3673D0AB7C7C9B6ED92A06F3CFF8F', 'admin', '192.168.1.129', '0', '2016-03-25 10:58:43', '2016-03-25 13:13:05', '2016-03-25 11:03:59');
INSERT INTO `log_user_login` VALUES ('B9794677D0054D7DA93DD045C8F49214', '402E3FE5B74FD2AB713A7D2D54D74575', 'admin', '127.0.0.1', '0', '2016-04-25 11:23:02', '2016-04-25 13:42:20', '2016-04-25 11:37:16');
INSERT INTO `log_user_login` VALUES ('BAAA63CF437544A3977845F3D980A7D2', '3D9361FA08FE9E4D3001993BB0801923', 'admin', '192.168.2.223', '0', '2016-05-09 21:49:55', '2016-05-11 20:59:40', '2016-05-09 21:49:55');
INSERT INTO `log_user_login` VALUES ('BB5515B022564BFB8D3598E66596DCB4', '9C8914DB6EBBB602319AD497E7FFC085', 'admin', '192.168.1.231', '0', '2016-08-31 13:59:00', '2016-08-31 16:09:29', '2016-08-31 13:59:00');
INSERT INTO `log_user_login` VALUES ('BB6E5425FF1D4D51AAED0CDBBC0E9801', '45B7551BEC8BAA2572E8E6AA7F7DCC80', 'admin', '192.168.1.231', '0', '2016-03-30 19:20:59', '2016-03-30 22:10:43', '2016-03-30 20:00:17');
INSERT INTO `log_user_login` VALUES ('BBBC88DB0B264C06870345310121FBD0', 'A57A1177EB2D9F892976529F7634CE80', 'admin', '192.168.1.231', '0', '2016-04-20 16:54:03', '2016-04-20 18:59:41', '2016-04-20 16:54:03');
INSERT INTO `log_user_login` VALUES ('BBCC66CA1EF84FF1BA5E56637925F8B5', '983909B460F437D14698DA14873EE809', 'admin', '192.168.2.32', '0', '2016-03-16 10:22:19', '2016-03-16 15:04:33', '2016-03-16 10:22:19');
INSERT INTO `log_user_login` VALUES ('BBE283F7D0F4451F8BAB87A46CBF2B10', '773AC2366B5294FDFD45EB7B80EC93D8', 'admin', '192.168.2.32', '0', '2016-03-22 10:05:45', '2016-03-22 13:44:06', '2016-03-22 11:35:38');
INSERT INTO `log_user_login` VALUES ('BC3A55937B44469B9646C07FB4C4E625', '5FC294FEABED72F1A5A13615FECF285C', 'admin', '192.168.2.129', '0', '2016-09-19 17:02:01', '2016-09-19 19:09:47', '2016-09-19 17:02:01');
INSERT INTO `log_user_login` VALUES ('BC4E726D28FD49C5BF65101A4A0FE649', 'CB7718D7AE4B9502389700C377B82E17', 'admin', '192.168.2.32', '0', '2016-08-17 16:17:24', '2016-08-17 18:24:57', '2016-08-17 16:17:24');
INSERT INTO `log_user_login` VALUES ('BC8B5CB602094563A7D9C0280278826F', '5AA2AC7A2E81ECBAE2E1E48710318BB8', 'admin', '192.168.2.129', '0', '2016-09-26 16:24:32', '2016-09-26 18:38:47', '2016-09-26 16:24:32');
INSERT INTO `log_user_login` VALUES ('BD61199982274603A84D7873BF507B4C', 'BA317A55100E893929E96F687C8A462C', 'admin', '192.168.2.129', '0', '2016-08-25 17:19:14', '2016-08-25 19:37:32', '2016-08-25 17:30:29');
INSERT INTO `log_user_login` VALUES ('BDBC4EDFE2ED4FADA4A5C770FAA0C0BB', '3D3796D12D9A441A7924A01376D3D6C0', 'admin', '192.168.3.117', '0', '2016-03-23 11:14:14', '2016-03-23 15:57:30', '2016-03-23 13:47:59');
INSERT INTO `log_user_login` VALUES ('BE055C8B02BE4D8BB8C1DC2B169F4691', 'E032E75C17CB1D6FCE2F115E8E4C9862', 'admin', '192.168.1.129', '0', '2016-04-26 17:33:16', '2016-04-27 14:51:20', '2016-04-26 17:33:16');
INSERT INTO `log_user_login` VALUES ('BE97DC47E3444C809B1057C947456AB1', '5C3FEB26086E5C14CF1CA87ABB71A86F', 'admin', '192.168.1.231', '0', '2016-08-31 18:06:26', '2016-08-31 20:15:36', '2016-08-31 18:06:26');
INSERT INTO `log_user_login` VALUES ('BEB7D374E86F4DDA97B20360E6225A7C', '0E1825338DA0B3048CDF858385129436', 'admin', '192.168.2.129', '0', '2016-09-21 17:35:00', '2016-09-21 20:47:05', '2016-09-21 18:37:41');
INSERT INTO `log_user_login` VALUES ('BF3BF641E02C4B62BB57A3024A8D5FC9', '476EA64E0AFD31A4619692F20B525F21', 'admin', '192.168.2.32', '0', '2016-08-16 15:26:20', '2016-08-17 10:01:48', '2016-08-16 16:22:09');
INSERT INTO `log_user_login` VALUES ('BF58D76A523A45ACA7D4F3ED1C694C80', '38871CDD096AEAA22DFE9BAEC504DC93', 'admin', '127.0.0.1', '0', '2016-01-28 18:02:52', '2016-01-28 23:07:15', '2016-01-28 18:02:52');
INSERT INTO `log_user_login` VALUES ('BF822D08626D4A90A1BC78056784B202', '5FA3A4E55E7B27777E64C23451FD1D86', 'admin', '192.168.2.210', '0', '2016-04-12 17:44:09', '2016-04-18 15:37:33', '2016-04-12 18:12:02');
INSERT INTO `log_user_login` VALUES ('C03A7FF4B5FA4B5A9C4A68C50A844B88', '4DF310283F78D6F499CEC6CB6CA030A4', 'admin', '192.168.2.32', '0', '2016-09-22 09:40:23', '2016-09-22 12:04:41', '2016-09-22 09:58:27');
INSERT INTO `log_user_login` VALUES ('C0E0EEAC7D21431C9D9EC333633E0B91', 'BB6CE49E4D25DBBB34A952BF4FEBEEA4', 'admin', '192.168.2.210', '0', '2016-03-31 19:23:47', '2016-03-31 21:32:15', '2016-03-31 19:23:47');
INSERT INTO `log_user_login` VALUES ('C12F383F57FE460DB2058B56B9EA4E05', 'EFBB824A95EE3BF620AE1C981CC9D972', 'admin', '192.168.2.129', '0', '2016-09-29 15:51:16', '2016-09-30 11:00:59', '2016-09-29 16:32:58');
INSERT INTO `log_user_login` VALUES ('C152F890BAFC42A2884623F0F0D7A364', 'BBD6CF8A0CECAAFEDFB05694D1C67FC0', 'admin', '192.168.1.129', '0', '2016-04-01 16:37:21', '2016-04-05 10:07:06', '2016-04-01 16:37:21');
INSERT INTO `log_user_login` VALUES ('C17F0EBD923A41C199E44297CB33D817', 'DAB9CF717EFEAE1700615A461811CFCC', 'admin', '192.168.2.129', '0', '2016-08-25 14:20:42', '2016-08-25 16:25:45', '2016-08-25 14:20:42');
INSERT INTO `log_user_login` VALUES ('C2F7207C5E2C49F7BB435924829C9428', 'B1F7C58228D6D9C29ABB7E1983EC6894', 'admin', '192.168.2.210', '0', '2016-05-03 15:32:07', '2016-05-05 15:13:36', '2016-05-03 16:43:42');
INSERT INTO `log_user_login` VALUES ('C2FBE2E9AF4442C4A7B342E68A612698', 'BB5D2FACB7A8605976A8B17189E2356C', 'admin', '192.168.2.32', '0', '2016-07-26 17:22:51', '2016-07-27 09:38:30', '2016-07-26 17:22:51');
INSERT INTO `log_user_login` VALUES ('C375DEC8112B420F965D867FB9D05670', 'F05BE888568EB5F5B376933461474CB5', 'admin', '192.168.2.129', '0', '2016-03-24 20:30:44', '2016-03-24 22:45:12', '2016-03-24 20:38:41');
INSERT INTO `log_user_login` VALUES ('C420902C992D48BD8C205749D0516462', 'E600B360477CA242DA94323E8F75233B', 'admin', '192.168.2.32', '0', '2016-08-30 11:43:33', '2016-08-30 13:53:42', '2016-08-30 11:43:33');
INSERT INTO `log_user_login` VALUES ('C4542E5B608F4960BCD32E9A88E9EF61', '0E92FF674A313B216600B2F21D2A1BB4', 'admin', '127.0.0.1', '0', '2016-08-30 17:01:05', '2016-08-30 19:13:40', '2016-08-30 17:01:05');
INSERT INTO `log_user_login` VALUES ('C47124B43C024B688B4896CEFD99B165', '07554D9493CFEC7BCFCECC84EEA4F186', 'admin', '192.168.1.231', '0', '2016-03-28 11:11:07', '2016-03-28 13:19:39', '2016-03-28 11:11:07');
INSERT INTO `log_user_login` VALUES ('C4DBF04E551846398CF865798341D7E9', 'F2B986C140B5AF3B1D3E9C3D970202CC', 'admin', '192.168.1.239', '0', '2016-03-18 15:03:30', '2016-03-21 16:18:00', '2016-03-18 16:15:10');
INSERT INTO `log_user_login` VALUES ('C61A3A42F4E74B199B4B5EC7D1BC2BCF', 'BA52817AABB12AB8DCEE60E0E64F1CC2', 'admin', '192.168.1.231', '0', '2016-03-31 19:38:10', '2016-03-31 22:02:15', '2016-03-31 19:55:18');
INSERT INTO `log_user_login` VALUES ('C656599C4B46409A9880D5371E74BA10', '08BB9844D794CC2D26B2017CD0536DB4', 'admin', '192.168.2.129', '0', '2016-09-08 15:23:03', '2016-09-08 17:37:51', '2016-09-08 15:23:03');
INSERT INTO `log_user_login` VALUES ('C69129F0E27043C58F68E87FA286D408', 'B04E55317378D8BED5F8A9E749CBB90F', 'admin', '192.168.2.32', '0', '2016-03-30 14:23:34', '2016-03-30 16:36:16', '2016-03-30 14:23:34');
INSERT INTO `log_user_login` VALUES ('C6CBB9EF43074E67AEF3D37C7B904BEE', '9FDCDF7522755289B7DF64E90FA4BD44', 'admin', '192.168.2.32', '0', '2016-07-26 11:02:36', '2016-07-26 13:27:20', '2016-07-26 11:19:38');
INSERT INTO `log_user_login` VALUES ('C702E1C00A604B7C9865AB1567DA231A', '91D7DBF463CFC0F601AD1B28C22CB386', 'admin', '192.168.2.129', '0', '2016-08-24 19:53:55', '2016-08-24 22:01:16', '2016-08-24 19:53:55');
INSERT INTO `log_user_login` VALUES ('C72A9E820B7B4EC8BBB2EF33A1D0992C', '1C07546DB669CFEC13E724BB697087D4', 'admin', '192.168.1.98', '0', '2016-07-22 16:29:43', '2016-07-26 11:12:24', '2016-07-22 16:29:43');
INSERT INTO `log_user_login` VALUES ('C782EADC9C4C417A97A96124B176B3F2', '7922A068F9CADC552C58925E41A572CF', 'admin', '192.168.3.117', '0', '2016-03-22 10:48:30', '2016-03-22 13:04:06', '2016-03-22 10:58:20');
INSERT INTO `log_user_login` VALUES ('C8042673EB9C4D4D877171C1467227D0', '9D9F88E125EA7CA6751B7D367278754C', 'admin', '192.168.2.129', '0', '2016-09-26 19:48:07', '2016-09-26 22:01:35', '2016-09-26 19:48:07');
INSERT INTO `log_user_login` VALUES ('C83DA18FF3784AD8881D97F9574022C7', 'DE4F28302DB454670B4ABF4D8BC56C24', 'admin', '127.0.0.1', '0', '2016-10-13 16:55:15', '2016-10-13 19:53:02', '2016-10-13 17:38:48');
INSERT INTO `log_user_login` VALUES ('C8B7C34A92A44271B34852A65C38913E', 'E7FA27456A695B364AE7C34ECDE55C02', 'admin', '192.168.2.32', '0', '2016-07-26 17:30:07', '2016-07-27 09:38:30', '2016-07-26 18:37:20');
INSERT INTO `log_user_login` VALUES ('C8FCA9ACC7D94D5990618D08CF2FE0C5', 'E2D6EB5675AF90738DBC312E52EFAD70', 'admin', '192.168.2.129', '0', '2016-03-18 16:51:21', '2016-03-21 16:18:00', '2016-03-18 16:51:21');
INSERT INTO `log_user_login` VALUES ('C933E949EB454D8CA786898588EA5341', 'E86887364DBD19A7CBDD4EC924D800CB', 'admin', '192.168.2.129', '0', '2016-08-26 15:40:46', '2016-08-26 17:49:02', '2016-08-26 15:40:46');
INSERT INTO `log_user_login` VALUES ('C95B3E3D14B047068D7EF86A0F59D09D', '52F0283139BD941F548F191470A9A512', 'admin', '192.168.2.129', '0', '2016-08-25 16:23:27', '2016-08-25 19:13:01', '2016-08-25 16:36:08');
INSERT INTO `log_user_login` VALUES ('C9D105D38AAB4AC4A42E9FE47B69FB5B', '747926538A592F51C89245EF32200DB8', 'admin', '192.168.2.32', '0', '2016-09-20 15:57:54', '2016-09-20 18:07:33', '2016-09-20 15:57:54');
INSERT INTO `log_user_login` VALUES ('CAF344CAE72A49938F77C42ACBCF3C19', '5D22C2833F03774D4B77E17F34D12BDB', 'admin', '192.168.2.129', '0', '2016-08-30 16:30:32', '2016-08-30 18:43:38', '2016-08-30 16:30:32');
INSERT INTO `log_user_login` VALUES ('CB608EF8143A4EEBA5DFA9BBFF3B5F24', 'CC1FAF02410E9EFBCAE9E9FFE08EE1DF', 'admin', '192.168.2.210', '0', '2016-05-11 21:03:52', '2016-05-12 11:56:52', '2016-05-11 21:14:52');
INSERT INTO `log_user_login` VALUES ('CBCC00D272034576A8E288C70A431507', '36AA2EFC485512B4A9C733E3BEFED0D7', 'admin', '192.168.2.129', '0', '2016-08-26 09:11:41', '2016-08-26 13:14:28', '2016-08-26 11:01:12');
INSERT INTO `log_user_login` VALUES ('CBE158D7B7CD428D9572325B00DC36C8', '1F244CE2B4A57F8222EF06A26FC1795F', 'admin', '192.168.2.210', '0', '2016-04-01 14:10:09', '2016-04-01 16:22:14', '2016-04-01 14:10:09');
INSERT INTO `log_user_login` VALUES ('CC67A19A0BB64A709A04691E578F72AA', 'C0B74EF3555F88D4303F55FC139767F8', 'admin', '192.168.2.129', '0', '2016-08-25 13:38:04', '2016-08-25 15:45:45', '2016-08-25 13:38:04');
INSERT INTO `log_user_login` VALUES ('CC6E779D19464EE390D557B2B24586DF', '18BA75AF53021EAB567CBB5D25914BC0', 'admin', '192.168.1.231', '0', '2016-05-16 15:41:32', '2016-05-19 17:04:33', '2016-05-16 15:41:33');
INSERT INTO `log_user_login` VALUES ('CC887D8845B645EAB4E5FBD5B1178A3F', '1F6B3B87052128E1EB1D6E4288ADEAB0', 'admin', '192.168.2.129', '0', '2016-08-25 15:13:29', '2016-08-25 17:25:45', '2016-08-25 15:15:47');
INSERT INTO `log_user_login` VALUES ('CC99B5F7AA5C4F7AA4EBD0CE6AB19527', 'A3C0D2D4D2AF4DD9A3CD7DA3E91401F7', 'admin', '127.0.0.1', '0', '2016-08-29 11:24:28', '2016-08-29 13:35:10', '2016-08-29 11:29:25');
INSERT INTO `log_user_login` VALUES ('CD2D0575DA184C3F84F06F6416409912', 'A0698A33A6C75D2B39F71DF5B7B396CC', 'admin', '192.168.1.239', '0', '2016-03-22 16:46:36', '2016-03-22 18:58:06', '2016-03-22 16:46:36');
INSERT INTO `log_user_login` VALUES ('CD546960E2964C1BB1FDBBE04694C001', 'F0C1B32F85E63BAF922A43F9F2EF28DD', 'admin', '192.168.2.129', '0', '2016-08-31 10:03:46', '2016-08-31 12:15:22', '2016-08-31 10:03:46');
INSERT INTO `log_user_login` VALUES ('CD74F970C3A64732B448C0E8E93AC410', 'BD98132AB62F31F9C234080455EF9425', 'admin', '192.168.2.129', '0', '2016-09-20 10:17:53', '2016-09-20 12:31:58', '2016-09-20 10:17:53');
INSERT INTO `log_user_login` VALUES ('CD96868FEB4A475584A380F529E848AC', 'DEEEA4B6C4BFB75CDE74E0D2E07AAFCC', 'admin', '192.168.2.32', '0', '2016-08-25 18:15:36', '2016-08-26 09:11:42', '2016-08-25 18:15:36');
INSERT INTO `log_user_login` VALUES ('CE519339442E4D7D8658522030A1F498', '33A491A908D9D6BCAB1110A7A7FB03F1', 'admin', '192.168.1.239', '0', '2016-03-31 14:21:35', '2016-03-31 16:33:00', '2016-03-31 14:21:35');
INSERT INTO `log_user_login` VALUES ('CE9622D8A26C45F895285C62A6AD5061', '1D617A506F82198A2332C2096A45E85C', 'admin', '192.168.2.32', '0', '2016-01-28 18:08:04', '2016-01-28 23:07:15', '2016-01-28 18:08:04');
INSERT INTO `log_user_login` VALUES ('CEDEC32BF7C64AD1B733CD92A0E145D2', 'F5AB83D29707A5646794B24C669C9518', 'admin', '192.168.2.149', '0', '2016-08-18 16:23:58', '2016-08-18 18:34:01', '2016-08-18 16:23:58');
INSERT INTO `log_user_login` VALUES ('CEF33A115EA842D0992155336B550115', '6E56F88A5A8D21AFC39268FA093F932E', 'admin', '192.168.2.129', '0', '2016-03-18 16:44:22', '2016-03-18 16:46:07', '2016-03-18 16:44:22');
INSERT INTO `log_user_login` VALUES ('CF77F07FBC2D4E4CA26DEC7F8443D928', '1812AA4484F40F805A67EF68CDE6DDEE', 'admin', '192.168.2.32', '0', '2016-08-25 17:30:30', '2016-08-25 18:07:20', '2016-08-25 18:05:10');
INSERT INTO `log_user_login` VALUES ('CFED48524F444D259D857E6890B1AAD5', 'BA0B9A94273DC4D60D5506DC983686C7', 'admin', '192.168.1.123', '0', '2016-09-20 18:07:39', '2016-09-20 20:17:33', '2016-09-20 18:07:39');
INSERT INTO `log_user_login` VALUES ('D0467C954CBE430C9D50563CBD40D88D', '68B2548E7764C9CAB9C7481689A2CDA8', 'admin', '192.168.2.129', '0', '2016-03-24 12:03:59', '2016-03-24 15:54:50', '2016-03-24 13:46:28');
INSERT INTO `log_user_login` VALUES ('D04D38D7F8AE4580A342922E4FBF6177', '083914CF9DCD7D246C441767B4FC61C1', 'admin', '192.168.2.210', '0', '2016-03-28 11:34:41', '2016-03-28 15:37:53', '2016-03-28 11:34:41');
INSERT INTO `log_user_login` VALUES ('D0B3DBD0F0AC46F9892BF792E0E4D8FC', '0E397233F67464E6CD09F4F26985155B', 'admin', '192.168.1.129', '0', '2016-04-07 14:01:06', '2016-04-07 18:02:17', '2016-04-07 14:44:32');
INSERT INTO `log_user_login` VALUES ('D0B94177C2684205A9C6B0A8AC7BF535', '143F0E143A6C6B28DB1C2D62046E96EA', 'admin', '192.168.2.210', '0', '2016-05-11 22:29:07', '2016-05-12 11:56:52', '2016-05-11 22:29:08');
INSERT INTO `log_user_login` VALUES ('D1418EA51A2943A2872C93D13A7D88AF', '2D53EC32AF43EA847128AEE19290A4A9', 'admin', '192.168.3.117', '0', '2016-03-24 16:20:33', '2016-03-24 18:29:09', '2016-03-24 16:20:33');
INSERT INTO `log_user_login` VALUES ('D1797A55AEB74C40B8911D78E3D6DE9A', '7B71A6623861C88942C9638EED1BD752', 'admin', '192.168.1.239', '0', '2016-03-23 16:56:48', '2016-03-23 19:02:38', '2016-03-23 16:56:48');
INSERT INTO `log_user_login` VALUES ('D19CA8BE9C7B42F5AE5167870728D121', '6633E00C6AD420775F1819EED6140B49', 'admin', '192.168.2.32', '0', '2016-08-18 09:53:10', '2016-08-18 12:20:59', '2016-08-18 10:08:30');
INSERT INTO `log_user_login` VALUES ('D19D9AD8B0B442D8853160ACAF926B34', '8A648C4A42F5FA5A62F95EE21001F194', 'admin', '183.14.110.39, 10.10.10.1', '0', '2016-04-21 11:40:08', '2016-04-21 13:59:46', '2016-04-21 11:49:08');
INSERT INTO `log_user_login` VALUES ('D1F264E017C849D791B4E407D969B412', '745F539B7B3CE9A8FF2033738C8F5F27', 'admin', '192.168.2.129', '0', '2016-03-23 11:44:15', '2016-03-23 13:51:31', '2016-03-23 11:44:15');
INSERT INTO `log_user_login` VALUES ('D1FD8660926D4F958B2B541A2A470505', 'FE55F1BB79973616BDAAA8D33330E7FF', 'admin', '192.168.1.129', '0', '2016-05-03 16:53:25', '2016-05-05 15:13:36', '2016-05-03 16:53:25');
INSERT INTO `log_user_login` VALUES ('D21EA7D8651F45079E84A312411C2084', 'C7BBF43B6EA10C95B132E3AF6D205A6F', 'admin', '192.168.2.129', '0', '2016-09-21 11:03:19', '2016-09-21 13:12:27', '2016-09-21 11:03:19');
INSERT INTO `log_user_login` VALUES ('D22424B3B15545D197D066087FA550B8', 'C1A60F9DD3BED2FD6F7D1784E93F909F', 'admin', '192.168.2.32', '0', '2016-03-23 15:39:43', '2016-03-23 18:20:32', '2016-03-23 16:14:09');
INSERT INTO `log_user_login` VALUES ('D2718200FAAF4CF59BA60C35BD0C632D', '37B821103F8D6C6D2EB3D354AF66BCA6', 'admin', '192.168.2.32', '0', '2016-09-22 14:25:20', '2016-09-22 16:30:45', '2016-09-22 14:25:20');
INSERT INTO `log_user_login` VALUES ('D278F318C4E644C88966FAD36236BD00', '524561D69A1F83E00A268650EB939CBE', 'admin', '192.168.2.32', '0', '2016-08-25 18:08:19', '2016-08-26 09:11:42', '2016-08-25 18:13:10');
INSERT INTO `log_user_login` VALUES ('D2B864D6A84848A7BFED7A0066959063', '392C1AD6E6E3A478640346568F5E1DAB', 'admin', '192.168.2.129', '0', '2016-03-23 15:40:18', '2016-03-23 17:52:37', '2016-03-23 15:47:14');
INSERT INTO `log_user_login` VALUES ('D2BADCCE640F4FFEA7A0B2CEA6EE54A0', '75C550B302AC804DC416A50B5EB42A03', 'admin', '192.168.1.129', '0', '2016-03-28 10:55:37', '2016-03-28 15:37:53', '2016-03-28 12:54:08');
INSERT INTO `log_user_login` VALUES ('D39B62A83BC94497A7CA0D6FF83F9B61', '90DA2D06E5C5D2893655B684A57ED44B', 'admin', '192.168.2.210', '0', '2016-04-12 16:30:22', '2016-04-18 15:37:33', '2016-04-12 16:47:03');
INSERT INTO `log_user_login` VALUES ('D42A71347F6B4CF0B0D76362CD8B028C', '6977CBCFCB620D908A53D5B5A81D633A', 'admin', '192.168.1.231', '0', '2016-08-30 15:32:20', '2016-08-30 18:33:38', '2016-08-30 16:19:58');
INSERT INTO `log_user_login` VALUES ('D4C575775DB74D30B6E72069CBF04240', 'E1DE41D188153ED457628A5955AD8005', 'admin', '192.168.1.129', '0', '2016-03-25 13:43:04', '2016-03-25 15:57:21', '2016-03-25 13:50:06');
INSERT INTO `log_user_login` VALUES ('D6872848E5D6404AB4B732057AB48058', 'E638C141580B223C44F98ADBF6141F01', 'admin', '192.168.2.129', '0', '2016-03-23 16:00:38', '2016-03-23 18:20:32', '2016-03-23 16:08:46');
INSERT INTO `log_user_login` VALUES ('D83F64730CA84B519D52656579C2EE00', 'CE4DF12D2138D7887B1CF6B10C2EF818', 'admin', '192.168.2.129', '0', '2016-08-25 17:59:02', '2016-08-26 09:11:42', '2016-08-25 18:44:27');
INSERT INTO `log_user_login` VALUES ('D885389FE2FC4F418077D072C02E0FED', 'A285FF6E74F0310E29A53061C5A0CEDB', 'admin', '192.168.2.210', '0', '2016-03-31 18:49:16', '2016-03-31 21:08:27', '2016-03-31 19:00:34');
INSERT INTO `log_user_login` VALUES ('D898CA5311BF42C3BFFE567E281FB300', '375C85F692B6BD8B64E455C1FDDD2E73', 'admin', '192.168.2.129', '0', '2016-03-23 16:47:56', '2016-03-23 19:00:32', '2016-03-23 16:54:08');
INSERT INTO `log_user_login` VALUES ('D8C765C3C10C42ECA47FB67F8C52D601', 'D076CE6FC79A52CB922399EF60A8A703', 'admin', '192.168.2.32', '0', '2016-02-01 14:23:04', '2016-02-22 15:23:52', '2016-02-01 14:23:05');
INSERT INTO `log_user_login` VALUES ('D918B6890AAC4FF29BDEFC29F2859834', 'EB8450B0BFC16FDEB4C3669BA38D1CE4', 'admin', '192.168.1.231', '0', '2016-03-25 15:39:18', '2016-03-25 15:42:12', '2016-03-25 15:39:18');
INSERT INTO `log_user_login` VALUES ('D95A5510250A487EAC79F1CE8A8A0C86', 'BECC53E61F426E267644F19D8AA4077A', 'admin', '192.168.2.32', '0', '2016-03-18 16:28:47', '2016-03-21 16:18:00', '2016-03-18 16:28:47');
INSERT INTO `log_user_login` VALUES ('D9A644D588CF43B6AB928E449EA92AA0', 'E365BEC9B1BA4AC70B3E90C3024B36D7', 'admin', '192.168.2.129', '0', '2016-09-20 10:13:32', '2016-09-20 12:21:58', '2016-09-20 10:13:32');
INSERT INTO `log_user_login` VALUES ('D9BE5932930D421BBD2E356F83CB0439', '14A7DDF69437CAFEA4C9CD52C5CE5D3D', 'admin', '192.168.2.129', '0', '2016-08-25 19:33:05', '2016-08-26 09:11:42', '2016-08-25 19:48:35');
INSERT INTO `log_user_login` VALUES ('DA0313107B8048C9B035CBEE458BD8D9', 'E27BA05C0D28C94E4A45E34E47EFEC39', 'admin', '192.168.1.129', '0', '2016-04-01 16:14:19', '2016-04-01 18:22:14', '2016-04-01 16:14:19');
INSERT INTO `log_user_login` VALUES ('DA6497AB626D4D4FAD4997A834B32DC1', '623ECD94DAFECB983F367D2DA1BA8D7E', 'admin', '192.168.2.210', '0', '2016-05-11 20:59:37', '2016-05-12 11:56:52', '2016-05-11 20:59:37');
INSERT INTO `log_user_login` VALUES ('DA80E79DBCAE4074B368EFED62A8208A', '17937D37326EDB33C431819C9CB253F7', 'admin', '192.168.2.129', '0', '2016-08-25 15:19:21', '2016-08-25 17:59:02', '2016-08-25 15:53:58');
INSERT INTO `log_user_login` VALUES ('DAECB6D705404608A30E011FCF60C01C', '5E397895BE2CC5C5796B35E11F6D0A07', 'admin', '192.168.2.210', '0', '2016-05-11 21:23:22', '2016-05-12 11:56:52', '2016-05-11 21:23:22');
INSERT INTO `log_user_login` VALUES ('DAF1108A1ECC400A9367955B6E689706', '9784BA388AE1051B1896A5D48708AC12', 'admin', '127.0.0.1', '1', '2016-10-14 11:20:47', null, '2016-10-14 11:20:47');
INSERT INTO `log_user_login` VALUES ('DAFB421B5B734E25BD4FA641162D18DD', 'BA1F4A8D1E8D64DB67D5C1E05A38283A', 'admin', '192.168.2.210', '0', '2016-04-05 17:39:36', '2016-04-05 19:51:45', '2016-04-05 17:39:36');
INSERT INTO `log_user_login` VALUES ('DB2F4296292B48F08AE1677B0F35605A', '9EF2D8CD4513EECBA856F07ED97D7A63', 'admin', '192.168.2.129', '0', '2016-09-07 11:22:11', '2016-09-07 13:31:08', '2016-09-07 11:22:12');
INSERT INTO `log_user_login` VALUES ('DB36AE6214244126AFEF6166BC836A46', '1812AA4484F40F805A67EF68CDE6DDEE', 'admin', '192.168.2.32', '0', '2016-08-25 15:00:38', '2016-08-25 17:30:28', '2016-08-25 17:29:54');
INSERT INTO `log_user_login` VALUES ('DB43EC3B508E480188ED4F0EA1452A35', 'BCB44ECE30EAE31159F363BE62A95BAA', 'admin', '192.168.2.210', '0', '2016-04-05 16:13:48', '2016-04-05 18:21:45', '2016-04-05 16:13:49');
INSERT INTO `log_user_login` VALUES ('DB86E6A7C50D482AB32CD60F20D2F5CE', 'F28F2CA5DA14F2680ED5870D014D7CAD', 'admin', '192.168.1.129', '0', '2016-03-28 16:46:12', '2016-03-28 19:06:42', '2016-03-28 16:46:12');
INSERT INTO `log_user_login` VALUES ('DBFB471DCA384BB09DEC77C12DECDD20', '9285694B6E2B7AF76BDA8F8DC153A9E4', 'admin', '192.168.2.32', '0', '2016-03-22 15:16:08', '2016-03-22 17:21:29', '2016-03-22 15:16:08');
INSERT INTO `log_user_login` VALUES ('DCBFE9AB97B84D049EB55277F0947E0F', 'D218802852AD6EB8AC856646CF92419A', 'admin', '192.168.2.32', '0', '2016-03-21 20:06:01', '2016-03-21 22:11:27', '2016-03-21 20:06:01');
INSERT INTO `log_user_login` VALUES ('DCEFEE71905E43E28E39FEED4080D5B6', '25672510D07608E6D90DE3FA840B488B', 'admin', '192.168.1.231', '0', '2016-05-12 11:49:03', '2016-05-12 11:53:19', '2016-05-12 11:50:07');
INSERT INTO `log_user_login` VALUES ('DCF1325F663444CBBFC497BA8429643D', 'D77B8C9CF7038F70796F3A16032D63BF', 'admin', '192.168.2.129', '0', '2016-03-24 10:37:06', '2016-03-24 12:42:40', '2016-03-24 10:37:06');
INSERT INTO `log_user_login` VALUES ('DD4B2E7DA79C4D4F8B11B6C3EDF48839', '3956EBA3347241FAB35EF7374D62DDE6', 'admin', '192.168.2.129', '0', '2016-03-23 14:04:52', '2016-03-23 16:32:37', '2016-03-23 14:24:30');
INSERT INTO `log_user_login` VALUES ('DF498D8A986E44C4A96696FBC0311A22', 'AA989B55580C53ECED6F63393F1D51C1', 'admin', '192.168.2.129', '0', '2016-08-25 18:16:04', '2016-08-26 09:11:42', '2016-08-25 18:16:04');
INSERT INTO `log_user_login` VALUES ('DFA7C6BE8E5C4A36BF954AF887718A7F', 'AEF9F7503B8C1A073818FB15A91C066D', 'admin', '192.168.2.32', '0', '2016-03-18 16:07:53', '2016-03-21 16:18:00', '2016-03-18 16:13:57');
INSERT INTO `log_user_login` VALUES ('E1327023C0184D08BAE16106167248C8', 'FA7A23CE4D171ECA97E9E35E7CC6A743', 'admin', '192.168.2.129', '0', '2016-03-24 11:21:15', '2016-03-24 13:29:08', '2016-03-24 11:21:15');
INSERT INTO `log_user_login` VALUES ('E20425B5F5234B0499BE0F84C3230A10', 'AA82FE7B7A89298E7F959C958F839FCF', 'admin', '192.168.2.32', '0', '2016-03-23 14:59:59', '2016-03-23 17:22:37', '2016-03-23 15:12:28');
INSERT INTO `log_user_login` VALUES ('E260C1EE9D6E4C9BB0F38BF65534495D', 'C47C8AA233FD429CF93BE8A64D60E1F5', 'admin', '192.168.2.129', '0', '2016-09-01 16:32:16', '2016-09-01 19:55:37', '2016-09-01 17:43:29');
INSERT INTO `log_user_login` VALUES ('E3E92898E56C408695EC1D11A5E2E331', '5995F93623BC66799A629236558E9622', 'admin', '192.168.2.210', '0', '2016-03-31 18:22:38', '2016-03-31 20:28:27', '2016-03-31 18:22:38');
INSERT INTO `log_user_login` VALUES ('E407565CEF604356A5B12BEA23B4A401', 'B9DE485070EFF80A284250E782D3FE2D', 'admin', '192.168.2.32', '0', '2016-03-21 21:40:06', '2016-03-21 23:51:27', '2016-03-21 21:40:06');
INSERT INTO `log_user_login` VALUES ('E4939327CB184851BB2DD27364A3FE66', 'F3D7E2E42173CF5777694F5DA144F351', 'admin', '192.168.2.32', '0', '2016-07-26 17:24:54', '2016-07-27 09:38:30', '2016-07-26 18:26:25');
INSERT INTO `log_user_login` VALUES ('E5196197A31F44B1A9CB19C419062539', 'FB3D22C8E3F27A63461ECCCA296F0A18', 'admin', '192.168.2.129', '0', '2016-09-30 10:57:17', '2016-10-10 10:05:58', '2016-09-30 11:01:07');
INSERT INTO `log_user_login` VALUES ('E5B76F41F56A41D9BDE5146D49E3D15C', '70228DF20B0C77956FC621E9627582CD', 'admin', '192.168.2.223', '0', '2016-04-20 14:20:23', '2016-04-20 16:59:40', '2016-04-20 14:20:23');
INSERT INTO `log_user_login` VALUES ('E63554C4B74E4279A531155CC2E33261', '1AC18F033D94DE5347E5E0B7EB7192B6', 'admin', '192.168.2.129', '0', '2016-09-22 10:32:46', '2016-09-22 12:40:46', '2016-09-22 10:32:46');
INSERT INTO `log_user_login` VALUES ('E698B902627B4EF2B54A46E841A2A8B8', 'AA57155AA58CE7D27B5DCBCFFE407D7D', 'admin', '192.168.2.129', '0', '2016-09-27 14:34:04', '2016-09-28 17:29:59', '2016-09-27 14:38:31');
INSERT INTO `log_user_login` VALUES ('E71C7B30DF86468BAF2316AC059A9263', '933726D5F30AAF4C2E693A91FC81D74E', 'admin', '192.168.2.32', '0', '2016-03-18 16:30:19', '2016-03-21 16:18:00', '2016-03-18 16:30:19');
INSERT INTO `log_user_login` VALUES ('E7400AE5D769483DA771518330B81BDB', 'E6A7C188E32BC8D1E77225777B89BC9E', 'admin', '192.168.1.239', '0', '2016-03-28 18:49:27', '2016-03-28 20:56:42', '2016-03-28 18:49:27');
INSERT INTO `log_user_login` VALUES ('E74D8F87922D49C5816D1600422C986C', '560033810DD3FE06FD0E34C134C1A620', 'admin', '192.168.1.239', '0', '2016-03-18 16:36:49', '2016-03-21 16:18:00', '2016-03-18 17:53:47');
INSERT INTO `log_user_login` VALUES ('E7CB6A2FB6A84BF4A5ECFF757BC707BE', '32BD8B09CE2AB44BE473E848742A7E1C', 'admin', '127.0.0.1', '0', '2016-04-05 16:19:38', '2016-04-05 18:31:45', '2016-04-05 16:19:39');
INSERT INTO `log_user_login` VALUES ('E7CD6FEB08994FA0B8C67363A9D4D882', '95F01E24262E52247FF79EA624ED0AE6', 'admin', '192.168.2.32', '0', '2016-08-17 15:14:42', '2016-08-17 18:14:57', '2016-08-17 16:06:30');
INSERT INTO `log_user_login` VALUES ('E8E5779B8A3840559D9F05F7FD95195D', 'B5FECC87D06BA574ABAFCFF696A49C3D', 'admin', '192.168.1.239', '0', '2016-03-22 20:14:40', '2016-03-22 22:21:29', '2016-03-22 20:14:40');
INSERT INTO `log_user_login` VALUES ('E951F658C3A0488DA8FFE0CB1749485F', '49CE7422C416FA1C77AC2C0BF7C3E8FD', 'admin', '192.168.1.129', '0', '2016-04-26 17:40:03', '2016-04-27 14:51:20', '2016-04-26 17:40:03');
INSERT INTO `log_user_login` VALUES ('EA205F8DEF3C49508C3922A5FB5C902B', '64FA9F019186495A8F7EAC557F8383FC', 'admin', '192.168.2.129', '0', '2016-03-24 11:44:41', '2016-03-24 13:52:40', '2016-03-24 11:44:41');
INSERT INTO `log_user_login` VALUES ('EACA886BDD5D41CA9DEF49E131751BF3', 'DFA599584B31947CD2E841EC4F06FB87', 'admin', '192.168.2.210', '0', '2016-03-30 20:51:40', '2016-03-31 11:29:26', '2016-03-30 20:51:40');
INSERT INTO `log_user_login` VALUES ('EB536D7C073E4706A772DE046612513A', '58ED96F331D82F4F41187ECFCA85B780', 'admin', '192.168.1.239', '0', '2016-03-22 16:57:14', '2016-03-22 19:38:06', '2016-03-22 17:28:05');
INSERT INTO `log_user_login` VALUES ('EC7403186D1C40F6BC7148250F14D5A3', '02F18A34D143A8F0DBECDAAFCF311787', 'admin', '192.168.2.210', '0', '2016-03-30 11:13:03', '2016-03-30 13:20:56', '2016-03-30 11:13:03');
INSERT INTO `log_user_login` VALUES ('EC9C70B48E2D44A9A3FEB64D0518B50E', '75371F00353BDE17AC84084BCD757E2D', 'admin', '192.168.2.210', '0', '2016-03-31 20:04:12', '2016-03-31 22:38:27', '2016-03-31 20:28:37');
INSERT INTO `log_user_login` VALUES ('ED5F288ED74047BCAB43E438397347A8', '5BA60FA5856765263CFD36D2B05F6C17', 'admin', '192.168.2.32', '0', '2016-09-19 16:34:40', '2016-09-19 21:19:47', '2016-09-19 19:14:11');
INSERT INTO `log_user_login` VALUES ('EE1A27B72F36465883275344E299577D', '5C9CC714A5A6952738500258BE7A1674', 'admin', '192.168.2.129', '0', '2016-03-22 14:57:42', '2016-03-22 17:24:41', '2016-03-22 15:17:10');
INSERT INTO `log_user_login` VALUES ('EE1EF1FC91844C22933DC2B699FA8F3D', '2EA775CBC11384A52B8E18BE81B82971', 'admin', '127.0.0.1', '0', '2016-10-10 09:57:17', '2016-10-13 16:57:23', '2016-10-10 09:57:18');
INSERT INTO `log_user_login` VALUES ('EE6FCEB08F7D4BBE8456B9D186E4823E', '1A3A20413B0C188AAC64F475134C3AA8', 'admin', '192.168.1.231', '0', '2016-05-12 18:08:12', '2016-05-13 15:16:28', '2016-05-12 19:28:59');
INSERT INTO `log_user_login` VALUES ('EF6BBF83E1E842B4AB73B9FAD1B8EBB0', '9CDCD0EC0CA7D7DA7C44B648D0F8C3B5', 'admin', '192.168.2.129', '0', '2016-08-24 19:40:38', '2016-08-24 21:51:16', '2016-08-24 19:40:38');
INSERT INTO `log_user_login` VALUES ('EF7205095D19431E990F286BC06D36D0', '1D0CF44CA00EE3FF45E227EF03C5F98A', 'admin', '192.168.1.239', '0', '2016-03-28 17:05:09', '2016-03-28 19:16:42', '2016-03-28 17:05:09');
INSERT INTO `log_user_login` VALUES ('EF81E19E4785496798CE3DC9CF0145E8', '6426B78CC85827E30F12B4370285E6C4', 'admin', '192.168.2.32', '0', '2016-03-16 10:15:18', '2016-03-16 15:04:33', '2016-03-16 10:15:18');
INSERT INTO `log_user_login` VALUES ('EF8227E4F2534B7992D75124BFF39E27', 'F348F9281916817A60656306E7236FA9', 'admin', '192.168.1.231', '0', '2016-05-12 19:46:56', '2016-05-13 15:16:28', '2016-05-12 19:46:56');
INSERT INTO `log_user_login` VALUES ('EFE4218E212D42C4A351F4DF79D79B97', '4EF896BD7E68C88D6A23603210198628', 'admin', '192.168.2.32', '0', '2016-08-19 09:49:56', '2016-08-19 14:04:02', '2016-08-19 11:58:41');
INSERT INTO `log_user_login` VALUES ('F0127059050B43BABF3948A7C73BC6F0', '25CDD6B3B1780ADF7899363723137428', 'admin', '192.168.2.129', '0', '2016-03-24 11:52:13', '2016-03-24 14:04:49', '2016-03-24 11:58:34');
INSERT INTO `log_user_login` VALUES ('F03E99ADDF564F2FA4BB86EEABFBD716', '5D660D790959BBB54DB774BEAA2F9ED2', 'admin', '192.168.1.231', '0', '2016-08-30 09:45:54', '2016-08-30 12:43:42', '2016-08-30 10:38:34');
INSERT INTO `log_user_login` VALUES ('F09B19D290E547F193D982924F468666', '2D5394DC329BB2B1C3F431E25989BE5C', 'admin', '192.168.1.129', '0', '2016-05-14 15:19:08', '2016-05-16 15:49:14', '2016-05-14 15:19:08');
INSERT INTO `log_user_login` VALUES ('F0A8EC496D5746C096F3766A63D7AD44', 'C1F7F8738AFC3B720A8F42D01FF9B48D', 'admin', '192.168.2.129', '0', '2016-08-25 16:11:57', '2016-08-25 18:29:02', '2016-08-25 16:19:20');
INSERT INTO `log_user_login` VALUES ('F1EFF49FAC394A50AFB971EC555E1974', 'F2756198EF014C679721FEBE9A815F67', 'admin', '192.168.2.32', '0', '2016-03-16 09:41:25', '2016-03-16 15:04:33', '2016-03-16 09:41:25');
INSERT INTO `log_user_login` VALUES ('F209A4387EF34CF0850C9366FBD1161E', '77A1D5E22BF3532CCE503A789DA34294', 'admin', '192.168.2.32', '0', '2016-08-16 14:42:06', '2016-08-16 17:27:32', '2016-08-16 15:21:45');
INSERT INTO `log_user_login` VALUES ('F27122A91C904AAB85C29A479B55B165', '48CA056B415055C2AB30F220EC9094BC', 'admin', '192.168.1.231', '0', '2016-08-31 15:01:57', '2016-08-31 17:36:30', '2016-08-31 15:01:57');
INSERT INTO `log_user_login` VALUES ('F3B61137D7564528AFCB518FD21EBE66', '28C63B9FE582F0E7CFC7164AFE7E92CA', 'admin', '192.168.2.32', '0', '2016-08-18 15:29:22', '2016-08-18 17:54:01', '2016-08-18 15:42:17');
INSERT INTO `log_user_login` VALUES ('F41C2A1036BA4786A892645B6A377AA0', '6AFF2984B4D79D75FA5617F0BED11F8A', 'admin', '192.168.2.223', '0', '2016-05-13 18:03:37', '2016-05-16 15:49:14', '2016-05-13 18:03:37');
INSERT INTO `log_user_login` VALUES ('F420D155095E4AEA9364925983F64EE0', '27142C3A59F2A9572878864ECD0A77CC', 'admin', '192.168.2.239', '0', '2016-04-26 14:48:22', '2016-04-26 17:34:57', '2016-04-26 14:48:22');
INSERT INTO `log_user_login` VALUES ('F4EA19CA2911467EB90501366DE8A814', 'B6C623ADF154EF90B03117506ADDE6D2', 'admin', '192.168.2.129', '0', '2016-08-25 17:36:34', '2016-08-25 19:47:32', '2016-08-25 17:36:34');
INSERT INTO `log_user_login` VALUES ('F5351A2255594756BB5E898A489D72DA', '53CC929D10C78E3327BC3927EA4B6094', 'admin', '192.168.2.129', '0', '2016-09-26 19:24:28', '2016-09-26 21:31:35', '2016-09-26 19:24:28');
INSERT INTO `log_user_login` VALUES ('F55C53066E3747B58844637011526C81', '097AADAA73C53843D71BC607AF344A12', 'admin', '192.168.2.210', '0', '2016-04-05 18:21:41', '2016-04-05 20:41:45', '2016-04-05 18:27:49');
INSERT INTO `log_user_login` VALUES ('F567BBF9A74045C69F7698769889B279', 'CA995E88A39615FC91CF548C0D982EDA', 'admin', '192.168.1.231', '0', '2016-05-12 19:38:30', '2016-05-13 15:16:28', '2016-05-12 19:38:30');
INSERT INTO `log_user_login` VALUES ('F5EF102935174B618077DD17B3D074BD', '2ED25171CA1990C339D174A3749C19CB', 'admin', '192.168.1.231', '0', '2016-08-30 15:01:09', '2016-08-30 17:13:49', '2016-08-30 15:01:09');
INSERT INTO `log_user_login` VALUES ('F5F0B68021EE4FA9A58E21753F179069', 'D31D919E8562EF4260A2195789884669', 'admin', '192.168.1.231', '0', '2016-08-31 18:15:52', '2016-08-31 20:25:36', '2016-08-31 18:15:52');
INSERT INTO `log_user_login` VALUES ('F60FF173683847BE9E988FF735A9AEC5', '4C6169EDE0D403F2792FAC7A172C9617', 'admin', '192.168.1.129', '0', '2016-04-21 18:00:08', '2016-04-22 16:17:44', '2016-04-21 19:14:52');
INSERT INTO `log_user_login` VALUES ('F6B15CF7670B40E98E3ECAA73D89C92B', '8CF5873C95E11CFE991A03F449306F1C', 'admin', '192.168.2.32', '0', '2016-08-24 15:09:42', '2016-08-24 17:41:16', '2016-08-24 15:31:21');
INSERT INTO `log_user_login` VALUES ('F6FCD97133624BFDBD61BF368BC578EF', 'FB3792287F6837B798FC2C3E4D4C9E52', 'admin', '192.168.2.129', '0', '2016-08-26 14:41:41', '2016-08-26 17:21:32', '2016-08-26 15:13:05');
INSERT INTO `log_user_login` VALUES ('F705B531C6574015A1B2B972BAA1A6B3', 'D6420C4267624B9CD62E034BF7484D28', 'admin', '192.168.2.210', '0', '2016-03-30 11:41:06', '2016-03-30 13:50:56', '2016-03-30 11:41:06');
INSERT INTO `log_user_login` VALUES ('F720F4B584A14F0985136FDCDC70E5DA', '8112A170E1E783542FD630220A432224', 'admin', '192.168.2.223', '0', '2016-05-05 15:05:07', '2016-05-11 20:59:40', '2016-05-05 17:36:26');
INSERT INTO `log_user_login` VALUES ('F77911A2410B4203BB556C2D183A5419', 'F4C222AC463DAFB918C89F5CE4C20215', 'admin', '192.168.2.129', '0', '2016-03-23 17:07:50', '2016-03-23 19:13:38', '2016-03-23 17:07:50');
INSERT INTO `log_user_login` VALUES ('F8B34DDFFE9146CE8738DF1B338F9A65', '71C4EB079CB6E09663AE7019137891FB', 'admin', '192.168.1.231', '0', '2016-05-12 19:57:12', '2016-05-13 15:16:28', '2016-05-12 20:31:46');
INSERT INTO `log_user_login` VALUES ('F8B61C898FB74CEF9B1D4B7C2F9911CB', '46CBD90B0A102F7ECAC8B8403A21FABE', 'admin', '192.168.2.129', '0', '2016-08-30 19:21:03', '2016-08-30 22:03:40', '2016-08-30 19:57:45');
INSERT INTO `log_user_login` VALUES ('F99161B7A5EE490FA86957EA85EBFEB3', 'A9A749E2F4B1DE5A643D2F29553CD8E6', 'admin', '192.168.2.129', '0', '2016-03-18 17:26:08', '2016-03-21 16:18:00', '2016-03-18 17:26:08');
INSERT INTO `log_user_login` VALUES ('FA5FA51009264A0D8D8991ADC69749ED', '6058E550850817930B1DA178EDFDA514', 'admin', '192.168.2.129', '0', '2016-09-26 19:28:00', '2016-09-26 21:41:35', '2016-09-26 19:28:00');
INSERT INTO `log_user_login` VALUES ('FABDD426034D4C2C8CE7C21D9EA865E3', '6B51B135AC2EF8C03C82B55D74BDFE92', 'admin', '192.168.1.231', '0', '2016-04-20 14:52:19', '2016-04-20 15:01:26', '2016-04-20 15:00:25');
INSERT INTO `log_user_login` VALUES ('FAFCA1BE9FFB4CE5BB3F752AC9ACFB22', 'C4493A61A5C2FF28CC0E98728670DA31', 'admin', '192.168.2.32', '0', '2016-03-28 16:45:13', '2016-03-28 19:46:42', '2016-03-28 17:32:22');
INSERT INTO `log_user_login` VALUES ('FB22757177C04CAE90EA426C74C51103', 'EB8CEBAF25888CCA18AC150461AE7B07', 'admin', '192.168.1.239', '0', '2016-03-16 17:37:27', '2016-03-17 14:41:10', '2016-03-16 17:37:27');
INSERT INTO `log_user_login` VALUES ('FB5B469C528E4603A751FAF24E05F56D', '6922DB3EDFF98BD843FF76A2C59E2381', 'admin', '127.0.0.1', '0', '2016-10-13 17:53:15', '2016-10-13 20:13:02', '2016-10-13 17:58:15');
INSERT INTO `log_user_login` VALUES ('FB61385D2AB843569D4BBA5D9DF11F4B', 'F476F2492D58171F9B44CF4B8AE998E9', 'admin', '192.168.1.231', '0', '2016-04-20 16:44:43', '2016-04-20 18:52:16', '2016-04-20 16:44:43');
INSERT INTO `log_user_login` VALUES ('FBB50E26E4D4443C947E1FA8DB4D1052', '19432091BA462F90A555AA08B7782C70', 'admin', '192.168.1.129', '0', '2016-04-01 09:52:40', '2016-04-01 18:02:14', '2016-04-01 15:55:44');
INSERT INTO `log_user_login` VALUES ('FC71A7374FCF4045A6C8F494D1B0C178', '73B7C9CCDA63703D73AB6779C863F5F6', 'admin', '192.168.2.129', '0', '2016-09-26 16:31:30', '2016-09-26 18:38:47', '2016-09-26 16:31:31');
INSERT INTO `log_user_login` VALUES ('FC7D1373BB514B9E91B8A13CC0EE96E2', '22DEFCCBDA3BEAD102561CE89B8B560F', 'admin', '192.168.2.210', '0', '2016-03-28 16:29:11', '2016-03-28 18:49:12', '2016-03-28 16:36:15');
INSERT INTO `log_user_login` VALUES ('FC8102F21B264F1BAE66AF81E82F100C', 'E523BFF689D4440CE61A015EC3710067', 'admin', '192.168.2.32', '0', '2016-08-24 11:57:57', '2016-08-24 14:06:55', '2016-08-24 11:57:57');
INSERT INTO `log_user_login` VALUES ('FCB9FA5535524EEE89C93DB3AB3CEB17', '98A48BC938C46159ED2A5BA2B5F932E5', 'admin', '192.168.1.239', '0', '2016-03-31 14:19:12', '2016-03-31 16:33:00', '2016-03-31 14:19:12');
INSERT INTO `log_user_login` VALUES ('FDC6FC7D4A034AF28D4573C0670F7992', '8708D81BB5CAFC762E4E3765CEE69F73', 'admin', '192.168.2.32', '0', '2016-09-21 15:14:18', '2016-09-21 17:37:38', '2016-09-21 15:28:42');
INSERT INTO `log_user_login` VALUES ('FDCB53B522C347E2A0E32B612BCCFB9C', '322768794A91530FCAE6CF371C86189A', 'admin', '192.168.2.129', '0', '2016-09-20 14:32:57', '2016-09-20 17:07:33', '2016-09-20 14:53:32');
INSERT INTO `log_user_login` VALUES ('FE0F69136C5B49EAA2B2653BB085158F', 'B6F1CCF60039B08572D92B1FF99FD447', 'admin', '127.0.0.1', '0', '2016-10-13 18:13:04', '2016-10-13 20:33:02', '2016-10-13 18:22:58');
INSERT INTO `log_user_login` VALUES ('FE8AF7CD96494167A6CE42DC27462B05', 'EC4DDA111D808022D660260BD689F754', 'admin', '192.168.2.32', '0', '2016-08-18 11:55:47', '2016-08-18 14:00:49', '2016-08-18 11:55:47');
INSERT INTO `log_user_login` VALUES ('FECEA4E0443E478BB27CC9D424680BF5', 'D772AF3FECDDFB325D97EFB656EE9F42', 'admin', '192.168.2.129', '0', '2016-03-23 17:31:38', '2016-03-23 17:42:05', '2016-03-23 17:31:38');
INSERT INTO `log_user_login` VALUES ('FF214D76BEA24034B279BC75F29BE40D', 'D26AB8FE3A278D62955A13B066D7E3B0', 'admin', '192.168.1.129', '0', '2016-04-19 15:14:21', '2016-04-19 17:21:01', '2016-04-19 15:14:21');
INSERT INTO `log_user_login` VALUES ('FF56048D5AEE46F3B8D5E99FE07E0772', '546A411F0197419BD13D5AD6C6F6347D', 'admin', '192.168.2.210', '0', '2016-03-30 20:32:03', '2016-03-31 11:29:26', '2016-03-30 20:46:55');
INSERT INTO `log_user_login` VALUES ('FF82C002D2254703B889C13A25715576', 'F4BF9557499669D56463D4486DA13746', 'admin', '192.168.2.129', '0', '2016-08-25 19:12:59', '2016-08-26 09:11:42', '2016-08-25 19:12:59');
INSERT INTO `log_user_login` VALUES ('FF89F97ADD5B4659B3E4D6A703B22946', '421D48FB753487A7B24C7D793352C0C5', 'admin', '192.168.1.129', '0', '2016-05-23 18:11:47', '2016-05-23 20:22:40', '2016-05-23 18:11:47');

-- ----------------------------
-- Table structure for `t_bbs`
-- ----------------------------
DROP TABLE IF EXISTS `t_bbs`;
CREATE TABLE `t_bbs` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `user_id` int(8) DEFAULT NULL COMMENT '用户ID',
  `title` varchar(400) DEFAULT NULL COMMENT '标题',
  `cover_image` varchar(400) DEFAULT NULL COMMENT '封面',
  `content` longtext COMMENT '帖子详情',
  `detail` longtext COMMENT '内容',
  `img1` varchar(400) DEFAULT NULL COMMENT '图片1',
  `img2` varchar(400) DEFAULT NULL COMMENT '图片2',
  `img3` varchar(400) DEFAULT NULL COMMENT '图片3',
  `img4` varchar(400) DEFAULT NULL COMMENT '图片4',
  `video` varchar(400) DEFAULT NULL COMMENT '视频链接',
  `source` int(11) DEFAULT NULL COMMENT '状态1:用户，2:系统',
  `status` int(11) DEFAULT NULL COMMENT '状态1:正常，2:删除',
  `is_top` int(11) DEFAULT NULL COMMENT '是否置顶（默认是1为不置顶，2表示置顶）',
  `type` int(11) DEFAULT NULL COMMENT '状态1:图文，2:视频',
  `like_count` int(8) unsigned zerofill DEFAULT '00000000' COMMENT '点赞次数',
  `comment_count` int(8) unsigned zerofill DEFAULT NULL COMMENT '评论次数',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COMMENT='发帖表';

-- ----------------------------
-- Records of t_bbs
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `real_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `cellphone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `sex` int(2) DEFAULT NULL COMMENT '性别， 1男2女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `education` int(2) DEFAULT NULL COMMENT '学历',
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在城市',
  `idno` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `head_img` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `idno_type` int(2) DEFAULT NULL COMMENT '身份证类型，1大陆， 2其它',
  `deal_pwd` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易密码',
  `regist_source` int(2) DEFAULT NULL COMMENT '注册来源： 1微信注册，2ios 3安卓',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户标签',
  `desire` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户愿望',
  `is_able` int(2) DEFAULT NULL COMMENT '是否禁用 1启用 2禁用',
  `nick_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` double(15,10) DEFAULT NULL COMMENT '经度',
  `latitude` double(15,10) DEFAULT NULL COMMENT '纬度',
  `geohash` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '位置编码',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `bank_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行名',
  `card_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡号',
  `img_audit_status` int(2) NOT NULL DEFAULT '1' COMMENT '图片审核状态（1标识未审核，2标识审核通过，3标识审核驳回）',
  `img_audit_time` datetime DEFAULT NULL COMMENT '图片审核时间',
  `img_remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片审核评论',
  `is_dark_room` int(2) NOT NULL DEFAULT '1' COMMENT '是否小黑屋,1否2是',
  `profession` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职业',
  `is_remove_contacts` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y' COMMENT '是否屏蔽通讯录',
  `is_open_account` int(1) NOT NULL DEFAULT '0' COMMENT '用户是否开户 默认为0 未开户 1 已开户',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本控制',
  `big_head_image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像原图',
  `imToken` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` int(2) DEFAULT NULL COMMENT '身高',
  `motto` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人签名(座右铭)',
  `point_of_love` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '爱情的态度',
  `point_of_sex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对性的看法',
  `cover_img` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人封面模板图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_cellphone` (`cellphone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES ('62', null, '18670578959', '1', '1970-01-01', null, '北京 海淀 ', null, 'http://dacaizi-file.oss-cn-shenzhen.aliyuncs.com/bbs/img/d016132e-08af-47a5-b2db-f0de423fb962.jpg', null, null, '2', '2016-09-20 14:53:05', null, null, null, 'Mro.nle布莱恩特', null, null, null, '2016-09-20 14:53:05', null, null, '1', null, null, '1', null, 'Y', '0', '0', null, null, null, null, null, null, null);
INSERT INTO `t_user_info` VALUES ('63', null, '18681458994', '2', '1992-01-01', null, '广东 深圳 南山区', null, 'http://dacaizi-file.oss-cn-shenzhen.aliyuncs.com/bbs/img/d016132e-08af-47a5-b2db-f0de423fb962.jpg', null, null, '2', '2016-09-20 14:53:05', null, null, null, 'Vki.FUY查尔斯', null, null, null, '2016-09-20 14:53:05', null, null, '1', null, null, '1', null, 'Y', '0', '0', null, null, null, null, null, null, null);
INSERT INTO `t_user_info` VALUES ('64', null, '15914454732', '1', null, null, '深圳市', null, 'http://dacaizi-file.oss-cn-shenzhen.aliyuncs.com/bbs/img/d016132e-08af-47a5-b2db-f0de423fb962.jpg', null, null, '3', '2016-09-20 14:55:53', null, null, null, 'hdf大号', null, null, null, '2016-09-20 14:55:53', null, null, '1', null, null, '1', null, 'Y', '0', '0', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_user_tp`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_tp`;
CREATE TABLE `t_user_tp` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `tp_id` varchar(250) NOT NULL COMMENT '第三方登录的id （如果是手机app登录则默认记住用户的软件id）',
  `user_id` int(20) NOT NULL COMMENT '用户的userid 对于t_user表',
  `flag` int(2) DEFAULT NULL COMMENT '账号的状态  1 正常 2  已失效',
  `access_token` varchar(250) DEFAULT NULL COMMENT '第三方登录的accesstoken',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `type` int(2) NOT NULL COMMENT '5 PC端注册用户 6 微信端注册用户 7 APP注册用户',
  `operate` int(2) NOT NULL DEFAULT '0' COMMENT '1.ios  2.android',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='第三方表';

-- ----------------------------
-- Records of t_user_tp
-- ----------------------------

-- ----------------------------
-- Table structure for `user_dept`
-- ----------------------------
DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept` (
  `dept_id` varchar(255) NOT NULL COMMENT '部门编号',
  `dept_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `p_dept_id` varchar(255) DEFAULT NULL COMMENT '上级部门编号',
  `head_user_id` varchar(255) DEFAULT NULL COMMENT '部门负责人',
  `order_by` float DEFAULT NULL COMMENT '显示顺序，越大越靠前',
  `dept_desc` varchar(255) DEFAULT NULL COMMENT '部门描述',
  `reserve1` varchar(255) DEFAULT NULL COMMENT '保留字段1',
  `reserve2` varchar(255) DEFAULT NULL COMMENT '保留字段2',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_dept
-- ----------------------------
INSERT INTO `user_dept` VALUES ('CUSTOMER', '客服部', '0', '', '1', '客服部', '', '');
INSERT INTO `user_dept` VALUES ('MANAGEMENT', '管理员', '0', '', '3', '管理员', '', '');
INSERT INTO `user_dept` VALUES ('OPERATION', '运营部', '0', '', '2', '运营部', '', '');

-- ----------------------------
-- Table structure for `user_func`
-- ----------------------------
DROP TABLE IF EXISTS `user_func`;
CREATE TABLE `user_func` (
  `func_id` varchar(255) NOT NULL COMMENT '功能ID，程序生成，这个ID的生成应该按照2位2位生成，按照顺序排列，譬如：01,02,03表示以及菜单，0101,0102,0103,0104表示二级菜单，并且都是01这个菜单下的子菜单，010101,010102表示都是0101下的子菜单',
  `func_name` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `func_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `p_func_id` varchar(255) DEFAULT NULL COMMENT '上级功能ID，0=顶级功能',
  `link` varchar(255) DEFAULT NULL COMMENT '链接页面',
  `menu_flag` varchar(255) DEFAULT NULL COMMENT '菜单标志 1=菜单，譬如用户信息',
  `func_flag` varchar(255) DEFAULT NULL COMMENT '功能标志 1=功能，譬如增加、删除',
  `status` varchar(255) DEFAULT NULL COMMENT '是否有效，1=是  0=否',
  `show` varchar(255) DEFAULT NULL COMMENT '是否可见 0:不可见；1:可见',
  `pic` varchar(255) DEFAULT NULL COMMENT '显示图片',
  `order_by` float DEFAULT NULL COMMENT '显示顺序，显示顺序越大越靠前',
  `reserve1` varchar(255) DEFAULT NULL COMMENT '保留字段1',
  `reserve2` varchar(255) DEFAULT NULL COMMENT '保留字段2',
  PRIMARY KEY (`func_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_func
-- ----------------------------
INSERT INTO `user_func` VALUES ('01', '系统设置', '', '0', '#', '1', '0', '1', '1', 'setting.png', '7', '', '');
INSERT INTO `user_func` VALUES ('0101', '用户管理', '', '01', '/permission/userInfo/index.do', '1', '0', '1', '1', '', '417', '', '');
INSERT INTO `user_func` VALUES ('010101', '新增用户', '新增用户', '0101', '/permission/userInfo/add.do;/permission/userInfo/doAdd.do', '0', '1', '1', '1', '', '60123', '', '');
INSERT INTO `user_func` VALUES ('010102', '修改用户', '', '0101', '/permission/userInfo/update.do;/permission/userInfo/doUpdate.do', '0', '1', '1', '1', '', '60124', '', '');
INSERT INTO `user_func` VALUES ('010103', '初始化密码', '', '0101', '/permission/userInfo/doResetPassword.do', '0', '1', '1', '1', '', '60125', '', '');
INSERT INTO `user_func` VALUES ('010104', '冻结用户', '', '0101', '/permission/userInfo/disable.do;/permission/userInfo/doDisable.do', '0', '1', '1', '1', '', '60123', '', '');
INSERT INTO `user_func` VALUES ('010105', '启用用户', '', '0101', '/permission/userInfo/doEnable.do', '0', '1', '1', '1', '', '60115', '', '');
INSERT INTO `user_func` VALUES ('010106', '删除用户', '', '0101', '/permission/userInfo/doDelete.do', '0', '1', '1', '1', '', '60108', '', '');
INSERT INTO `user_func` VALUES ('010107', '用户列表', '', '0101', '/permission/userInfo/list.do', '0', '1', '1', '1', '', '60116', '', '');
INSERT INTO `user_func` VALUES ('010108', '解锁用户', '', '0101', '/permission/userInfo/unlock.do', '0', '1', '1', '1', '', '60109', '', '');
INSERT INTO `user_func` VALUES ('010109', '查看', '', '0101', '/permission/userInfo/view.do', '0', '1', '1', '1', null, '60109', '', '');
INSERT INTO `user_func` VALUES ('0102', '角色管理', '', '01', '/permission/userRole/index.do', '1', '0', '1', '1', '', '611', '', '');
INSERT INTO `user_func` VALUES ('010201', '查询列表', '', '0102', '/permission/userRole/list.do', '0', '1', '1', '1', '', '60202', '', '');
INSERT INTO `user_func` VALUES ('010202', '新增角色', '', '0102', '/permission/userRole/add.do;/permission/userRole/doAdd.do', '0', '1', '1', '1', '', '60203', '', '');
INSERT INTO `user_func` VALUES ('010203', '修改角色', '', '0102', '/permission/userRole/update.do;/permission/userRole/doUpdate.do', '0', '1', '1', '1', '', '60206', '', '');
INSERT INTO `user_func` VALUES ('010204', '删除角色', '', '0102', '/permission/userRole/doDelete.do', '0', '1', '1', '1', '', '60205', '', '');
INSERT INTO `user_func` VALUES ('0104', '角色菜单权限', '', '01', '/permission/userRoleFunc/index.do', '1', '0', '1', '1', '', '209', '', '');
INSERT INTO `user_func` VALUES ('010401', '角色权限修改', '', '0104', '/permission/userRoleFunc/doUpdate.do', '0', '1', '1', '1', '', '60402', '', '');
INSERT INTO `user_func` VALUES ('010402', '角色/用户列表', '', '0104', '/permission/userRoleFunc/roleList.do;/permission/userRoleFunc/funcList.do', '0', '1', '1', '1', '', '60403', '', '');
INSERT INTO `user_func` VALUES ('0105', '菜单管理', '', '01', '/permission/userFunc/index.do', '1', '0', '1', '1', '', '610', '', '');
INSERT INTO `user_func` VALUES ('010501', '查询列表', '', '0105', '/permission/userFunc/list.do', '0', '1', '1', '1', '', '60501', '', '');
INSERT INTO `user_func` VALUES ('010502', '新增菜单', '', '0105', '/permission/userFunc/add.do;/permission/userFunc/doAdd.do', '0', '1', '1', '1', '', '60502', '', '');
INSERT INTO `user_func` VALUES ('010503', '修改菜单', '', '0105', '/permission/userFunc/update.do;/permission/userFunc/doUpdate.do', '0', '1', '1', '1', '', '60503', '', '');
INSERT INTO `user_func` VALUES ('010504', '删除菜单', '', '0105', '/permission/userFunc/doDelete.do', '0', '1', '1', '1', '', '60504', '', '');
INSERT INTO `user_func` VALUES ('010601', '修改密码', '', '0106', '/permission/modifyPassword/doUpdate.do', '0', '1', '1', '1', '', '60601', '', '');
INSERT INTO `user_func` VALUES ('0108', '用户所属角色', '', '01', '/permission/userRoleRelation/index.do', '1', '0', '1', '1', '', '401', '', '');
INSERT INTO `user_func` VALUES ('010801', '角色/用户列表', '', '0108', '/permission/userRoleRelation/roleList.do;/permission/userRoleRelation/userList.do', '0', '1', '1', '1', '', '60801', '', '');
INSERT INTO `user_func` VALUES ('010802', '角色用户修改', '', '0108', '/permission/userRoleRelation/doUpdate.do', '0', '1', '1', '1', '', '60802', '', '');
INSERT INTO `user_func` VALUES ('0113', '其他设置', '', '01', '#', '1', '0', '1', '1', '', '1', '', '');
INSERT INTO `user_func` VALUES ('011301', '数据字典', '', '0113', '#', '1', '0', '1', '1', '', '61301', '', '');
INSERT INTO `user_func` VALUES ('01130101', '数据字典分类', '', '011301', '/system/baseOptionType/index.do', '1', '0', '1', '1', '', '130101', '', '');
INSERT INTO `user_func` VALUES ('0113010101', '查询', '', '01130101', '/system/baseOptionType/list.do', '0', '1', '1', '1', '', '10103', '', '');
INSERT INTO `user_func` VALUES ('0113010102', '新增', '', '01130101', '/system/baseOptionType/add.do;/system/baseOptionType/doAdd.do', '0', '1', '1', '1', '', '10102', '', '');
INSERT INTO `user_func` VALUES ('0113010103', '修改', '', '01130101', '/system/baseOptionType/update.do;/system/baseOptionType/doUpdate.do', '0', '1', '1', '1', '', '10101', '', '');
INSERT INTO `user_func` VALUES ('01130102', '数据字典', '', '011301', '/system/baseOption/index.do', '1', '0', '1', '1', '', '130102', '', '');
INSERT INTO `user_func` VALUES ('0113010201', '查询', '', '01130102', '/system/baseOption/list.do', '0', '1', '1', '1', '', '10202', '', '');
INSERT INTO `user_func` VALUES ('0113010202', '新增', '', '01130102', '/system/baseOption/add.do;/system/baseOption/doAdd.do', '0', '1', '1', '1', '', '10201', '', '');
INSERT INTO `user_func` VALUES ('0113010203', '删除', '', '01130102', '/system/baseOption/doDelete.do', '0', '1', '1', '1', '', '10203', '', '');
INSERT INTO `user_func` VALUES ('0113010204', '修改', null, '01130102', '/system/baseOption/update.do;/system/baseOption/doUpdate.do', '0', '1', '1', '1', null, '10204', null, null);
INSERT INTO `user_func` VALUES ('0115', '部门管理', '部门管理', '01', '/permission/userDept/index.do', '1', '0', '1', '1', null, '618', '', '');
INSERT INTO `user_func` VALUES ('011501', '浏览', null, '0115', '/permission/userDept/list.do', '0', '1', '1', '1', null, '61504', null, null);
INSERT INTO `user_func` VALUES ('011502', '新增', null, '0115', '/permission/userDept/add.do;/permission/userDept/doAdd.do', '0', '1', '1', '1', null, '61501', null, null);
INSERT INTO `user_func` VALUES ('011503', '修改', null, '0115', '/permission/userDept/update.do;/permission/userDept/doUpdate.do', '0', '1', '1', '1', null, '61502', null, null);
INSERT INTO `user_func` VALUES ('011504', '删除', '删除', '0115', '/permission/userDept/doDelete.do', '0', '1', '1', '1', null, '61503', '', '');
INSERT INTO `user_func` VALUES ('0117', '系统参数配置', '', '01', '/system/baseConfig/index.do', '1', '0', '1', '1', '', '1', '', '');
INSERT INTO `user_func` VALUES ('011701', '数据列表', '', '0117', '/system/baseConfig/list.do', '0', '1', '1', '1', '', '61701', '', '');
INSERT INTO `user_func` VALUES ('011702', '新增页面', '', '0117', '/system/baseConfig/add.do', '0', '1', '1', '1', '', '61702', '', '');
INSERT INTO `user_func` VALUES ('011703', '新增操作', '', '0117', '/system/baseConfig/doAdd.do', '0', '1', '1', '1', '', '61703', '', '');
INSERT INTO `user_func` VALUES ('011704', '修改页面', '', '0117', '/system/baseConfig/update.do', '0', '1', '1', '1', '', '61704', '', '');
INSERT INTO `user_func` VALUES ('011705', '修改操作', '', '0117', '/system/baseConfig/doUpdate.do', '0', '1', '1', '1', '', '61707', '', '');
INSERT INTO `user_func` VALUES ('011706', '删除', '', '0117', '/system/baseConfig/doDelete.do', '0', '1', '1', '1', '', '61708', '', '');
INSERT INTO `user_func` VALUES ('04', '社区管理', '', '0', '#', '1', '0', '1', '1', null, '4', '', '');
INSERT INTO `user_func` VALUES ('0402', '帖子管理', '', '04', '/community/bbs/index.do', '1', '0', '1', '1', null, '402', '', '');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(255) NOT NULL COMMENT '用户登录ID，自己填写',
  `passwd` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `user_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `dept_id` varchar(255) DEFAULT NULL COMMENT '部门ID，关联USER_DEPT表DEPT_ID',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ号码',
  `role_list` varchar(255) DEFAULT NULL COMMENT '角色权限',
  `ip_addr` varchar(255) DEFAULT NULL COMMENT 'IP限制属性，多个IP用分号分隔，IP带0表示该段不限制',
  `certificate_type` varchar(255) DEFAULT NULL COMMENT '证件类型',
  `certificate_no` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(10) DEFAULT NULL COMMENT '出生日期',
  `degree` varchar(255) DEFAULT NULL COMMENT '学位',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `register_permanent` varchar(255) DEFAULT NULL COMMENT '户口',
  `marital_status` varchar(255) DEFAULT NULL COMMENT '婚姻状况',
  `mobile_phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `home_phone` varchar(255) DEFAULT NULL COMMENT '家庭电话',
  `home_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `year_to_work` int(11) DEFAULT NULL COMMENT '参加工作年份',
  `entry_date` varchar(10) DEFAULT NULL COMMENT '入职时间',
  `posit_date` varchar(10) DEFAULT NULL COMMENT '转正时间',
  `duty` varchar(255) DEFAULT NULL COMMENT '职位',
  `lvl` varchar(255) DEFAULT NULL COMMENT '级别',
  `emergency_contact` varchar(255) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_phone` varchar(255) DEFAULT NULL COMMENT '紧急联系人电话',
  `train` varchar(1000) DEFAULT NULL COMMENT '培训情况',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `reserve1` varchar(128) DEFAULT NULL COMMENT '保留字段1',
  `reserve2` varchar(128) DEFAULT NULL COMMENT '保留字段2',
  `status` varchar(255) DEFAULT 'Y' COMMENT '状态 正常/锁定',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `insert_by` varchar(255) DEFAULT NULL COMMENT '插入人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `struct_id` int(11) DEFAULT '1' COMMENT '组织ID',
  `relevance_user_id` varchar(255) DEFAULT NULL COMMENT '关联用户ID',
  `counter` int(11) DEFAULT '0' COMMENT '登录次数',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `lock_status` varchar(255) DEFAULT 'Y' COMMENT '状态 正常/锁定',
  `seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户代号',
  `intranet_land` int(11) DEFAULT '0' COMMENT '内网登录限制(0:不限制，1:只允许内网登录)',
  PRIMARY KEY (`seq`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', null, '', null, 'ilongyong@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, '18807301126', null, null, null, null, null, '', null, null, null, null, '', null, null, 'Y', '2015-11-24 14:01:17', 'admin', '2015-11-30 17:21:26', 'admin', '1', null, '0', '2015-11-24 14:01:17', 'Y', '300', '0');
INSERT INTO `user_info` VALUES ('lonyong', 'e10adc3949ba59abbe56e057f20f883e', '龙泳', null, 'OPERATION', null, 'ilongyong@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, '18807301126', null, null, null, null, null, 'aaa', null, null, null, null, 'aaa', null, null, 'Y', '2016-01-26 19:18:12', 'admin', null, null, '1', null, '0', null, 'Y', '302', '0');

-- ----------------------------
-- Table structure for `user_personal`
-- ----------------------------
DROP TABLE IF EXISTS `user_personal`;
CREATE TABLE `user_personal` (
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID，关联USER_INFO',
  `page_size` float DEFAULT NULL COMMENT '页面默认大小',
  `home_func_id` varchar(255) DEFAULT NULL COMMENT '默认打开页面菜单ID，关联USER_FUNC，0=未设置',
  `menu_show_type` float DEFAULT NULL COMMENT '显示菜单类型，1=显示顶部按钮菜单 2=显示顶部下拉菜单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_personal
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` varchar(255) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `reserve1` varchar(255) DEFAULT NULL COMMENT '保留字段1',
  `reserve2` varchar(255) DEFAULT NULL COMMENT '保留字段2',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('ADMIN', '超级管理员', '超级管理员', '', '');
INSERT INTO `user_role` VALUES ('CUSTOMER', '客服部', '客服部', '', '');
INSERT INTO `user_role` VALUES ('OPERATION', '运营部', '运营部', '', '');

-- ----------------------------
-- Table structure for `user_role_func`
-- ----------------------------
DROP TABLE IF EXISTS `user_role_func`;
CREATE TABLE `user_role_func` (
  `role_id` varchar(255) DEFAULT NULL COMMENT '角色ID，关联USERROLE',
  `func_id` varchar(255) DEFAULT NULL COMMENT '功能ID，关联USERFUNC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_func
-- ----------------------------
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '01');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0115');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011501');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011504');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011503');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011502');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0102');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010203');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010204');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010202');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010201');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0105');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010504');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010503');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010502');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010501');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0101');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010103');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010102');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010101');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010104');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010107');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010105');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010108');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010109');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010106');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0108');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010802');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010801');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0104');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010402');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '010401');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0117');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011706');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011705');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011704');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011703');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011702');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011701');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '011301');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '01130102');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010204');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010203');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010201');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010202');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '01130101');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010101');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010102');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0113010103');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '04');
INSERT INTO `user_role_func` VALUES ('CUSTOMER', '0402');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0115');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011501');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011504');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011503');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011502');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0102');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010203');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010204');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010202');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010201');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0105');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010504');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010503');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010502');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010501');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0101');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010103');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010102');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010101');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010104');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010107');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010105');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010108');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010109');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010106');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0108');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010802');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010801');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0104');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010402');
INSERT INTO `user_role_func` VALUES ('ADMIN', '010401');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011705');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011704');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011703');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011702');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011701');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113');
INSERT INTO `user_role_func` VALUES ('ADMIN', '011301');
INSERT INTO `user_role_func` VALUES ('ADMIN', '01130102');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010204');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010203');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010201');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010202');
INSERT INTO `user_role_func` VALUES ('ADMIN', '01130101');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010101');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010102');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0113010103');
INSERT INTO `user_role_func` VALUES ('ADMIN', '04');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0402');
INSERT INTO `user_role_func` VALUES ('ADMIN', '01');
INSERT INTO `user_role_func` VALUES ('ADMIN', '0117');
INSERT INTO `user_role_func` VALUES ('OPERATION', '04');
INSERT INTO `user_role_func` VALUES ('OPERATION', '0402');

-- ----------------------------
-- Table structure for `user_role_rela`
-- ----------------------------
DROP TABLE IF EXISTS `user_role_rela`;
CREATE TABLE `user_role_rela` (
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID，关联USERINFO',
  `role_id` varchar(255) DEFAULT NULL COMMENT '角色ID，关联USERROLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_rela
-- ----------------------------
INSERT INTO `user_role_rela` VALUES ('admin', 'ADMIN');
INSERT INTO `user_role_rela` VALUES ('lonyong', 'ADMIN');
