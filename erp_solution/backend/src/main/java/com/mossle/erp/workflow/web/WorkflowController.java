package com.mossle.erp.workflow.web;

import com.mossle.erp.common.config.ApiResponse;
import com.mossle.erp.workflow.service.ApprovalFlowService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Map;

@RestController
@RequestMapping("/api/v2/workflow")
public class WorkflowController {

    @Resource
    private ApprovalFlowService approvalFlowService;

    @PostMapping("/start-overbudget-approval")
    public ApiResponse<String> startApproval(
            @RequestParam("poId") Long poId, 
            @RequestParam("overrunAmount") BigDecimal overrunAmount) {
        
        // Assuming user ID is fetched from Security Context
        String currentUserId = "USER-001"; 
        
        String processId = approvalFlowService.startMaterialOverBudgetFlow(poId, overrunAmount, currentUserId);
        return ApiResponse.success(processId);
    }

    @PostMapping("/tasks/{taskId}/complete")
    public ApiResponse<Boolean> completeTask(
            @PathVariable("taskId") String taskId,
            @RequestBody Map<String, Object> payload) {
        
        boolean approved = (Boolean) payload.getOrDefault("approved", false);
        String comments = (String) payload.getOrDefault("comments", "");
        
        approvalFlowService.completeTask(taskId, approved, comments);
        return ApiResponse.success(true);
    }
}
