package com.mossle.erp.pm.domain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * PM (Project Management) Domain Model
 */
public class Project {
    private Long id;
    private String projectCode;
    private String projectName;
    private Integer status; // 0-筹备, 1-施工, 2-竣工, 3-结算
    private Long managerId;
    private Date startDate;
    private Date endDate;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getProjectCode() { return projectCode; }
    public void setProjectCode(String projectCode) { this.projectCode = projectCode; }
    
    public String getProjectName() { return projectName; }
    public void setProjectName(String projectName) { this.projectName = projectName; }
    
    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }
    
    public Long getManagerId() { return managerId; }
    public void setManagerId(Long managerId) { this.managerId = managerId; }
    
    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    
    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
}
