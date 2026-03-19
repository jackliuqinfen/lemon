<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>证书资源池 - 腾讯云风格控制台</title>
    <%@include file="/common/s3.jsp"%>
    
    <!-- Using TDesign Theme -->
    <link rel="stylesheet" href="${cdnPrefix}/public/mossle/tdesign/css/lemon-tdesign.css" type="text/css" media="screen" />
    <script>
      $(function() {
        $('body').addClass('tdesign-body');
      });
    </script>
    <style>
        .cert-card {
            border: 1px solid var(--td-border-level-1-color);
            border-radius: var(--td-radius-medium);
            background: #FFFFFF;
            padding: 16px;
            margin-bottom: 16px;
            transition: all 0.2s;
            position: relative;
            overflow: hidden;
        }
        
        .cert-card:hover {
            box-shadow: var(--td-shadow-1);
            border-color: var(--td-brand-color);
        }
        
        .cert-card.occupied::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--td-warning-color);
        }
        
        .cert-card.available::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--td-success-color);
        }
        
        .cert-type {
            font-size: 12px;
            color: var(--td-text-color-secondary);
            margin-bottom: 4px;
        }
        
        .cert-name {
            font-size: 16px;
            font-weight: 600;
            color: var(--td-text-color-primary);
            margin-bottom: 12px;
        }
        
        .cert-holder {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }
        
        .cert-avatar {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: #F2F3F5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            color: var(--td-text-color-secondary);
            margin-right: 8px;
        }
        
        .cert-status {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
            padding-top: 12px;
            border-top: 1px dashed var(--td-border-level-1-color);
        }
        
        /* Simple Gantt Style for Resource View */
        .gantt-row {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            height: 32px;
        }
        
        .gantt-label {
            width: 120px;
            font-size: 12px;
            color: var(--td-text-color-primary);
            text-align: right;
            padding-right: 16px;
        }
        
        .gantt-bar-container {
            flex: 1;
            background: #F2F3F5;
            height: 24px;
            border-radius: 4px;
            position: relative;
        }
        
        .gantt-bar {
            position: absolute;
            height: 100%;
            background: var(--td-brand-color-light);
            border: 1px solid var(--td-brand-color);
            border-radius: 4px;
            top: 0;
            display: flex;
            align-items: center;
            padding-left: 8px;
            font-size: 10px;
            color: var(--td-brand-color);
            overflow: hidden;
            white-space: nowrap;
        }
    </style>
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
                <a href="${ctx}/material/project-list.jsp" class="td-menu-item">
                    <i class="glyphicon glyphicon-shopping-cart"></i> 物资管理
                </a>
                
                <!-- Business Group -->
                <div class="td-menu-group-title">经营与资信</div>
                <a href="${ctx}/bidding/project-list.jsp" class="td-menu-item">
                    <i class="glyphicon glyphicon-list-alt"></i> 投标管理
                </a>
                <a href="${ctx}/cert/resource-pool.jsp" class="td-menu-item active">
                    <i class="glyphicon glyphicon-certificate"></i> 证书资源池
                </a>
            </nav>
        </aside>

        <div class="td-main">
            <header class="td-header">
                <div class="td-header-search">
                    <i class="glyphicon glyphicon-search"></i>
                    <input type="text" placeholder="搜索人员证书 (Ctrl + /)">
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
                        <h2 style="font-size: 20px; font-weight: 500; margin-bottom: 8px;">证书资源池</h2>
                        <p style="color: var(--td-text-color-secondary); font-size: 14px; margin: 0;">企业资质与人员证书的全生命周期管理与占用监控</p>
                    </div>
                    <div>
                        <button class="btn btn-default" style="margin-right: 8px;">证书借用</button>
                        <button class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> 登记证书</button>
                    </div>
                </div>

                <div class="row">
                    <!-- Left: Filters & List -->
                    <div class="col-md-8">
                        <!-- Filters -->
                        <div class="td-card" style="padding: 20px; margin-bottom: 16px;">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" placeholder="证书名称/持证人">
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control">
                                        <option>所有专业</option>
                                        <option>注册造价师</option>
                                        <option>注册监理师</option>
                                        <option>一级建造师</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control">
                                        <option>所有状态</option>
                                        <option>空闲</option>
                                        <option>占用中</option>
                                        <option>即将过期</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-primary" style="width: 100%;">查询</button>
                                </div>
                            </div>
                        </div>

                        <!-- Certificate Cards -->
                        <div class="row">
                            <!-- Card 1 -->
                            <div class="col-md-6">
                                <div class="cert-card occupied">
                                    <div class="cert-type">一级注册造价工程师 (土建)</div>
                                    <div class="cert-name">建[造]112200345</div>
                                    <div class="cert-holder">
                                        <div class="cert-avatar">李</div>
                                        <span style="font-weight: 500; margin-right: 8px;">李红</span>
                                        <span class="td-tag td-tag-warning">占用中</span>
                                    </div>
                                    <div class="cert-status">
                                        <span style="color: var(--td-text-color-secondary);">有效期至: 2025-12-31</span>
                                        <a href="#">查看详情</a>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Card 2 -->
                            <div class="col-md-6">
                                <div class="cert-card available">
                                    <div class="cert-type">注册监理工程师</div>
                                    <div class="cert-name">3200192834</div>
                                    <div class="cert-holder">
                                        <div class="cert-avatar">张</div>
                                        <span style="font-weight: 500; margin-right: 8px;">张伟</span>
                                        <span class="td-tag td-tag-success">空闲</span>
                                    </div>
                                    <div class="cert-status">
                                        <span style="color: var(--td-text-color-secondary);">有效期至: 2026-06-30</span>
                                        <a href="#">查看详情</a>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Card 3 -->
                            <div class="col-md-6">
                                <div class="cert-card available">
                                    <div class="cert-type">一级注册造价工程师 (安装)</div>
                                    <div class="cert-name">建[造]112200346</div>
                                    <div class="cert-holder">
                                        <div class="cert-avatar">赵</div>
                                        <span style="font-weight: 500; margin-right: 8px;">赵强</span>
                                        <span class="td-tag td-tag-success">空闲</span>
                                    </div>
                                    <div class="cert-status">
                                        <span style="color: var(--td-text-color-secondary);">有效期至: 2025-10-15</span>
                                        <a href="#">查看详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Occupancy Timeline -->
                    <div class="col-md-4">
                        <div class="td-card">
                            <div class="td-card-header">
                                <div class="td-card-title">资源占用视图 (3月)</div>
                            </div>
                            <div style="margin-bottom: 16px; font-size: 12px; color: var(--td-text-color-secondary); display: flex; justify-content: space-between;">
                                <span>1日</span>
                                <span>10日</span>
                                <span>20日</span>
                                <span>30日</span>
                            </div>
                            
                            <div class="gantt-row">
                                <div class="gantt-label">李红 (造价)</div>
                                <div class="gantt-bar-container">
                                    <div class="gantt-bar" style="left: 10%; width: 60%;">徐州变电站项目</div>
                                </div>
                            </div>
                            
                            <div class="gantt-row">
                                <div class="gantt-label">张伟 (监理)</div>
                                <div class="gantt-bar-container">
                                    <!-- Free -->
                                </div>
                            </div>
                            
                            <div class="gantt-row">
                                <div class="gantt-label">王建国 (PM)</div>
                                <div class="gantt-bar-container">
                                    <div class="gantt-bar" style="left: 0%; width: 100%; background: #FFF3E8; border-color: var(--td-warning-color); color: var(--td-warning-color);">多项目并行</div>
                                </div>
                            </div>
                            
                            <div class="gantt-row">
                                <div class="gantt-label">刘强 (监理)</div>
                                <div class="gantt-bar-container">
                                    <div class="gantt-bar" style="left: 40%; width: 40%;">南京住宅项目</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="td-card">
                            <div class="td-card-header">
                                <div class="td-card-title">预警提醒</div>
                            </div>
                            <ul style="list-style: none; padding: 0; margin: 0;">
                                <li style="padding: 8px 0; border-bottom: 1px dashed var(--td-border-level-1-color); font-size: 12px;">
                                    <i class="glyphicon glyphicon-exclamation-sign" style="color: var(--td-error-color); margin-right: 8px;"></i>
                                    <span style="color: var(--td-text-color-primary);">孙小美的安全员C证将于 30 天后过期</span>
                                </li>
                                <li style="padding: 8px 0; border-bottom: 1px dashed var(--td-border-level-1-color); font-size: 12px;">
                                    <i class="glyphicon glyphicon-time" style="color: var(--td-warning-color); margin-right: 8px;"></i>
                                    <span style="color: var(--td-text-color-primary);">李红的证书借用申请待审批</span>
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