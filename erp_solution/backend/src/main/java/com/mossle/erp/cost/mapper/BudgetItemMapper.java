package com.mossle.erp.cost.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mossle.erp.cost.domain.BudgetItem;
import org.apache.ibatis.annotations.Mapper;

/**
 * Cost Management Data Access Layer
 */
@Mapper
public interface BudgetItemMapper extends BaseMapper<BudgetItem> {
    // Custom SQL queries for complex CBS aggregations can be added here
}
