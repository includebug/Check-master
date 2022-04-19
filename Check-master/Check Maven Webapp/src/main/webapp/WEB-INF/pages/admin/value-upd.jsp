<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${ctx}/css/base.css" />
    <link rel="stylesheet" href="${ctx}/css/info-reg.css" />
    <link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
    <title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>更新题型</h2></div>
<form action="${ctx}/addValue.action" method="post" name="myform" id="myform">
    <div class="main">
        <input type="hidden" name="valueId" id="valueId" maxlength="10" value="${type.valueId }"/>
        <p class="short-input ue-clear">
            <label><span style="color:red">*</span>变量类型：</label>
            <input type="text" name="valueType" id="valueType" maxlength="10" value="${type.valueType }"/>
        </p>
        <p class="short-input ue-clear">
            <label>下限：</label>
            <input type="text" id="lowerLimit" name="lowerLimit" value="${type.lowerLimit }"/>
        </p>
        <p class="short-input ue-clear">
            <label>上限：</label>
            <textarea id="upperLimit" name="upperLimit">${type.upperLimit }</textarea>
        </p>
    </div>
</form>
<div class="btn ue-clear">
    <a href="javascript:;" class="confirm" onclick="addType()">确定</a>
    <a href="${ctx}/toValuePage.action" class="clear">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/supersized.3.2.7.min.js"></script>
<script src="${ctx}/js/supersized-init.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
    $(function(){
        $("#grade").searchableSelect();
    });
    $(".select-title").on("click",function(){
        $(".select-list").toggle();
        return false;
    });
    $(".select-list").on("click","li",function(){
        var txt = $(this).text();
        $(".select-title").find("span").text(txt);
    });
    //注册
    function addType(){
        document.myform.attributes["action"].value = "${ctx}/updValue.action";
        $("form").submit();
    }
    showRemind('input[type=text], textarea','placeholder');
</script>
</html>