<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>case页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css" /> 
	<script type="text/javascript" src="<%=path %>/js/DD_belatedPNG_0.0.8a-min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript">
	function add(){
		$.post("parmeters/toaddParmeters.do",{},function(data){
			//$("#objdiv").show();
			$("#objdiv").html(data).show();
		});
	}
	function update(v){
		$.post("parmeters/toupdate.do",{
			"parmetersId":v
		},function(data){
			$("#objdiv").show();
			$("#objdiv").html(data).show();
		});
	}
	
	function test(caseId){
		$("#testbtn").attr('disabled',true); //设置变灰按钮 
		document.frm.action="parmeters/test.do?parmetersId="+parmetersId;
		document.frm.submit();
}s
	
	function hiden(){
		$("#objdiv").hide();
	}
	
	function toPage(p){
		var total = ${data.total};
		if(p<=0||p>total){
			return;
		}
  		document.frm.action="parmeters/parmeterslist.do";
  		document.getElementById("pag").value = p;
		document.frm.submit();
  	}
  	
  	function submitForm(){
  		document.frm.action="parmeters/parmeterslist.do";
  		document.getElementById("pag").value = 1;
		document.frm.submit();
  	}
  	
	function test(caseId){
		$("#testbtn").attr('disabled',true); //设置变灰按钮 
		document.frm.action="parmeters/test.do?parmetersId="+caseId;
		document.frm.submit();
  	}
	</script>
	
  <style type="text/css">  
    .table-ellipsis {
      background:#fff;
      table-layout: fixed;
      width: 100%;
    }
    .table-ellipsis td {
        height:48px; line-height:48px; text-align:center; font-size:13px;font-family:"微软雅黑";
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
   
</style>   
  </head>
  
  <body>
 	<form name="frm" action="<%=path %>/parmeters/parmeterslist.do" method="post">
 	 
 	<div class="tai_right" id="tai_right">
    	<!--  <table width="100%" class="table-ellipsis">-->
    	<table width="100%" class="table-ellipsis">
          <tr class="back_tit">
            <td style="width:5%;">编号</td>
             <td style="width:5%;">用户名</td>
            <td style="width:10%;">密码</td>
            
            <td style="width:15%;"><a href="javascript:void(0)" onclick="add()"><font color="#fc7305"><b>添加</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</td>
          </tr>
          <c:forEach items="${data.objs}" var="o" varStatus="status">
         <tr class="hang01">
		    <td>
		    ${status.count}
		    </td>
		     
		    <td>
		    ${o.loginname}
		    </td>
		    
		    <td>
		    ${o.loginpass}
		    </td>
		    
		    
		    <td>
		    <input type="button" class="gaic" value="修改" onclick="update('${o.uid }')">
		    <input type="button" class="gaic" value="删除" onclick="window.location.href='<%=path %>/parmeters/delete.do?parmetersId=${o.uid }'">

		    </td>
		    </tr>
		    </c:forEach>
        </table><br>
        <table border=0 align="center" width="90%">
        <tr><td width="50%">
        每页显示      <select name="pagesize" style="font-size:18px;70px;height:25px;" onChange="javascript:submitForm(${data.pag});">
        	<option value="10" <c:if test="${data.pagesize==10 }">selected</c:if>>10</option>
        	<option value="20" <c:if test="${data.pagesize==20 }">selected</c:if>>20</option>
        	<option value="50" <c:if test="${data.pagesize==50 }">selected</c:if>>50</option>
        	<option value="100" <c:if test="${data.pagesize==100 }">selected</c:if>>100</option>
        </select></td> <td width="50%" align="right">
		   <a href="javascript:toPage(${data.pag-1 });" class="gaic" >上一页</a>&nbsp;&nbsp;
		   <a href="javascript:toPage(${data.pag+1 });" class="gaic" >下一页</a>
		&nbsp;第<font color="red">${data.pag}<font><font color="black">页&nbsp;共${data.total }页</font>&nbsp;&nbsp;
        </td></tr>
        </table>
          <input type="hidden" name="pag"  id="pag"  value="${data.pag}">
        </div>
	</form>
    <div id="objdiv" style="position:absolute;top:50px;left:200px;"></div>
  </body>
</html>