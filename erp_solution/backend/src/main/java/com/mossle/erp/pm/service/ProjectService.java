package com.mossle.erp.pm.service;

import com.mossle.erp.pm.domain.Project;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

@Service
public class ProjectService {
    
    // Mock implementation for Phase 1
    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        
        Project p1 = new Project();
        p1.setId(1L);
        p1.setProjectCode("PRJ-2024-001");
        p1.setProjectName("徐州变电站扩建工程");
        p1.setStatus(1); // 施工中
        p1.setStartDate(new Date());
        
        Project p2 = new Project();
        p2.setId(2L);
        p2.setProjectCode("PRJ-2024-002");
        p2.setProjectName("南京高新产业园一期");
        p2.setStatus(0); // 筹备中
        p2.setStartDate(new Date());
        
        projects.add(p1);
        projects.add(p2);
        
        return projects;
    }
    
    public Project getProjectById(Long id) {
        // Mock returning a single project
        Project p = new Project();
        p.setId(id);
        p.setProjectCode("PRJ-2024-001");
        p.setProjectName("徐州变电站扩建工程");
        p.setStatus(1);
        return p;
    }
}
