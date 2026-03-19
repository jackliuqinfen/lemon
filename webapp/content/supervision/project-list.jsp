<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>监理管理 - 腾讯云风格控制台</title>
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
                <a href="${ctx}/portal/index.do" class="td-menu-item">
                    <i class="glyphicon glyphicon-dashboard"></i> 概览 Dashboard
                </a>
                <a href="${ctx}/humantask/workspace-personalTasks.do" class="td-menu-item">
                    <i class="glyphicon glyphicon-tasks"></i> 待办事项
                    <span class="td-tag td-tag-danger" style="margin-left: auto; padding: 0 6px; font-size: 10px; height: 16px; line-height: 14px;">3</span>
                </a>
                
                <!-- Project Management Group -->
                <div class="td-menu-group-title">项目管理</div>
                <a href="${ctx}/cost/project-list.jsp" class="td-menu-item">
                    <i class="glyphicon glyphicon-yen"></i> 造价管理
                </a>
                <a href="${ctx}/supervision/project-list.jsp" class="td-menu-item active">
                    <i class="glyphicon glyphicon-eye-open"></i> 监理管理
                </a>
            </nav>
        </aside>

        <div class="td-main">
            <header class="td-header">
                <div class="td-header-search">
                    <i class="glyphicon glyphicon-search"></i>
                    <input type="text" placeholder="搜索监理项目 (Ctrl + /)">
                </div>
                <div class="td-header-actions">
                    <button class="td-icon-btn" title="新建"><i class="glyphicon glyphicon-plus"></i></button>
                    <button class="td-icon-btn" title="消息通知"><i class="glyphicon glyphicon-bell"></i></button>
                    <button class="td-icon-btn" title="用户中心"><i class="glyphicon glyphicon-user"></i></button>
                </div>
            </header>

            <main class="td-content">
                <!-- Page Header -->
                <div style="margin-bottom: 24px; display: flex; justify-content: space-between; align-items: center;">
                    <div>
                        <h2 style="font-size: 20px; font-weight: 500; margin-bottom: 8px;">监理项目列表</h2>
                        <p style="color: var(--td-text-color-secondary); font-size: 14px; margin: 0;">管理现场监理、安全检查与进度控制</p>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-default active"><i class="glyphicon glyphicon-th-large"></i> 卡片</button>
                        <button class="btn btn-default"><i class="glyphicon glyphicon-list"></i> 列表</button>
                    </div>
                </div>

                <div class="row">
                    <c:forEach items="${projects}" var="item">
                    <!-- Supervision Project Card -->
                    <div class="col-md-4">
                        <div class="td-card" style="padding: 24px; position: relative;">
                            <span class="td-tag td-tag-${item.statusType}" style="position: absolute; top: 24px; right: 24px;">${item.status}</span>
                            <div style="font-size: 16px; font-weight: 600; color: var(--td-text-color-primary); margin-bottom: 8px; padding-right: 60px;">${item.name}</div>
                            <div style="font-size: 12px; color: var(--td-text-color-secondary); margin-bottom: 16px; display: flex; gap: 16px;">
                                <span><i class="glyphicon glyphicon-map-marker"></i> ${item.location}</span>
                                <span><i class="glyphicon glyphicon-user"></i> 总监: ${item.director}</span>
                            </div>
                            
                            <div style="background: #F9F9F9; padding: 12px; border-radius: 4px; margin-bottom: 16px;">
                                <div style="display: flex; justify-content: space-between; margin-bottom: 4px; font-size: 12px;">
                                    <span style="color: var(--td-text-color-secondary);">现场安全评分</span>
                                    <span style="color: var(--td-${item.safetyScoreType}-color); font-weight: 600;">${item.safetyScore}分</span>
                                </div>
                                <div class="progress" style="height: 6px; margin-bottom: 0;">
                                    <div class="progress-bar progress-bar-${item.safetyScoreType}" style="width: ${item.safetyScore}%; background-color: var(--td-${item.safetyScoreType}-color);"></div>
                                </div>
                            </div>
                            
                            <div style="display: flex; gap: 8px;">
                                <button class="btn btn-default btn-sm" style="flex: 1;">监理日志</button>
                                <button class="btn btn-default btn-sm" style="flex: 1;">旁站记录</button>
                                <button class="btn btn-primary btn-sm" style="flex: 1;">进入项目</button>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </main>
        </div>
    </div>
  </body>
</html>