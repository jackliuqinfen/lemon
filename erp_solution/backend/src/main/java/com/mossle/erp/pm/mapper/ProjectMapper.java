package com.mossle.erp.pm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mossle.erp.pm.domain.Project;
import org.apache.ibatis.annotations.Mapper;

/**
 * PM (Project Management) Data Access Layer
 */
@Mapper
public interface ProjectMapper extends BaseMapper<Project> {
    // Custom SQL queries can be added here if MyBatis-Plus standard methods are not enough
}
