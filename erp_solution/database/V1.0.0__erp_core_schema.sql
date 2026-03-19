-- 1. 项目管理 (PM)
CREATE TABLE `pm_project` (
  `id` bigint(20) NOT NULL COMMENT '项目ID',
  `project_code` varchar(50) NOT NULL COMMENT '项目编码',
  `project_name` varchar(200) NOT NULL COMMENT '项目名称',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态: 0-筹备, 1-施工, 2-竣工, 3-结算',
  `manager_id` bigint(20) DEFAULT NULL COMMENT '项目经理ID',
  `start_date` date DEFAULT NULL COMMENT '计划开工日期',
  `end_date` date DEFAULT NULL COMMENT '计划竣工日期',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_project_code` (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='项目主表';

-- 2. 合同管理 (CM)
CREATE TABLE `cm_contract` (
  `id` bigint(20) NOT NULL COMMENT '合同ID',
  `project_id` bigint(20) NOT NULL COMMENT '所属项目ID',
  `contract_code` varchar(50) NOT NULL COMMENT '合同编号',
  `contract_name` varchar(200) NOT NULL COMMENT '合同名称',
  `type` tinyint(4) NOT NULL COMMENT '类型: 1-总包, 2-分包, 3-采购',
  `amount` decimal(15,2) NOT NULL COMMENT '合同金额',
  `party_a` varchar(100) NOT NULL COMMENT '甲方',
  `party_b` varchar(100) NOT NULL COMMENT '乙方',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态: 0-起草, 1-审批中, 2-已生效',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='合同主表';

-- 3. 成本管控 (Cost)
CREATE TABLE `cost_budget_item` (
  `id` bigint(20) NOT NULL COMMENT '预算项ID',
  `project_id` bigint(20) NOT NULL COMMENT '所属项目ID',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父级ID(CBS树)',
  `item_code` varchar(50) NOT NULL COMMENT '科目编码',
  `item_name` varchar(100) NOT NULL COMMENT '科目名称',
  `target_qty` decimal(15,4) DEFAULT NULL COMMENT '目标工程量',
  `target_price` decimal(15,2) DEFAULT NULL COMMENT '目标单价',
  `target_amount` decimal(15,2) NOT NULL COMMENT '目标总价',
  `actual_amount` decimal(15,2) DEFAULT '0.00' COMMENT '已发生金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成本预算科目表(CBS)';

-- 4. 物资设备 (SCM)
CREATE TABLE `scm_material_stock` (
  `id` bigint(20) NOT NULL COMMENT '库存ID',
  `project_id` bigint(20) NOT NULL COMMENT '所属项目',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `sku_code` varchar(50) NOT NULL COMMENT '物料编码',
  `sku_name` varchar(100) NOT NULL COMMENT '物料名称',
  `unit` varchar(20) NOT NULL COMMENT '单位',
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '当前库存量',
  `avg_price` decimal(15,2) DEFAULT NULL COMMENT '加权平均价',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_project_wh_sku` (`project_id`,`warehouse_id`,`sku_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物资库存明细表';
