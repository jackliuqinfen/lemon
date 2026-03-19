<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>项目详情 - 腾讯云风格控制台</title>
    <%@include file="/common/s3.jsp"%>
    
    <!-- Using TDesign Theme -->
    <link rel="stylesheet" href="${cdnPrefix}/public/mossle/tdesign/css/lemon-tdesign.css" type="text/css" media="screen" />
    <script>
      $(function() {
        $('body').addClass('tdesign-body');
        
        // Tab functionality
        $('.nav-tabs a').click(function (e) {
          e.preventDefault();
          $(this).tab('show');
        });
      });
    </script>
    <style>
        .td-detail-header {
            background-color: #FFFFFF;
            padding: 24px 24px 0;
            border-bottom: 1px solid var(--td-border-level-1-color);
        }
        
        .td-detail-title {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }
        
        .td-detail-title h1 {
            font-size: 20px;
            font-weight: 600;
            margin: 0 12px 0 0;
            color: var(--td-text-color-primary);
        }
        
        .td-detail-meta {
            display: flex;
            gap: 24px;
            color: var(--td-text-color-secondary);
            font-size: 14px;
            margin-bottom: 24px;
        }
        
        .td-detail-meta span {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Stepper Override */
        .td-steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 24px;
            position: relative;
        }
        
        .td-step-item {
            flex: 1;
            text-align: center;
            position: relative;
            z-index: 2;
        }
        
        .td-step-icon {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: #F2F3F5;
            color: var(--td-text-color-placeholder);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 8px;
            font-size: 12px;
            border: 1px solid #DCDCDC;
        }
        
        .td-step-item.active .td-step-icon {
            background: var(--td-brand-color);
            color: #FFFFFF;
            border-color: var(--td-brand-color);
        }
        
        .td-step-item.finished .td-step-icon {
            background: var(--td-brand-color-light);
            color: var(--td-brand-color);
            border-color: var(--td-brand-color);
        }
        
        .td-step-title {
            font-size: 14px;
            color: var(--td-text-color-secondary);
        }
        
        .td-step-item.active .td-step-title {
            color: var(--td-text-color-primary);
            font-weight: 500;
        }
        
        .td-step-line {
            position: absolute;
            top: 12px;
            left: 0;
            width: 100%;
            height: 1px;
            background: #E7E7E7;
            z-index: 1;
        }

        /* Tabs Override */
        .nav-tabs {
            border-bottom: none;
        }
        
        .nav-tabs > li > a {
            border: none;
            color: var(--td-text-color-secondary);
            padding: 12px 24px;
            margin-right: 0;
            font-size: 14px;
        }
        
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            color: var(--td-brand-color);
            border: none;
            border-bottom: 2px solid var(--td-brand-color);
            background: transparent;
            font-weight: 500;
        }
        
        /* Description List */
        .td-desc-list {
            display: flex;
            flex-wrap: wrap;
        }
        
        .td-desc-item {
            width: 50%;
            margin-bottom: 16px;
            display: flex;
        }
        
        .td-desc-label {
            color: var(--td-text-color-secondary);
            width: 100px;
            flex-shrink: 0;
        }
        
        .td-desc-value {
            color: var(--td-text-color-primary);
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
                <a href="${ctx}/cost/project-list" class="td-menu-item active">
                    <i class="glyphicon glyphicon-yen"></i> 造价管理
                </a>
                <a href="${ctx}/supervision/project-list" class="td-menu-item">
                    <i class="glyphicon glyphicon-eye-open"></i> 监理管理
                </a>
            </nav>
        </aside>

        <div class="td-main">
            <header class="td-header">
                <div class="td-header-search">
                    <i class="glyphicon glyphicon-search"></i>
                    <input type="text" placeholder="搜索项目编号、合同名称 (Ctrl + /)">
                </div>
                <div class="td-header-actions">
                    <button class="td-icon-btn" title="新建"><i class="glyphicon glyphicon-plus"></i></button>
                    <button class="td-icon-btn" title="消息通知"><i class="glyphicon glyphicon-bell"></i></button>
                    <button class="td-icon-btn" title="用户中心"><i class="glyphicon glyphicon-user"></i></button>
                </div>
            </header>

            <!-- Detail Header -->
            <div class="td-detail-header">
                <div style="margin-bottom: 16px;">
                    <a href="project-list" style="color: var(--td-text-color-secondary); font-size: 14px;"><i class="glyphicon glyphicon-arrow-left"></i> 返回列表</a>
                </div>
                <div class="td-detail-title">
                    <h1>徐州变电站二期扩建工程造价审核 (ZJ-24-001)</h1>
                    <span class="td-tag td-tag-warning">进行中</span>
                </div>
                <div class="td-detail-meta">
                    <span><i class="glyphicon glyphicon-user"></i> 负责人: 王建国</span>
                    <span><i class="glyphicon glyphicon-calendar"></i> 立项日期: 2024-03-01</span>
                    <span><i class="glyphicon glyphicon-tag"></i> 业务类型: 预结算审核</span>
                </div>
                
                <!-- Tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#details" aria-controls="details" role="tab" data-toggle="tab">基本信息</a></li>
                    <li role="presentation"><a href="#docs" aria-controls="docs" role="tab" data-toggle="tab">文档与报告 (3)</a></li>
                    <li role="presentation"><a href="#tasks" aria-controls="tasks" role="tab" data-toggle="tab">任务与审批流</a></li>
                    <li role="presentation"><a href="#finance" aria-controls="finance" role="tab" data-toggle="tab">财务与产值</a></li>
                </ul>
            </div>

            <main class="td-content">
                <!-- Stepper -->
                <div class="td-card" style="padding: 32px 24px;">
                    <div class="td-steps">
                        <div class="td-step-line"></div>
                        <div class="td-step-item finished">
                            <div class="td-step-icon"><i class="glyphicon glyphicon-ok"></i></div>
                            <div class="td-step-title">合同签订</div>
                            <div style="font-size:12px; color:var(--td-text-color-placeholder); margin-top:4px;">2024-02-28</div>
                        </div>
                        <div class="td-step-item finished">
                            <div class="td-step-icon"><i class="glyphicon glyphicon-ok"></i></div>
                            <div class="td-step-title">项目立项</div>
                            <div style="font-size:12px; color:var(--td-text-color-placeholder); margin-top:4px;">2024-03-01</div>
                        </div>
                        <div class="td-step-item finished">
                            <div class="td-step-icon"><i class="glyphicon glyphicon-ok"></i></div>
                            <div class="td-step-title">编标/初审</div>
                            <div style="font-size:12px; color:var(--td-text-color-placeholder); margin-top:4px;">2024-03-10</div>
                        </div>
                        <div class="td-step-item active">
                            <div class="td-step-icon">4</div>
                            <div class="td-step-title">二审核定</div>
                            <div style="font-size:12px; color:var(--td-brand-color); margin-top:4px;">进行中</div>
                        </div>
                        <div class="td-step-item">
                            <div class="td-step-icon">5</div>
                            <div class="td-step-title">跟踪审计</div>
                        </div>
                        <div class="td-step-item">
                            <div class="td-step-icon">6</div>
                            <div class="td-step-title">结算开票</div>
                        </div>
                        <div class="td-step-item">
                            <div class="td-step-icon">7</div>
                            <div class="td-step-title">业绩归档</div>
                        </div>
                    </div>
                </div>

                <!-- Tab Content -->
                <div class="tab-content">
                    <!-- Tab 1: Details -->
                    <div role="tabpanel" class="tab-pane active" id="details">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="td-card">
                                    <div class="td-card-header">
                                        <div class="td-card-title">项目概况</div>
                                        <button class="btn btn-default btn-sm">编辑</button>
                                    </div>
                                    <div class="td-desc-list">
                                        <div class="td-desc-item">
                                            <div class="td-desc-label">委托单位</div>
                                            <div class="td-desc-value">徐州电力工程建设有限公司</div>
                                        </div>
                                        <div class="td-desc-item">
                                            <div class="td-desc-label">工程地点</div>
                                            <div class="td-desc-value">江苏省徐州市铜山区高新区变电站</div>
                                        </div>
                                        <div class="td-desc-item">
                                            <div class="td-desc-label">建筑面积</div>
                                            <div class="td-desc-value">2,450 平方米</div>
                                        </div>
                                        <div class="td-desc-item">
                                            <div class="td-desc-label">合同金额</div>
                                            <div class="td-desc-value">¥ 450,000.00</div>
                                        </div>
                                        <div class="td-desc-item" style="width: 100%;">
                                            <div class="td-desc-label">工程概况</div>
                                            <div class="td-desc-value">本工程为二期扩建项目，包含土建工程、安装工程及室外配套设施。需重点审核桩基工程量及电气设备采购价格。</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="td-card">
                                    <div class="td-card-header">
                                        <div class="td-card-title">项目团队</div>
                                        <button class="btn btn-primary btn-sm">添加成员</button>
                                    </div>
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td style="border-top: none;">
                                                    <div style="display: flex; align-items: center;">
                                                        <div style="width: 32px; height: 32px; background: #E6F0FF; border-radius: 50%; color: var(--td-brand-color); display: flex; align-items: center; justify-content: center; margin-right: 12px; font-size: 12px;">PM</div>
                                                        <div>
                                                            <div style="font-weight: 500;">王建国</div>
                                                            <div style="font-size: 12px; color: var(--td-text-color-secondary);">项目负责人</div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="display: flex; align-items: center;">
                                                        <div style="width: 32px; height: 32px; background: #F2F3F5; border-radius: 50%; color: var(--td-text-color-secondary); display: flex; align-items: center; justify-content: center; margin-right: 12px; font-size: 12px;">李</div>
                                                        <div>
                                                            <div style="font-weight: 500;">李红</div>
                                                            <div style="font-size: 12px; color: var(--td-text-color-secondary);">土建造价师</div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="display: flex; align-items: center;">
                                                        <div style="width: 32px; height: 32px; background: #F2F3F5; border-radius: 50%; color: var(--td-text-color-secondary); display: flex; align-items: center; justify-content: center; margin-right: 12px; font-size: 12px;">赵</div>
                                                        <div>
                                                            <div style="font-weight: 500;">赵强</div>
                                                            <div style="font-size: 12px; color: var(--td-text-color-secondary);">安装造价师</div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
  </body>
</html>