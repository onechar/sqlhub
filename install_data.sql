use faradaylaser;
INSERT INTO Warehouse(whse_name,whse_home)
                       VALUES
                       ('超净间四号库房','温州'),
                       ('五号教学楼','北京'),
                       ('研发办公室B储物间','温州');
                       
INSERT INTO MaterialsSort(mat_sort_name,mat_sort_pid)
						VALUES
                        ('光学','0'),
                        ('机械','0'),
                        ('电路','0'),
                        ('镜架类','1'),
                        ('镜片类','1'),
                        ('激光管','1'),
                        ('隔离器','1'),
                        ('电光调制器（EOM）','1'),
                        ('小型化机箱','2'),
                        ('小型化原子泡机械部件','2');
                        
                       
INSERT INTO MaterialsCode(mat_code_number,mat_code_name,mat_code_spec,mat_code_models,mat_code_unit,mat_code_brand,mat_code_sort_id,mat_code_notes)
                       VALUES
                       ('129734758','混频器','无','ZFM-2-S+','个','索雷博','3','无'),
                       ('148634723','隔离器','无','IO-5-850-VLP','个','淘宝旗舰店','4','无'),
                       ('109237568','平凹透镜','852 D12.7 f=25.4','无','片','大恒光电','5','无'),
                       ('132807456','平凸透镜','852 D12.7 f=38.1','无','片','超达','6','无'),
                       ('123097534','光卡','无','VRC2','个','北京大学','7','无'),
                       ('121397543','扩束镜1','无','GBE05-B','个','光电','4','无'),
                       ('121397544','扩束镜2','无','BE052-B','个','三明誉洁','4','无'),
                       ('123098234','EOM','无','PM7-NIR-L61301','个','Qubig','5','无');
                       


INSERT INTO Staff(staff_name,staff_gender,staff_phone)
                       VALUES
                       ('陈昆昆','男','0000'),
                       ('吴晗坤','男','0000'),
                       ('王小博','男','0000'),
                       ('柯一睿','男','0000'),
                       ('樊馨丹','女','0000'),
                       ('吴晶','女','0000'),
                       ('黄美秀','男','0000'),
                       ('李琳琳','女','0000'),
                       ('李晓霞','女','0000'),
                       ('金瑶','女','0000'),
                       ('李敦庆','女','0000'),
                       ('李思远','男','0000'),
                       ('周海慧','女','0000'),
                       ('陈景标','男','0000'); 

INSERT INTO Project(project_code)
                       VALUES
                       ('TAIF190824'),
                       ('TAMST19113'),
                       ('TAIF190921'),
                       ('TAIF191012'),
                       ('TAPD190912'),
                       ('TAIF191112');

INSERT INTO Contract(con_no,con_price,con_belongs,con_supplier,con_requester_id,con_buyer,con_date)
                       VALUES
                       ('JAHD190422','7300','法拉第','索雷博光电科技(上海)有限公司','1','6','2019-11-12'),
                       ('HKSKP19042205','4200','法拉第','索雷博光电科技(上海)有限公司','4','6','2019-11-23'),
                       ('QH-190425-33','23000.32','法拉第','青岛森泉光电有限公司','1','6','2019-09-23'),
                       ('RSCE2019012311','6800','中心','青岛森泉光电有限公司','2','6','2019-07-26'),
                       ('XCHY20190423','2100','法拉第','上海紫莓仪器有限公司','4','6','2019-09-18'),
                       ('CHQ135711','126999.23','法拉第','索雷博光电科技(上海)有限公司','1','6','2019-12-25');

INSERT INTO GodownEntry(gden_number,gden_whse_id,gden_con_id,gden_whse_keeper_id,gden_in_date,gden_state)
                       VALUES
                       ('123-972353','1','1','1','2019-06-07','已完结'),
                       ('274-435907','1','2','1','2019-08-12','未完结'),
                       ('384-123895','1','3','1','2019-11-07','未完结'),
                       ('901-237234','3','4','1','2019-12-12','已完结'),
                       ('490-324890','3','5','1','2019-02-18','已完结'),
                       ('923-423490','2','6','1','2019-03-23','已完结'); 


INSERT INTO Materials(mat_gden_id,mat_code_id,mat_purchase,mat_received,mat_con_price,mat_fd_price,mat_notes,mat_in_date,mat_arrive_date)
                       VALUES
                       ('1','1','4','4','4000.3','0','无','2019-11-18','2019-11-17'),
                       ('1','2','2','2','5230','0','无','2019-11-18','2019-11-17'),
                       ('1','1','12','12','12000','10032','无','2019-11-18','2019-11-17'),
                       ('1','1','26','26','430','380','检测出异常等待售后处理','1000-01-01','2019-11-17'),
                       ('1','2','12','0','7694','0','到货一半剩下货物延迟到货','1000-01-01','2019-11-17'),
                       ('1','5','5','5','3200','0','无','2019-11-18','2019-11-17'),
                       ('2','7','6','6','3874','0','无','2019-12-03','2019-12-02'),
                       ('2','6','2','2','12397.23','0','无','2019-12-03','2019-12-02'),
                       ('2','3','0','0','42873','0','延期发货','1000-01-01','1000-01-01'),
                       ('3','4','64','64','28394','0','无','2019-09-28','2019-09-28'),
                       ('3','5','9','9','200','180','无','2019-09-28','2019-09-28'),
                       ('4','5','65','65','7600','0','无','2019-08-05','2019-08-05'),
                       ('4','5','34','65','34000','0','无','2019-08-05','2019-08-05'),
                       ('5','4','53','53','980','0','无','2019-09-23','2019-09-23'),
                       ('5','2','51','51','9000','0','无','2019-09-23','2019-09-23'),
                       ('5','3','20','20','2350','0','无','2019-09-23','2019-09-23'),
                       ('6','1','0','0','120','0','无','1000-01-01','1000-01-01'),
                       ('6','5','0','0','9530','8820','无','1000-01-01','1000-01-01');


INSERT INTO GetRecords(getr_number,getr_project_id,getr_whse_id,getr_recipient_id,getr_whse_keeper_id,getr_out_date)
                       VALUES
                       ('234234-231','2','1','4','1','2019-12-03'),
                       ('752451-523','3','1','4','1','2019-06-23'),
                       ('498234-632','1','1','2','1','2019-08-12'),
                       ('512351-583','2','1','2','1','2019-04-18');

INSERT INTO GetRecordsNum(getr_mat_code_id,getr_num_out_number,getr_id)
                       VALUES
                       ('1','12','1'),
                       ('2','24','1'),
                       ('3','1','1'),
                       ('4','6','1'),
                       ('1','12','2'),
                       ('2','24','2'),
                       ('3','1','2'),
                       ('4','6','2'),
                       ('1','12','1'),
                       ('2','24','1'),
                       ('3','1','3'),
                       ('4','6','3'),
                       ('1','12','4'),
                       ('2','24','4'),
                       ('3','1','4'),
                       ('4','6','4');

INSERT INTO Inventory(invt_code_id,invt_number,invt_whse_id)
                       VALUES
                       ('1','3','1'),
                       ('2','5','1'),
                       ('3','12','1'),
                       ('4','23','1'),
                       ('5','51','1'),
                       ('6','15','1'),
                       ('7','2','1'),
                       ('8','3','1'),
                       ('2','5','3'),
                       ('3','6','3'),
                       ('4','1','3'),
                       ('5','2','3');
