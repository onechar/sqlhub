/*
创建数据库
*/
CREATE DATABASE IF NOT EXISTS faradaylaser;
use faradaylaser;
set names utf8;

/*
材料列表
编号 所属入库单号 原材料编号 应到货数量 已到货数量 合同单价 财务单价 备注 入库日期 到货日期
*/
CREATE TABLE IF NOT EXISTS `Materials`(
	`mat_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`mat_code_id` INT UNSIGNED NOT NULL,
	`mat_gden_id` INT UNSIGNED NOT NULL,
	`mat_purchase` SMALLINT UNSIGNED NOT NULL,
	`mat_received` SMALLINT UNSIGNED NOT NULL,
	`mat_con_price` FlOAT(10,3) UNSIGNED NOT NULL,
	`mat_fd_price` FlOAT(10,3) UNSIGNED NOT NULL,
	`mat_notes` VARCHAR(25) NOT NULL,
	`mat_in_date` DATE NOT NULL,
	`mat_arrive_date` DATE NOT NULL,
   PRIMARY KEY ( `mat_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
材料编码
编号 原材料编号 物品名称 规格 型号 数量 单位 类别 备注
*/
CREATE TABLE IF NOT EXISTS `MaterialsCode`(
	`mat_code_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`mat_code_number` VARCHAR(12) NOT NULL,
	`mat_code_name` VARCHAR(15) NOT NULL,
	`mat_code_spec` VARCHAR(20) NOT NULL,
	`mat_code_models` VARCHAR(20) NOT NULL,
	`mat_code_unit` VARCHAR(4) NOT NULL,
	`mat_code_sort` VARCHAR(5) NOT NULL,
	`mat_code_notes` VARCHAR(30) NOT NULL,
   PRIMARY KEY (`mat_code_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
库存数量表
编号 原材料编码 数量 所属仓库
*/
CREATE TABLE IF NOT EXISTS `Inventory`(
	`invt_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`invt_code_id` INT UNSIGNED NOT NULL,
	`invt_number` SMALLINT UNSIGNED NOT NULL,
	`invt_whse_id` SMALLINT UNSIGNED NOT NULL,
   PRIMARY KEY (`invt_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
入库记录
编号 入库单号 所属仓库 所属合同 库管员 单号日期
*/
CREATE TABLE IF NOT EXISTS `GodownEntry`(
	`gden_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`gden_number` VARCHAR(12) NOT NULL,
	`gden_whse_id` SMALLINT UNSIGNED NOT NULL,
	`gden_con_id` MEDIUMINT UNSIGNED NOT NULL,
	`gden_whse_keeper_id` SMALLINT UNSIGNED NOT NULL,
    `gden_in_date` DATE NOT NULL,
   PRIMARY KEY (`gden_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
仓库表
编号 仓库名称 归属地
*/
CREATE TABLE IF NOT EXISTS `Warehouse`(
	`whse_id` SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`whse_name` VARCHAR(10) NOT NULL,
	`whse_home` VARCHAR(3) NOT NULL,
   PRIMARY KEY ( `whse_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
合同表
编号 合同号 总金额 资产所属 申购人 采购员 签订日期
*/
CREATE TABLE IF NOT EXISTS `Contract`(
	`con_id` MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`con_no` VARCHAR(20) NOT NULL,
	`con_price` FlOAT(10,3) UNSIGNED NOT NULL,
	`con_belongs` VARCHAR(20) NOT NULL,
	`con_requester_id` SMALLINT UNSIGNED NOT NULL,
	`con_buyer` SMALLINT UNSIGNED NOT NULL,
	`con_date` DATE NOT NULL,
   PRIMARY KEY ( `con_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
人员表
编号 姓名 性别 联系方式
*/
CREATE TABLE IF NOT EXISTS `Staff`(
	`staff_id` SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`staff_name` VARCHAR(4) NOT NULL,
	`staff_gender` VARCHAR(1) NOT NULL,
	`staff_phone` VARCHAR(11) NOT NULL,
   PRIMARY KEY ( `staff_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
领料数量 
编号 原材料编码 出库数量 出库单号
*/
CREATE TABLE IF NOT EXISTS `GetRecordsNum`(
	`getr_num_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`getr_mat_code_id` INT UNSIGNED NOT NULL,
	`getr_num_out_number` SMALLINT UNSIGNED NOT NULL,
	`getr_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `getr_num_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
领料单号 
编号 出库单号 项目代码编号 领料仓库 领料人 库管员
*/
CREATE TABLE IF NOT EXISTS `GetRecords`(
	`getr_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`getr_number` VARCHAR(12) NOT NULL,
	`getr_project_id` INT UNSIGNED NOT NULL,
	`getr_whse_id` SMALLINT UNSIGNED NOT NULL,
	`getr_recipient_id` SMALLINT UNSIGNED NOT NULL,
	`getr_whse_keeper_id` SMALLINT UNSIGNED NOT NULL,
   PRIMARY KEY ( `getr_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
项目表
编号 项目代码 
*/
CREATE TABLE IF NOT EXISTS `Project`(
	`project_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`project_code` VARCHAR(12) NOT NULL,
   PRIMARY KEY ( `project_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
操作日志
编号 操作账号 操作表 操作行 操作时间
*/
CREATE TABLE IF NOT EXISTS `SystemLog`(
	`syslog_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`syslog_table` VARCHAR(16) NOT NULL,
	`syslog_row` INT UNSIGNED NOT NULL,
	`syslog_time` DATE NOT NULL,
   PRIMARY KEY ( `syslog_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*------------------------------ 主外键约束 ----------------------------------------------*/

/*材料列表关联入库单号*/
ALTER TABLE Materials
ADD FOREIGN KEY (mat_gden_id)
REFERENCES GodownEntry(gden_id);

/*材料列表关联原材料编码*/
ALTER TABLE Materials
ADD FOREIGN KEY (mat_code_id)
REFERENCES MaterialsCode(mat_code_id);

/*入库记录关联仓库*/
ALTER TABLE GodownEntry
ADD FOREIGN KEY (gden_whse_id)
REFERENCES Warehouse(whse_id);

/*入库记录关合同*/
ALTER TABLE GodownEntry
ADD FOREIGN KEY (gden_whse_con_id)
REFERENCES Contract(con_id);

/*领料数量关联领料单号*/
ALTER TABLE GetRecordsNum
ADD FOREIGN KEY (getr_id)
REFERENCES GetRecords(getr_id);

/*领料数量关联原材料编码*/
ALTER TABLE GetRecordsNum
ADD FOREIGN KEY (getr_mat_code_id)
REFERENCES MaterialsCode(mat_code_id);

/*领料单号关联人员*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_recipient_id)
REFERENCES Staff(staff_id);

ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_whse_keeper_id)
REFERENCES Staff(staff_id);

/*合同关联人员*/
ALTER TABLE Contract
ADD FOREIGN KEY (con_requester_id)
REFERENCES Staff(staff_id);

ALTER TABLE Contract
ADD FOREIGN KEY (con_buyer)
REFERENCES Staff(staff_id);

/*领料单号关联项目表*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_project_id)
REFERENCES Project(project_id);

/*仓库库存关联原材料表*/
ALTER TABLE Inventory
ADD FOREIGN KEY (invt_code_id)
REFERENCES MaterialsCode(mat_code_id);

ALTER TABLE Inventory
ADD FOREIGN KEY (invt_whse_id)
REFERENCES Warehouse(whse_id);

/*领料单号关联仓库表*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_whse_id)
REFERENCES Warehouse(whse_id);