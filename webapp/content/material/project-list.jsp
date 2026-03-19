<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>物资管理 - 腾讯云风格控制台</title>
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
                <a href="${ctx}/supervision/project-list.jsp" class="td-menu-item">
                    <i class="glyphicon glyphicon-eye-open"></i> 监理管理
                </a>
                <a href="${ctx}/agency/project-list.jsp" class="td-menu-item">
                    <i class="glyphicon glyphicon-transfer"></i> 代理管理
                </a>
                <a href="${ctx}/material/project-list.jsp" class="td-menu-item active">
                    <i class="glyphicon glyphicon-shopping-cart"></i> 物资管理
                </a>
                
                <!-- Business Group -->
                <div class="td-menu-group-title">经营与资信</div>
                <a href="${ctx}/bidding/project-list.jsp" class="td-menu-item">
                    <i class="glyphicon glyphicon-list-alt"></i> 投标管理
                </a>
                <a href="#" class="td-menu-item">
                    <i class="glyphicon glyphicon-certificate"></i> 证书资源池
                </a>
            </nav>
        </aside>

        <div class="td-main">
            <header class="td-header">
                <div class="td-header-search">
                    <i class="glyphicon glyphicon-search"></i>
                    <input type="text" placeholder="搜索物资采购单 (Ctrl + /)">
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
                        <h2 style="font-size: 20px; font-weight: 500; margin-bottom: 8px;">物资管理</h2>
                        <p style="color: var(--td-text-color-secondary); font-size: 14px; margin: 0;">采购合同、物流跟踪与结算管理</p>
                    </div>
                    <div>
                        <button class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> 采购申请</button>
                    </div>
                </div>

                <!-- Filters -->
                <div class="td-card" style="padding: 20px;">
                    <div class="row">
                        <div class="col-md-3">
                            <label style="font-size: 12px; color: var(--td-text-color-secondary); margin-bottom: 4px; display: block;">采购单号</label>
                            <input type="text" class="form-control" placeholder="请输入单号">
                        </div>
                        <div class="col-md-3">
                            <label style="font-size: 12px; color: var(--td-text-color-secondary); margin-bottom: 4px; display: block;">采购状态</label>
                            <select class="form-control">
                                <option>全部</option>
                                <option>采购中</option>
                                <option>配送中</option>
                                <option>已入库</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label style="font-size: 12px; color: var(--td-text-color-secondary); margin-bottom: 4px; display: block;">供应商</label>
                            <input type="text" class="form-control" placeholder="请输入供应商名称">
                        </div>
                        <div class="col-md-3" style="display: flex; align-items: flex-end;">
                            <button class="btn btn-primary" style="margin-right: 8px;">查询</button>
                            <button class="btn btn-default">重置</button>
                        </div>
                    </div>
                </div>

                <!-- Data Table -->
                <div class="td-card" style="padding: 0;">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th width="120">采购单号</th>
                                <th>项目名称</th>
                                <th width="150">供应商</th>
                                <th width="120">采购金额 (¥)</th>
                                <th width="100">状态</th>
                                <th width="150">物流进度</th>
                                <th width="120">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${projects}" var="item">
                            <tr>
                                <td><span style="font-family:monospace;">${item.id}</span></td>
                                <td style="font-weight:500; color: var(--td-brand-color);">${item.name}</td>
                                <td>${item.supplier}</td>
                                <td style="font-family:monospace; font-weight:600;">${item.amount}</td>
                                <td><span class="td-tag td-tag-${item.statusType}">${item.status}</span></td>
                                <td>
                                    <div class="progress" style="height: 4px; margin-bottom: 0; margin-top: 8px;">
                                        <div class="progress-bar progress-bar-${item.statusType}" style="width: ${item.progress}%; background-color: var(--td-${item.statusType}-color);"></div>
                                    </div>
                                    <div style="font-size: 10px; color: var(--td-text-color-secondary); text-align: right;">${item.progress}%</div>
                                </td>
                                <td>
                                    <a href="#" style="margin-right: 8px;">详情</a>
                                    <a href="#">收货</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <!-- Pagination -->
                    <div style="padding: 16px 24px; border-top: 1px solid var(--td-border-level-1-color); display: flex; justify-content: flex-end; align-items: center;">
                        <span style="margin-right: 16px; color: var(--td-text-color-secondary); font-size: 12px;">共 2 条记录</span>
                        <ul class="pagination" style="margin: 0;">
                            <li class="disabled"><a href="#">&laquo;</a></li>
                            <li class="active"><a href="#" style="background-color: var(--td-brand-color); border-color: var(--td-brand-color);">1</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </main>
        </div>
    </div>
  </body>
</html>