/*
创建数据库
*/
CREATE DATABASE IF NOT EXISTS faradaylaser;
use faradaylaser;
set names utf8;
/*
仓库表
编号 物品名称 规格 型号 所属仓库 数量 单位 申购人 类别 合同编号 供应商 备注 资产所属 入库日期 技术文档
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
	`wh_asset_belongs` VARCHAR(20) NOT NULL
	`wh_indate` DATE NOT NULL,
	`wh_document_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `wh_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
技术文档
文档编号 文档定位 文档描述
*/
CREATE TABLE IF NOT EXISTS `fa_document`
	`dm_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`dm_location` VARCHAR(20) NOT NULL,
	`dm_notes` VARCHAR(30) NOT NULL,
   PRIMARY KEY ( `dm_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
固定资产编号
编号 固定资产编号 固定资产序列
*/
CREATE TABLE IF NOT EXISTS `fa_fixed_assets`
	`fa_fixed_assets_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`fa_fixed_assets_wh_id` INT UNSIGNED NOT NULL,
	`fa_fixed_assets_number` VARCHAR(20) NOT NULL,
   PRIMARY KEY ( `fa_fixed_assets_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*------------------------------ 主外键约束 ----------------------------------------------*/
ALTER TABLE fa_warehouse
ADD FOREIGN KEY (wh_document_id)
REFERENCES fa_document(dm_id);


/*------------------------------ 创建用户 ----------------------------------------------*/
CREATE USER 'xiaoxia'@'localhost' identified by '123';
CREATE USER 'kunkun'@'192.168.0.81' identified by '123';


GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'xiaoxia'@'localhost';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'kunkun'@'192.168.0.81';


ALTER USER 'xiaoxia'@'localhost' IDENTIFIED WITH mysql_native_password BY '193710';
ALTER USER 'kunkun'@'192.168.0.81' IDENTIFIED WITH mysql_native_password BY '697365';

/*------------------------------ 测试数据 ----------------------------------------------*/

INSERT INTO fa_warehouse(wh_name,wh_spec,wh_typ,wh_belonging,wh_number,wh_unit,wh_requisitioner,wh_sort,wh_contract,wh_supplier,wh_notes,wh_indate,wh_document_id)
                       VALUES
                       ('光电探测器','Si AMPLIFIED DETECTOR 320-1000nm','PDA8A/M','超净间库房4号房','2','台','李思远','原材料','4209722221-1','THORLABS','用于510稳频系统安装','法拉第','2019-5-15','1'),
                       ('光学平台','无','GOT1224','超净间库房4号房','1','台','李思远','固定资产','q23997e44567','北京华维浩润仪器有限公司','无','中心','2019-7-07','2'),
                       ('手持频谱仪','无','N9935A','超净间库房4号房','1','台','柯一睿','固定资产','556333332','KEYSIGHT','无','中心','2019-8-12','3');

INSERT INTO fa_document(dm_location,dm_notes)
                       VALUES
                       ('2011230892323','法拉第激光头技术文档'),
                       ('23498660982','光学平台说明书'),
                       ('777784444','手持频谱仪说明书');

INSERT INTO fa_fixed_assets(fa_fixed_assets_wh_id,fa_fixed_assets_number)
                       VALUES
                       ('GZX-LB00001','2'),
                       ('GZX-LB00002','3');