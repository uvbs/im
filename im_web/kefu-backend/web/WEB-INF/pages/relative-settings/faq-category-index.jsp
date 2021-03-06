<%--
  Created by IntelliJ IDEA.
  User: wangzhen
  Date: 2015/4/15
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>运营后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="../../js/jeasyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="../../js/jeasyui/themes/icon.css"/>
    <link href="../../css/content.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/base.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../../css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="../../css/relative-settings/faq-index.css" type="text/css"/>
    <style>
        #faqEditWindow .faq-field {
            clear: both;
        }

        #faqEditWindow .faq-label {
            height: 28px;
            line-height: 28px;
            float: left;
            margin-right: 8px;
        }

        #faqEditWindow .faq-edit-span {
            float: left;
        }

        #faqEditWindow .faq-field-warning {
            padding-top: 10px;
        }

        #faqEditWindow .wrapper .faq-field input,
        #faqEditWindow .wrapper .faq-field textarea {
            width: 310px;
        }
    </style>
</head>
<body>
<div id="main_warp">
    <!--路径导航
    <div class="road_warp">当前位置：<a href="#">返回首页</a>><a href="#">商家管理</a>><span>商家处罚规则设定</span></div>
    -->
    <!--标签类名称-->
    <div class="cla_nav"><span class="on">查询条件</span></div>
    <div></div>
    <!--条件搜索-->
    <div class="searchbar">
        <ul>
            <li class="pull-left">
                <span><span class="required">*</span>统计时间：</span>
                <input id="startTime" class="dateSettingTxt icon_calendar" type="text" style="height: 26px"
                       data-name="起时间" autocomplete="off">
                <span class="col_to">-</span>
                <input id="endTime" class="dateSettingTxt icon_calendar" type="text" style="height: 26px"
                       data-name="止时间" autocomplete="off">
                <input type="button" id="clearTime" class="clear_data_btn" value="清空"/>
            </li>
            <li>
                <span id="sellerIDLabel" class="labelplacehold" for="keyWord" data-tip="问题关键字">
                    问题关键字：</span>
                <input type="text" id="keyWord" class="easyui-validatebox seller_nick1" value=""
                       auto-complete="off" data-name="问题关键字" autocomplete="off">
            </li>
            <li>
                <input id="search" type="button" class="search_btn" value="查询"/>
                <input id="resetCondition" type="button" class="rewrite_btn" value="重置"/>
            </li>
        </ul>
    </div>
    <!--导出excel表格按钮-->
    <div>
        <input type="button" id="addFAQCategory" class="operation_btn_bg add_btn_2" value="添加">
        <input type="button" id="excelImport" class="operation_btn_bg add_btn_2" value="导入">
        <input type="button" id="excelExport" class="export_btn_bg export_btn_4" value="导出">
    </div>
    <!--tab页切换按钮-->
    <div class="count-tab">
        <span class="tab-btn rewrite_btn toggle-total active">全部(<span id="totalFAQCount">${totalCount}</span>)</span>
        <span class="tab-btn rewrite_btn toggle-showed">已显示(<span id="showedFAQCount">${showedCount}</span>)</span>
        <span class="chart-entrance" title="点击显示相关图表">客户问题分类统计</span>
        <a href="../../material/template/客户问题分类导入.xlsx" class="template-download" title="点击下载客户问题分类导入模板">客户问题导入模板下载</a>
    </div>
    <!--结果-->
    <div id="content">
        <div class="padd_b_10">
            <div id="faqCategoryTable" style="width: 100%;">
            </div>
            <div id="showedFaqCategoryTable" style="width: 100%">
            </div>
        </div>
    </div>

    <div id="confirmDeleteWindow" class="easyui-window"
         data-options="collapsible : false, minimizable : false, maximizable : false, closed: true,
             closable : true, modal : true, title: '确认是否删除'" style="width: 300px;display: none">
        <p class="confirm-delete-panel">确认删除这条数据吗？</p>

        <div style="text-align:center;padding:5px 5px 10px;">
            <input id="confirmDelete" class="confirm-btn" value="确认"/>
            <input id="cancelDelete" class="confirm-btn cancel" value="取消"/>
        </div>
    </div>
    <!-- 常见问题编辑窗口 -->
    <div id="faqEditWindow" class="easyui-window"
         data-options="collapsible : false, minimizable : false, maximizable : false, closed: true,
             closable : true, modal : true, title: '添加/修改客户问题分类'" style="width: 500px;display: none">
        <div class="wrapper">
            <div class="faq-field error">
                <span class="faq-label" style="float: left;width: 6em;text-align: right"><span class="required">*</span>问题分类：</span>

                <div class="faq-edit-span">
                    <div>
                        <input name="title" class="title" placeholder="请输入客户问题分类" style="width: 250px" maxlength="10"/>
                        <span class="faq-notice">10字以内</span>
                    </div>
                    <div class="faq-field-warning">
                        <span class="faq-error">X 请输入客户问题分类</span>
                    </div>
                </div>
            </div>
            <div class="faq-field error">
                <span class="faq-label"
                      style="float: left;vertical-align: top;line-height: inherit;width: 6em;text-align: right">备注：</span>

                <div class="faq-edit-span">
                    <div>
                        <textarea rows="3" cols="15" class="remark" name="remark" placeholder="请输入备注" maxlength="50"
                                  style="width: 250px"></textarea>
                        <span class="faq-notice">50字以内</span>
                    </div>
                    <div class="faq-field-warning">
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align:center;padding:5px;clear: both">
            <input id="editFAQCategoryBtn" class="operation_btn_bg con_btn_2" value="提交"/>
            <input id="returnBtn" class="operation_btn_bg ret_btn_2" value="返回"/>
        </div>
    </div>
</div>
<div class="chart-mask" style="display: none">
    <div class="wrapper">
        <div class="chart-tab-bar">
            <span class="chart-tab rewrite_btn active" id="bar-tab">柱状图</span>
            <span class="chart-tab rewrite_btn" id="pie-tab">饼图</span>
        </div>
        <div class="chart-container">
            <div class="chart-to-show" id="faq-chart-bar"></div>
            <div class="chart-to-show" id="faq-chart-pie"></div>
            <div class="loading">
                <span class="loading-indicator"><i class="fa fa-spinner fa-pulse"></i>&nbsp;&nbsp;正在加载...</span>
            </div>
        </div>
    </div>
    <div class="toolbar">
        <input id="chartCloseBtn" class="operation_btn_bg ret_btn_2" value="返回"/>
    </div>
</div>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/jeasyui/validateExtend.js"></script>
<script type="text/javascript" src="../../js/jeasyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/jeasyui/validateExtend.js"></script>
<script type="text/javascript" src="../../js/myCalendar/WdatePicker.js"></script>
<script type="text/javascript" src="../../js/util/generalUtil.js"></script>
<script type="text/javascript" src="../../js/util/easyuiUtil.js"></script>
<script type="text/javascript" src="../../js/plugin/uploader/jquery.uploader.js"></script>
<script type="text/javascript" src="../../js/plugin/echarts/echarts-all.js"></script>
<script type="text/javascript" src="../../js/relative-settings/faq-category-config.js"></script>
</body>
</html>
