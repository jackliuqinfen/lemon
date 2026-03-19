package com.mossle.erp.cost.service;

import com.mossle.erp.cost.domain.BudgetItem;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class BudgetItemService {
    
    public List<BudgetItem> getBudgetItemsByProject(Long projectId) {
        List<BudgetItem> items = new ArrayList<>();
        
        BudgetItem item1 = new BudgetItem();
        item1.setId(101L);
        item1.setProjectId(projectId);
        item1.setItemCode("CBS-01-01");
        item1.setItemName("土方开挖工程");
        item1.setTargetQty(new BigDecimal("5000.00"));
        item1.setTargetPrice(new BigDecimal("45.00"));
        item1.setTargetAmount(new BigDecimal("225000.00"));
        item1.setActualAmount(new BigDecimal("180000.00"));
        
        BudgetItem item2 = new BudgetItem();
        item2.setId(102L);
        item2.setProjectId(projectId);
        item2.setItemCode("CBS-01-02");
        item2.setItemName("C30混凝土浇筑");
        item2.setTargetQty(new BigDecimal("1200.00"));
        item2.setTargetPrice(new BigDecimal("480.00"));
        item2.setTargetAmount(new BigDecimal("576000.00"));
        item2.setActualAmount(new BigDecimal("600000.00")); // Over budget simulation
        
        items.add(item1);
        items.add(item2);
        
        return items;
    }
    
    public boolean validateBudget(Long budgetItemId, BigDecimal incomingCost) {
        // In a real scenario, fetch from DB. Here we mock it.
        BudgetItem mockItem = new BudgetItem();
        mockItem.setTargetAmount(new BigDecimal("500000.00"));
        mockItem.setActualAmount(new BigDecimal("480000.00"));
        
        return !mockItem.isOverBudget(incomingCost);
    }
}
