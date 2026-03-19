package com.mossle.erp.pm.web;

import com.mossle.erp.common.config.ApiResponse;
import com.mossle.erp.pm.domain.Project;
import com.mossle.erp.pm.service.ProjectService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/v2/pm/projects")
public class ProjectController {

    @Resource
    private ProjectService projectService;

    @GetMapping
    public ApiResponse<List<Project>> listProjects() {
        return ApiResponse.success(projectService.getAllProjects());
    }

    @GetMapping("/{id}")
    public ApiResponse<Project> getProject(@PathVariable("id") Long id) {
        return ApiResponse.success(projectService.getProjectById(id));
    }
}
