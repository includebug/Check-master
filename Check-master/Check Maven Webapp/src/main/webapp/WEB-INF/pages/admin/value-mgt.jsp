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
    <link rel="stylesheet" href="${ctx}/css/info-mgt.css" />
    <link rel="stylesheet" href="${ctx}/css/WdatePicker.css" />
    <title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>变量管理</h2></div>
<form action="${ctx}/deleteValue.action" method="post" name="myform" id="myform">
    <div class="table-operate ue-clear">
        <a href="#" class="add" onclick="addType()">添加</a>
        <a href="javascript:;" class="del" onclick="deleteUser()">删除</a>
    </div>
    <div class="table-box" id="myDiv">
        <table border="1" cellspacing="1">
            <thead>
            <tr>
                <th class="num"></th>
                <th class="name">编号</th>
                <th class="name">类型名称</th>
                <th class="process">下限</th>
                <th class="process">上限</th>
                <th class="operate">操作</th>
            </tr>
            </thead>
            <tbody align="center">
            <c:forEach items="${dataList}" var="o">
                <tr align="center">
                    <td><input type="checkbox" name="typeId" value="${o.valueId}"/></td>
                    <td>${o.valueId}</td>
                    <td>${o.valueType}</td>
                    <td>${o.lowerLimit}</td>
                    <td>${o.upperLimit}</td>
                    <td class="operate">
                        <a href="${ctx}/delValue.action?typeId=${o.valueId}" class="del">删除</a>
                        <a href="${ctx}/toUpdValue.action?valueId=${o.valueId}" class="edit">编辑</a>
                        <a href="${ctx}/toQryValue.action?valueId=${o.valueId}" class="count">查看</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="pagination ue-clear"></div>
</form>
</body>
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/supersized.3.2.7.min.js"></script>
<script src="${ctx}/js/supersized-init.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript">
    $(".select-title").on("click",function(){
        $(".select-list").hide();
        $(this).siblings($(".select-list")).show();
        return false;
    })
    $(".select-list").on("click","li",function(){
        var txt = $(this).text();
        $(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
    })

    $('.pagination').pagination(${pageInfo.total},{
        callback: function(page){
            $.ajax({
                url:"${ctx}/qryValuePage.action",
                method:"post",
                dataType: "json",
                data:{page:page+1},
                success: function(data){
                    var html = "";
                    html += "<div class='table-box' id='myDiv'>";
                    html += "<table border='1' cellspacing='1'>";
                    html += "<thead>";
                    html += "<th class='num'></th>";
                    html += "<th class='name'>编号</th><th class='operate'>类型名称</th>";
                    html += "<th class='time'>分值</th><th class='time'>备注</th><th class='operate'>操作</th>";
                    html += "</thead>";
                    html += "<tbody align='center'>";

                    for(dataList in data){
                        html += "<tr align='center'>";
                        html += "<td><input type='checkbox' name='valueId' value='"+data[dataList].valueId+"'/></td>";
                        html += "<td>"+data[dataList].valueId+"</td>";
                        html += "<td>"+data[dataList].valueType+"</td>";
                        html += "<td>"+data[dataList].lowerLimit+"</td>";
                        html += "<td>"+data[dataList].upperLimit+"</td>";
                        html += "<td class='operate'><a href='${ctx}/delValue.action?typeId="+data[dataList].valueId+"' class='del'>删除</a>&nbsp;";
                        html += "<a href='${ctx}/toUpdValue.action?valueId="+data[dataList].valueId+"' class='del'>编辑</a>&nbsp;";
                        html += "<a href='${ctx}/toQryValue.action?valueId="+data[dataList].valueId+"' class='del'>查看</a></td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";
                    html += "</div>";
                    $("#myDiv").html("");
                    $("#myDiv").html(html);
                }
            });
        },
        display_msg: true,
        setPageNo: false
    });

    function deleteUser(){
        var ids = "";
        $("input:checkbox[name='typeId']:checked").each(function() {
            ids += $(this).val() + ",";
        });
        //判断最后一个字符是否为逗号，若是截取
        var id = ids.substring(ids.length -1, ids.length);
        if(id == ","){
            ids = ids.substring(0, ids.length-1);
        }
        if(ids == ""){
            alert("请选择要删除的记录！");
            return;
        }
        $("form").submit();
    }

    function addType(){
        document.myform.attributes["action"].value = "${ctx}/toAddValue.action";
        $("form").submit();
    }

    $("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

    showRemind('input[type=text], textarea','placeholder');
</script>
</html>