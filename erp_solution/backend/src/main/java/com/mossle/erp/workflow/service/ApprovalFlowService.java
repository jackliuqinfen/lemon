package com.mossle.erp.workflow.service;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ApprovalFlowService {

    // Note: Mocking Flowable Engine dependencies for scaffolding
    // In actual Spring Boot context, these are auto-wired by flowable-spring-boot-starter
    // @Resource
    // private RuntimeService runtimeService;
    // @Resource
    // private TaskService taskService;

    /**
     * Start the material over-budget approval process
     * @param poId Purchase Order ID
     * @param overrunAmount Amount exceeding the CBS budget
     * @param initiator User ID who initiated the PO
     */
    public String startMaterialOverBudgetFlow(Long poId, BigDecimal overrunAmount, String initiator) {
        System.out.println("Starting BPMN Process [material_over_budget_approval] for PO: " + poId);
        
        Map<String, Object> variables = new HashMap<>();
        variables.put("poId", poId);
        variables.put("overrunAmount", overrunAmount);
        variables.put("initiator", initiator);
        
        // Mocking Process Instance Start
        // ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("material_over_budget_approval", variables);
        // return processInstance.getId();
        
        return "mock-process-instance-id-999";
    }

    /**
     * Complete a user task
     */
    public void completeTask(String taskId, boolean approved, String comments) {
        System.out.println("Completing Task [" + taskId + "] - Approved: " + approved);
        Map<String, Object> variables = new HashMap<>();
        variables.put("approved", approved);
        variables.put("comments", comments);
        
        // taskService.complete(taskId, variables);
    }
}
