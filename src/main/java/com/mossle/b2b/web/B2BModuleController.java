package com.mossle.b2b.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import javax.annotation.Resource;
import com.mossle.b2b.support.CostProjectService;
import com.mossle.b2b.support.SupervisionProjectService;
import com.mossle.b2b.support.AgencyProjectService;
import com.mossle.b2b.support.MaterialProjectService;
import java.util.List;

/**
 * 通用业务模块路由控制器
 * 解决新增加的 JSP 页面无法通过 Spring MVC 直接访问导致的 404 问题
 */
@Controller
public class B2BModuleController {

    @Resource
    private CostProjectService costProjectService;
    @Resource
    private SupervisionProjectService supervisionProjectService;
    @Resource
    private AgencyProjectService agencyProjectService;
    @Resource
    private MaterialProjectService materialProjectService;

    @RequestMapping("b2b/test")
    @ResponseBody
    public String test() {
        return "B2B Module Controller is working!";
    }
    
    // JSON API for Cost Projects
    @RequestMapping("api/v1/cost/projects")
    @ResponseBody
    public List<?> getCostProjectsApi() {
        return costProjectService.getMockProjects();
    }
    
    // JSON API for Supervision Projects
    @RequestMapping("api/v1/supervision/projects")
    @ResponseBody
    public List<?> getSupervisionProjectsApi() {
        return supervisionProjectService.getMockProjects();
    }

    // JSON API for Agency Projects
    @RequestMapping("api/v1/agency/projects")
    @ResponseBody
    public List<?> getAgencyProjectsApi() {
        return agencyProjectService.getMockProjects();
    }

    // JSON API for Material Projects
    @RequestMapping("api/v1/material/projects")
    @ResponseBody
    public List<?> getMaterialProjectsApi() {
        return materialProjectService.getMockProjects();
    }

    /**
     * 统一处理造价模块视图路由
     * 兼容不带后缀和带 .do 后缀的请求
     */
    @RequestMapping(value = {"cost/{pageName}", "cost/{pageName}.do"})
    public String costRoute(@PathVariable("pageName") String pageName, Model model) {
        String viewName = stripExtension(pageName);
        
        if ("project-list".equals(viewName)) {
            model.addAttribute("projects", costProjectService.getMockProjects());
        }
        
        return "cost/" + viewName;
    }

    /**
     * 统一处理监理模块视图路由
     */
    @RequestMapping(value = {"supervision/{pageName}", "supervision/{pageName}.do"})
    public String supervisionRoute(@PathVariable("pageName") String pageName, Model model) {
        String viewName = stripExtension(pageName);
        
        if ("project-list".equals(viewName)) {
            model.addAttribute("projects", supervisionProjectService.getMockProjects());
        }
        
        return "supervision/" + viewName;
    }
    
    /**
     * 统一处理代理模块视图路由
     */
    @RequestMapping(value = {"agency/{pageName}", "agency/{pageName}.do"})
    public String agencyRoute(@PathVariable("pageName") String pageName, Model model) {
        String viewName = stripExtension(pageName);
        
        if ("project-list".equals(viewName)) {
            model.addAttribute("projects", agencyProjectService.getMockProjects());
        }
        
        return "agency/" + viewName;
    }
    
    /**
     * 统一处理物资模块视图路由
     */
    @RequestMapping(value = {"material/{pageName}", "material/{pageName}.do"})
    public String materialRoute(@PathVariable("pageName") String pageName, Model model) {
        String viewName = stripExtension(pageName);
        
        if ("project-list".equals(viewName)) {
            model.addAttribute("projects", materialProjectService.getMockProjects());
        }
        
        return "material/" + viewName;
    }

    /**
     * 统一处理投标模块视图路由
     */
    @RequestMapping(value = {"bidding/{pageName}", "bidding/{pageName}.do"})
    public String biddingRoute(@PathVariable("pageName") String pageName) {
        return "bidding/" + stripExtension(pageName);
    }

    /**
     * 统一处理证书池模块视图路由
     */
    @RequestMapping(value = {"cert/{pageName}", "cert/{pageName}.do"})
    public String certRoute(@PathVariable("pageName") String pageName) {
        return "cert/" + stripExtension(pageName);
    }
    
    private String stripExtension(String pageName) {
        if (pageName.endsWith(".jsp")) {
            return pageName.substring(0, pageName.length() - 4);
        }
        return pageName;
    }
}