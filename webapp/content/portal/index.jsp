<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "dashboard");%>
<%pageContext.setAttribute("currentMenu", "dashboard");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>工作台 - 腾讯云风格控制台</title>
	<%@include file="/common/s3.jsp"%>
    
    <!-- Using TDesign Theme -->
    <link rel="stylesheet" href="${cdnPrefix}/public/mossle/tdesign/css/lemon-tdesign.css" type="text/css" media="screen" />
    <script>
      $(function() {
        $('body').addClass('tdesign-body');
      });
    </script>
  </head>

  <body class="tdesign-body">
    <div class="td-layout">
        
        <!-- ==========================================
             1. Global Sidebar (Tencent Cloud Console Style)
             ========================================== -->
        <aside class="td-sidebar">
            <div class="td-sidebar-header">
                <a href="${ctx}/portal/index.do" class="td-logo">
                    <img src="https://cloudcache.tencent-cloud.com/qcloud/portal/kit/images/portal-logo.5a75b22.svg" alt="Logo" style="height: 24px;">
                    <span style="color: #fff; font-weight: 500;">工程管理控制台</span>
                </a>
            </div>
            
            <nav class="td-menu">
                <!-- Workspace Group -->
                <div class="td-menu-group-title">工作台</div>
                <a href="${ctx}/portal/index.do" class="td-menu-item active">
                    <i class="glyphicon glyphicon-dashboard"></i> 概览 Dashboard
                </a>
                <a href="${ctx}/humantask/workspace-personalTasks.do" class="td-menu-item">
                    <i class="glyphicon glyphicon-tasks"></i> 待办事项
                    <span class="td-tag td-tag-danger" style="margin-left: auto; padding: 0 6px; font-size: 10px; height: 16px; line-height: 14px;">3</span>
                </a>
                
                <!-- Project Management Group -->
                <div class="td-menu-group-title">项目管理</div>
                <a href="${ctx}/cost/project-list" class="td-menu-item">
                    <i class="glyphicon glyphicon-yen"></i> 造价管理
                </a>
                <a href="${ctx}/supervision/project-list" class="td-menu-item">
                    <i class="glyphicon glyphicon-eye-open"></i> 监理管理
                </a>
                <a href="${ctx}/agency/project-list" class="td-menu-item">
                    <i class="glyphicon glyphicon-transfer"></i> 代理管理
                </a>
                <a href="${ctx}/material/project-list" class="td-menu-item">
                    <i class="glyphicon glyphicon-shopping-cart"></i> 物资管理
                </a>

                <!-- Business Group -->
                <div class="td-menu-group-title">经营与资信</div>
                <a href="${ctx}/bidding/project-list" class="td-menu-item">
                    <i class="glyphicon glyphicon-list-alt"></i> 投标管理
                </a>
                <a href="${ctx}/cert/resource-pool" class="td-menu-item">
                    <i class="glyphicon glyphicon-certificate"></i> 证书资源池
                </a>
                
                <!-- System Group -->
                <div class="td-menu-group-title">系统管理</div>
                <a href="${ctx}/b2b/test" class="td-menu-item" target="_blank">
                    <i class="glyphicon glyphicon-wrench"></i> 调试 (Debug)
                </a>
                <a href="#" class="td-menu-item">
                    <i class="glyphicon glyphicon-user"></i> 用户权限
                </a>
                <a href="${ctx}/system/index.do" class="td-menu-item">
                    <i class="glyphicon glyphicon-cog"></i> 全局配置
                </a>
            </nav>
        </aside>

        <!-- ==========================================
             2. Main Content Wrapper
             ========================================== -->
        <div class="td-main">
            
            <!-- Top Navigation (The Brain) -->
            <header class="td-header">
                <div class="td-header-search">
                    <i class="glyphicon glyphicon-search"></i>
                    <input type="text" placeholder="搜索资源、产品或文档 (Ctrl + /)">
                </div>
                
                <div class="td-header-actions">
                    <button class="td-icon-btn" title="新建"><i class="glyphicon glyphicon-plus"></i></button>
                    <button class="td-icon-btn" title="帮助文档"><i class="glyphicon glyphicon-book"></i></button>
                    <button class="td-icon-btn" title="消息通知"><i class="glyphicon glyphicon-bell"></i></button>
                    <div style="height: 24px; width: 1px; background: #E7E7E7;"></div>
                    <button class="td-icon-btn" title="用户中心"><i class="glyphicon glyphicon-user"></i></button>
                </div>
            </header>

            <!-- Scrollable Content Area -->
            <main class="td-content">
                <!-- Welcome Banner -->
                <div style="margin-bottom: 24px;">
                    <h2 style="font-size: 20px; font-weight: 500; margin-bottom: 8px;">你好，<tags:currentUser/></h2>
                    <p style="color: var(--td-text-color-secondary); font-size: 14px;">欢迎回到腾讯云风格工程管理控制台。今日有 <span style="color: var(--td-brand-color); font-weight: 600;">3</span> 项紧急审批待处理。</p>
                </div>

                <!-- KPI Cards Row -->
                <div class="row" style="margin-bottom: 24px;">
                    <div class="col-md-3">
                        <div class="td-card" style="padding: 20px; display: flex; align-items: center; justify-content: space-between;">
                            <div>
                                <div style="color: var(--td-text-color-secondary); font-size: 12px; margin-bottom: 4px;">待审核任务</div>
                                <div style="font-size: 24px; font-weight: 600; color: var(--td-text-color-primary);">12</div>
                            </div>
                            <div style="width: 40px; height: 40px; background: #E6F0FF; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--td-brand-color);">
                                <i class="glyphicon glyphicon-inbox" style="font-size: 20px;"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="td-card" style="padding: 20px; display: flex; align-items: center; justify-content: space-between;">
                            <div>
                                <div style="color: var(--td-text-color-secondary); font-size: 12px; margin-bottom: 4px;">进行中项目 (造价)</div>
                                <div style="font-size: 24px; font-weight: 600; color: var(--td-text-color-primary);">8</div>
                            </div>
                            <div style="width: 40px; height: 40px; background: #E3F9E9; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--td-success-color);">
                                <i class="glyphicon glyphicon-yen" style="font-size: 20px;"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="td-card" style="padding: 20px; display: flex; align-items: center; justify-content: space-between;">
                            <div>
                                <div style="color: var(--td-text-color-secondary); font-size: 12px; margin-bottom: 4px;">本月产值 (万元)</div>
                                <div style="font-size: 24px; font-weight: 600; color: var(--td-text-color-primary);">450.5</div>
                            </div>
                            <div style="width: 40px; height: 40px; background: #FFF3E8; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--td-warning-color);">
                                <i class="glyphicon glyphicon-stats" style="font-size: 20px;"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="td-card" style="padding: 20px; display: flex; align-items: center; justify-content: space-between;">
                            <div>
                                <div style="color: var(--td-text-color-secondary); font-size: 12px; margin-bottom: 4px;">证书占用率</div>
                                <div style="font-size: 24px; font-weight: 600; color: var(--td-text-color-primary);">85%</div>
                            </div>
                            <div style="width: 40px; height: 40px; background: #F2F3F5; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--td-text-color-secondary);">
                                <i class="glyphicon glyphicon-certificate" style="font-size: 20px;"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Dashboard Content -->
                <div class="row">
                    <!-- Left: Task Table -->
                    <div class="col-md-8">
                        <div class="td-card">
                            <div class="td-card-header">
                                <div class="td-card-title">待办任务列表</div>
                                <div>
                                    <button class="btn btn-default btn-sm">刷新</button>
                                    <button class="btn btn-primary btn-sm">查看全部</button>
                                </div>
                            </div>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>任务编号</th>
                                        <th>任务名称</th>
                                        <th>类型</th>
                                        <th>提交时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${personalTasks.result}" var="item">
                                    <tr>
                                        <td><span style="font-family: monospace;">#${item.id}</span></td>
                                        <td>${item.name}</td>
                                        <td><span class="td-tag td-tag-warning">审批</span></td>
                                        <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                                        <td><a href="#" style="font-size: 12px;">处理</a></td>
                                    </tr>
                                    </c:forEach>
                                    <!-- Fallback Data -->
                                    <c:if test="${empty personalTasks.result}">
                                    <tr>
                                        <td><span style="font-family: monospace;">#T-2024001</span></td>
                                        <td>徐州变电站造价预结算报告审核</td>
                                        <td><span class="td-tag td-tag-warning">造价审核</span></td>
                                        <td>2024-03-18 10:30</td>
                                        <td><a href="#" style="font-size: 12px;">立即处理</a></td>
                                    </tr>
                                    <tr>
                                        <td><span style="font-family: monospace;">#T-2024002</span></td>
                                        <td>高压线塔监理合同及资质准入</td>
                                        <td><span class="td-tag td-tag-primary">合同审批</span></td>
                                        <td>2024-03-18 11:15</td>
                                        <td><a href="#" style="font-size: 12px;">立即处理</a></td>
                                    </tr>
                                    <tr>
                                        <td><span style="font-family: monospace;">#T-2024003</span></td>
                                        <td>物资采购申请单-P202405</td>
                                        <td><span class="td-tag td-tag-default">物资采购</span></td>
                                        <td>2024-03-17 16:45</td>
                                        <td><a href="#" style="font-size: 12px;">立即处理</a></td>
                                    </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Right: Quick Access & Notice -->
                    <div class="col-md-4">
                        <div class="td-card">
                            <div class="td-card-header">
                                <div class="td-card-title">快捷导航</div>
                            </div>
                            <div class="row">
                                <div class="col-xs-4" style="text-align: center; margin-bottom: 16px;">
                                    <div style="width: 48px; height: 48px; background: #F2F3F5; border-radius: 8px; margin: 0 auto 8px; display: flex; align-items: center; justify-content: center; cursor: pointer;">
                                        <i class="glyphicon glyphicon-plus" style="color: var(--td-text-color-primary);"></i>
                                    </div>
                                    <div style="font-size: 12px;">新建项目</div>
                                </div>
                                <div class="col-xs-4" style="text-align: center; margin-bottom: 16px;">
                                    <div style="width: 48px; height: 48px; background: #F2F3F5; border-radius: 8px; margin: 0 auto 8px; display: flex; align-items: center; justify-content: center; cursor: pointer;">
                                        <i class="glyphicon glyphicon-file" style="color: var(--td-text-color-primary);"></i>
                                    </div>
                                    <div style="font-size: 12px;">发起报销</div>
                                </div>
                                <div class="col-xs-4" style="text-align: center; margin-bottom: 16px;">
                                    <div style="width: 48px; height: 48px; background: #F2F3F5; border-radius: 8px; margin: 0 auto 8px; display: flex; align-items: center; justify-content: center; cursor: pointer;">
                                        <i class="glyphicon glyphicon-search" style="color: var(--td-text-color-primary);"></i>
                                    </div>
                                    <div style="font-size: 12px;">证书查询</div>
                                </div>
                            </div>
                        </div>

                        <div class="td-card">
                            <div class="td-card-header">
                                <div class="td-card-title">系统公告</div>
                                <a href="#" style="font-size: 12px;">更多</a>
                            </div>
                            <ul style="padding-left: 0; list-style: none; margin: 0;">
                                <li style="padding: 8px 0; border-bottom: 1px dashed var(--td-border-level-1-color); display: flex; justify-content: space-between;">
                                    <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 200px;">2024第一季度系统维护通知</span>
                                    <span style="color: var(--td-text-color-placeholder); font-size: 12px;">03-15</span>
                                </li>
                                <li style="padding: 8px 0; border-bottom: 1px dashed var(--td-border-level-1-color); display: flex; justify-content: space-between;">
                                    <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 200px;">关于造价审核流程优化的说明</span>
                                    <span style="color: var(--td-text-color-placeholder); font-size: 12px;">03-10</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
  </body>
</html>
