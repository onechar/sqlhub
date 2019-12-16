/*
创建浙江法拉第激光科技有限公司数据库
*/
CREATE DATABASE IF NOT EXISTS faradaylaser;
use faradaylaser;
set names utf8;
/*
编号 物品名称 规格 型号 所属仓库 数量 单位 申购人 类别 合同编号 供应商 备注 入库日期 技术文档
*/
CREATE TABLE IF NOT EXISTS `fa_warehouse`(
	`wh_id` INT UNSIGNED AUTO_INCREMENT NOT NULL
	`wh_name` VARCHAR(8) NOT NULL,
	`wh_spec` VARCHAR(20) NOT NULL,
	`wh_typ` VARCHAR(20) NOT NULL,
	`wh_belonging` VARCHAR(8) NOT NULL,
	`wh_number` INT UNSIGNED NOT NULL,
	`wh_unit` VARCHAR(3) NOT NULL,
	`wh_requisitioner` VARCHAR(5) NOT NULL,
	`wh_sort` VARCHAR(8) NOT NULL,
	`wh_contract` VARCHAR(20) NOT NULL,
	`wh_supplier` VARCHAR(20) NOT NULL,
	`wh_notes` VARCHAR(20) NOT NULL,
	`wh_indate` DATE NOT NULL,
	`wh_document_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `wh_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
文档编号 文档定位 文档描述
*/
CREATE TABLE IF NOT EXISTS `fa_document`
	`dm_id` INT UNSIGNED AUTO_INCREMENT NOT NULL
	`dm_location` VARCHAR(20) NOT NULL
	`dm_notes` VARCHAR(30) NOT NULL
   PRIMARY KEY ( `dm_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE fa_warehouse
ADD FOREIGN KEY (wh_document_id)
REFERENCES fa_document(dm_id);

CREATE USER 'xiaoxia'@'localhost' identified by '123';
CREATE USER 'kunkun'@'192.168.0.81' identified by '123';

GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'xiaoxia'@'localhost';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'kunkun'@'192.168.0.81';

ALTER USER 'xiaoxia'@'localhost' IDENTIFIED WITH mysql_native_password BY '193710';
ALTER USER 'kunkun'@'192.168.0.81' IDENTIFIED WITH mysql_native_password BY '697365';