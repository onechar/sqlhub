/*
创建数据库
*/
CREATE DATABASE IF NOT EXISTS faradaylaser;
use faradaylaser;
set names utf8;

#  ------------------------------------------------------------------------------  采购模块
/*
采购项目
编号 采购单号 立项时间 资产所属 申请人 采购员
*/
CREATE TABLE IF NOT EXISTS `ProcProject`(
	`proc_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`proc_number` VARCHAR(20) NOT NULL,
	`proc_build_date` DATE NOT NULL,
	`proc_belongs_id` TINYINT UNSIGNED NOT NULL,
	`proc_requester_id` SMALLINT UNSIGNED NOT NULL,
	`proc_buyer` SMALLINT UNSIGNED NOT NULL,
   PRIMARY KEY ( `proc_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
资产所属
编号 所属公司 
*/
CREATE TABLE IF NOT EXISTS `Belongs`(
	`belongs_id` TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`belongs_name` VARCHAR(20) NOT NULL,
   PRIMARY KEY ( `belongs_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
供应商
编号 供应商名称
*/
CREATE TABLE IF NOT EXISTS `Supplier`(
	`spl_id` MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`spl_name` VARCHAR(18) NOT NULL,
   PRIMARY KEY ( `spl_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
售后表单
编号 售后单号 立项时间 所属采购物品
*/
CREATE TABLE IF NOT EXISTS `AgainForm`(
	`af_id` MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`af_number` VARCHAR(18) NOT NULL,
    `af_date` DATE NOT NULL,
    `af_number` VARCHAR(18) NOT NULL,
   PRIMARY KEY ( `af_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



#  ------------------------------------------------------------------------------  原材料信息模块

/*
原材料编码
编号 原材料编号 物品名称 规格 型号 品牌 单位 类别 备注
*/
CREATE TABLE IF NOT EXISTS `MaterialsCode`(
	`mat_code_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`mat_code_number` VARCHAR(12) NOT NULL,
	`mat_code_name` VARCHAR(15) NOT NULL,
	`mat_code_spec` VARCHAR(20) NOT NULL,
	`mat_code_model` VARCHAR(20) NOT NULL,
	`mat_code_brand` VARCHAR(10) NOT NULL,
	`mat_code_unit` VARCHAR(4) NOT NULL,
	`mat_code_sort_id` SMALLINT UNSIGNED NOT NULL,
	`mat_code_notes` VARCHAR(30) NOT NULL,
   PRIMARY KEY (`mat_code_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
原材料类别
*/
CREATE TABLE IF NOT EXISTS `MaterialsSort`(
	`mat_sort_id` SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    `mat_sort_name` VARCHAR(12) NOT NULL,
    `mat_sort_pid` SMALLINT UNSIGNED NOT NULL,
   PRIMARY KEY (`mat_sort_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#  ------------------------------------------------------------------------------  库存记录

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
入库物品信息
编号 所属入库单号 备注 到货日期 所属物品
*/
CREATE TABLE IF NOT EXISTS `GodownItems`(
	`gdit_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`gdit_number` INT UNSIGNED NOT NULL,
	`gdit_notes` SMALLINT UNSIGNED NOT NULL,
	`gdit_arrival_time` SMALLINT UNSIGNED NOT NULL,
    `gdit_mat_id` SMALLINT UNSIGNED NOT NULL,
   PRIMARY KEY (`gdit_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
入库记录
编号 入库单号 所属仓库 所属合同 库管员 单号日期 状态
*/
CREATE TABLE IF NOT EXISTS `GodownEntry`(
	`gden_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`gden_number` VARCHAR(12) NOT NULL,
	`gden_whse_id` SMALLINT UNSIGNED NOT NULL,
	`gden_con_id` MEDIUMINT UNSIGNED NOT NULL,
	`gden_whse_keeper_id` SMALLINT UNSIGNED NOT NULL,
    `gden_in_date` DATE NOT NULL,
    `gden_state` varchar(4) NOT NULL,
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
编号 出库单号 项目代码编号 领料仓库 领料人 库管员 类别 领料日期
*/
CREATE TABLE IF NOT EXISTS `GetRecords`(
	`getr_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`getr_number` VARCHAR(12) NOT NULL,
	`getr_project_id` INT UNSIGNED NOT NULL,
	`getr_whse_id` SMALLINT UNSIGNED NOT NULL,
	`getr_recipient_id` SMALLINT UNSIGNED NOT NULL,
	`getr_whse_keeper_id` SMALLINT UNSIGNED NOT NULL,
    `getr_sort` VARCHAR(5) NOT NULL,
    `getr_out_date` DATE NOT NULL,
   PRIMARY KEY ( `getr_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;




#  ------------------------------------------------------------------------------  产品模块

/*
产品项目表
编号 项目代码 立项时间 完结时间
*/
CREATE TABLE IF NOT EXISTS `ProdProject`(
	`prod_proj_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`prod_proj_number` VARCHAR(12) NOT NULL,
    `prod_proj_begin_date` DATE,
    `prod_proj_end_date` DATE,
   PRIMARY KEY ( `project_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
产品表
编号 产品名称 产品型号 库存数量
*/
CREATE TABLE IF NOT EXISTS `Product`(
	`prod_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `prod_name` VARCHAR(12) NOT NULL,
	`prod_model` VARCHAR(15) NOT NULL,
    `prod_invt_number` SMALLINT NOT NULL,
   PRIMARY KEY ( `prod_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#  ------------------------------------------------------------------------------  库存物品信息
/*
物品状态表
编号 状态
*/
CREATE TABLE IF NOT EXISTS `ItemState`(
	`item_state_id` TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
	`item_state_name` VARCHAR(12) NOT NULL,
   PRIMARY KEY ( `item_state_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
原材料设备
编号 序列号 所属物品
*/
CREATE TABLE IF NOT EXISTS `MaterialEqpt`(
	`mat_eqpt_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`mat_eqpt_serial` VARCHAR(20) NOT NULL,
    `mat_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `mat_eqpt_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
原材料物品
编号 原材料编码 数量 单价 状态 备注 所属订单
*/
CREATE TABLE IF NOT EXISTS `Material`(
	`mat_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`mat_number` VARCHAR(18) NOT NULL,
    `mat_quantity` SMALLINT NOT NULL,
    `mat_price` FLOAT NOT NULL,
    `mat_state_id` TINYINT UNSIGNED NOT NULL,
    `mat_notes` VARCHAR(20) NOT NULL,
    `mat_item_id` INT NOT NULL,
   PRIMARY KEY ( `mat_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
原材料订单
编号 供应商 购买时间 所属采购项目
*/
CREATE TABLE IF NOT EXISTS `MaterialForm`(
	`mat_form_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`mat_form_supplier` VARCHAR(20) NOT NULL,
    `mat_form_buy_date` DATE NOT NULL,
    `mat_form_proc_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `mat_form_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
实验室耗材表
编号 物品名称 规格型号 数量 单位 状态 供应商 单价 所属采购项目
*/
CREATE TABLE IF NOT EXISTS `LabConsumable`(
	`lab_csb_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`lab_csb_name` VARCHAR(8) AUTO_INCREMENT NOT NULL,
	`lab_csb_model` VARCHAR(20) NOT NULL,
    `lab_csb_number` SMALLINT NOT NULL,
    `lab_csb_unit` VARCHAR(4) NOT NULL,
    `lab_csb_state_id` TINYINT UNSIGNED NOT NULL,
    `lab_csb_supplier` VARCHAR(20) NOT NULL,
    `lab_csb_price` FLOAT NOT NULL,
    `lab_csb_proc_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `lab_csb_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
实验室工具表
编号 物品名称 规格型号 数量 单位 状态 供应商 单价 所属采购项目
*/
CREATE TABLE IF NOT EXISTS `LabTool`(
	`lab_tool_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`lab_tool_name` VARCHAR(8) AUTO_INCREMENT NOT NULL,
	`lab_tool_model` VARCHAR(20) NOT NULL,
    `lab_tool_number` SMALLINT NOT NULL,
    `lab_tool_unit` VARCHAR(4) NOT NULL,
    `lab_tool_state_id` TINYINT UNSIGNED NOT NULL,
    `lab_tool_supplier` VARCHAR(20) NOT NULL,
    `lab_tool_price` FLOAT NOT NULL,
    `lab_tool_proc_id` INT UNSIGNED NOT NULL,
   PRIMARY KEY ( `lab_tool_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
合同表
编号 合同号 总金额 供应商 申购人 采购员 签订日期
*/
CREATE TABLE IF NOT EXISTS `ContractForm`(
	`con_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`con_no` VARCHAR(20) NOT NULL,
	`con_price` FlOAT(10,3) UNSIGNED NOT NULL,
    `con_supplier_id` MEDIUMINT UNSIGNED NOT NULL,
	`con_requester_id` SMALLINT UNSIGNED NOT NULL,
	`con_buyer` SMALLINT UNSIGNED NOT NULL,
	`con_date` DATE NOT NULL,
   PRIMARY KEY ( `con_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



#  ------------------------------------------------------------------------------  其他信息


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



/*------------------------------ 主外键约束 ----------------------------------------------*/

/*采购项目关联资产所属*/
ALTER TABLE ProcProject
ADD FOREIGN KEY (proc_belongs_id)
REFERENCES Belongs(belongs_id);

/*采购项目关联申请人*/
ALTER TABLE ProcProject
ADD FOREIGN KEY (proc_requester_id)
REFERENCES Staff(staff_id);

/*售后表单关联原材料物品*/
ALTER TABLE Inventory
ADD FOREIGN KEY (invt_whse_id)
REFERENCES Warehouse(whse_id);

/*售后表单关联原材料物品*/
ALTER TABLE ProcProject
ADD FOREIGN KEY (proc_buyer)
REFERENCES Material(mat_id);

/*售后表单关联原材料物品*/
ALTER TABLE MaterialsCode
ADD FOREIGN KEY (mat_code_sort_id)
REFERENCES MaterialsSort(mat_sort_id);

/*采购项目关联采购员*/
ALTER TABLE ProcProject
ADD FOREIGN KEY (proc_buyer)
REFERENCES Staff(staff_id);

/*合同表关联人员表*/
ALTER TABLE ContractForm
ADD FOREIGN KEY (con_requester_id)
REFERENCES Staff(staff_id);

/*合同表关联人员表*/
ALTER TABLE ContractForm
ADD FOREIGN KEY (con_buyer)
REFERENCES Staff(staff_id);

/*合同表关联供应商*/
ALTER TABLE ContractForm
ADD FOREIGN KEY (con_supplier_id)
REFERENCES Supplier(spl_id);

/*领料数量关联项目代码*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_project_id)
REFERENCES ProdProject(prod_proj_id);

/*领料数量关联仓库*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_whse_id)
REFERENCES Warehouse(whse_id);

/*领料数量关联人员*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_recipient_id)
REFERENCES Staff(staff_id);

/*领料数量关联人员*/
ALTER TABLE GetRecords
ADD FOREIGN KEY (getr_whse_keeper_id)
REFERENCES Staff(staff_id);

/*领料数量关联原材料编码*/
ALTER TABLE GetRecordsNum
ADD FOREIGN KEY (getr_mat_code_id)
REFERENCES MaterialsCode(mat_code_id);

/*领料数量关联出库单号*/
ALTER TABLE GetRecordsNum
ADD FOREIGN KEY (getr_id)
REFERENCES GetRecords(getr_id);


/*入库记录关联仓库*/
ALTER TABLE GodownEntry
ADD FOREIGN KEY (gden_whse_id)
REFERENCES Warehouse(whse_id);

/*入库记录关联人员*/
ALTER TABLE GodownEntry
ADD FOREIGN KEY (gden_whse_keeper_id)
REFERENCES Staff(staff_id);

/*售后表单关联原材料物品*/
ALTER TABLE GodownItems
ADD FOREIGN KEY (gdit_mat_id)
REFERENCES Material(mat_id);

/*原材料订单关联采购项目*/
ALTER TABLE LabTool
ADD FOREIGN KEY (lab_tool_proc_id)
REFERENCES ProcProject(proc_id);

/*原材料物品关联状态*/
ALTER TABLE LabConsumable
ADD FOREIGN KEY (lab_tool_state_id)
REFERENCES ItemState(lab_tool_state);

/*原材料订单关联采购项目*/
ALTER TABLE LabConsumable
ADD FOREIGN KEY (lab_csb_proc_id)
REFERENCES ProcProject(proc_id);

/*原材料物品关联状态*/
ALTER TABLE LabConsumable
ADD FOREIGN KEY (lab_csb_state_id)
REFERENCES ItemState(item_state_id);

/*原材料订单关联采购项目*/
ALTER TABLE MaterialForm
ADD FOREIGN KEY (mat_form_proc_id)
REFERENCES ProcProject(proc_id);

/*原材料物品关联状态*/
ALTER TABLE Material
ADD FOREIGN KEY (mat_state_id)
REFERENCES ItemState(item_state_id);

/*原材料设备关联原材料物品*/
ALTER TABLE MaterialEqpt
ADD FOREIGN KEY (mat_id)
REFERENCES Material(mat_id);
