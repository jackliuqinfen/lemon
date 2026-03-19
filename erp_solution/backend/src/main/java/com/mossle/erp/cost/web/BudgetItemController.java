package com.mossle.erp.cost.web;

import com.mossle.erp.common.config.ApiResponse;
import com.mossle.erp.cost.domain.BudgetItem;
import com.mossle.erp.cost.service.BudgetItemService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/api/v2/cost/budget-items")
public class BudgetItemController {

    @Resource
    private BudgetItemService budgetItemService;

    @GetMapping("/project/{projectId}")
    public ApiResponse<List<BudgetItem>> getProjectBudget(@PathVariable("projectId") Long projectId) {
        return ApiResponse.success(budgetItemService.getBudgetItemsByProject(projectId));
    }

    @PostMapping("/{id}/validate-cost")
    public ApiResponse<Boolean> validateIncomingCost(@PathVariable("id") Long id, @RequestParam("amount") BigDecimal amount) {
        boolean isValid = budgetItemService.validateBudget(id, amount);
        if (!isValid) {
            return ApiResponse.error(400, "WARNING: This cost will exceed the target budget. Approval flow required.");
        }
        return ApiResponse.success(true);
    }
}
