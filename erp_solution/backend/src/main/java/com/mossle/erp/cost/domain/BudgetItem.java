package com.mossle.erp.cost.domain;

import java.math.BigDecimal;

/**
 * Cost Domain Model: CBS (Cost Breakdown Structure) Budget Item
 */
public class BudgetItem {
    private Long id;
    private Long projectId;
    private Long parentId;
    private String itemCode;
    private String itemName;
    private BigDecimal targetQty;
    private BigDecimal targetPrice;
    private BigDecimal targetAmount;
    private BigDecimal actualAmount;

    // Business Logic: Check for budget overrun
    public boolean isOverBudget(BigDecimal incomingCost) {
        if (actualAmount == null) actualAmount = BigDecimal.ZERO;
        return actualAmount.add(incomingCost).compareTo(targetAmount) > 0;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getProjectId() { return projectId; }
    public void setProjectId(Long projectId) { this.projectId = projectId; }
    public Long getParentId() { return parentId; }
    public void setParentId(Long parentId) { this.parentId = parentId; }
    public String getItemCode() { return itemCode; }
    public void setItemCode(String itemCode) { this.itemCode = itemCode; }
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    public BigDecimal getTargetQty() { return targetQty; }
    public void setTargetQty(BigDecimal targetQty) { this.targetQty = targetQty; }
    public BigDecimal getTargetPrice() { return targetPrice; }
    public void setTargetPrice(BigDecimal targetPrice) { this.targetPrice = targetPrice; }
    public BigDecimal getTargetAmount() { return targetAmount; }
    public void setTargetAmount(BigDecimal targetAmount) { this.targetAmount = targetAmount; }
    public BigDecimal getActualAmount() { return actualAmount; }
    public void setActualAmount(BigDecimal actualAmount) { this.actualAmount = actualAmount; }
}
