<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
   width: 1500px;
   height : 300px;

}
table.type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;

}
table.type02 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #eee;
}
table.type02 td {
  width: 350px;
  padding: 10px;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.updel:link {
  color : white;
}
.updel:visited {
  color : white;
}
.updel:hover {
  color : white;
}
.updel:active {
  color : white;
}
.updel{
   width: 200px;
    height: 60px;
    text-align: center;
    line-height: 60px;
   background : #0d6efd;
	padding: 10px 40px;
}
.containerr{
 text-align : center; 

}
.containerr button.list{
   border : 0;
   background : #0d6efd;
   color : white;
   width: 120px;
   height : 40px;
   margin-top : 20px;
   margin-bottom : 20px;
}
.inputds {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 0;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
.inputdss {
 width: 500px;
 height: 200px;
  font-size: 15px;
  border: 0;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
.containerr2{
	text-align : center;
}

.replybtn{
   border : 0;
   background : #0d6efd;
   color : white;
   width: 120px;
   height : 40px;
   margin-top : 20px;
}
.reply2{
   width: 120px;
    height: 40px;
     border: 0;
     outline: none;
     padding-left: 10px;
     color : white;
     background : #0d6efd;
}


table {
   width: 1500px;
   height : 300px;

}
table.type03 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;


}
table.type03 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;

  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #eee;
}
table.type03 td {
  width: 350px;
  padding: 10px;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.replybtn2 {
   width: 200px;
    height: 60px;
    text-align: center;
    line-height: 60px;
   background : #0d6efd;
   padding: 8px 25px;

}
.replybtn2:link {
  color : white;
}
.replybtn2:visited {
  color : white;
}
.replybtn2:hover {
  color : white;
}
.replybtn2:active {
  color : white;
}
.rereply{
  text-align : center;
}


</style>


<title>Insert title here</title>
<script type="text/javascript">
function showreplydiv(){
   var replydiv = document.getElementById("replydiv");
   if(replydiv.style.display == "none"){
      replydiv.style.display = 'block';
   }else{
      replydiv.style.display = 'none';
   }
}


</script>

</head>
<body>

   <!-- ??????????????? ?????? ????????? ????????? ????????? ?????? -->
   <c:import url="/WEB-INF/views/common/menubar.jsp" />
<style type="text/css" >
html, body {
      overflow: scroll;
      overflow-x: hidden
   }   
</style>
   <h2 style="margin-top : 20px;" align="center">${ requestScope.question.q_no }??? ????????? ????????????</h2>
   <br>
   <table class="type02" align="center">
      <tr>
         <th scope="row">??? ??? : </th>
         <td>${ question.q_title }</td>
      </tr>
      <tr>
         <th scope="row">????????? : </th>
         <td>${ question.q_writer }</td>
      </tr>
      <tr>
         <th scope="row">??? ??? : </th>
         <td>${ question.q_date }</td>

      </tr>
      <tr>
         <th scope="row">???????????? : </th>
         <td>
            <!-- ??????????????? ?????????, ????????? ????????? ???????????? ???????????? ??? --> <c:if
               test="${ !empty question.q_original_filename }">

               <a href="${ bfd }">${ question.q_original_filename }</a>
            </c:if> <!-- ??????????????? ????????? ???????????? ????????? --> <c:if
               test="${ empty question.q_original_filename }">
            &nbsp;
         </c:if>
         </td>
      </tr>
      <tr>
         <th scope="row">??? ??? : </th>
         <td>${ question.q_content }</td></tr>
   </table>
   <div class="containerr">
   <button class="list" onclick="javascript:location.href='qnaListView.do?=${currentPage}';">??????</button>&nbsp;&nbsp;&nbsp;&nbsp;
      <c:if test="${ requestScope.question.q_writer eq sessionScope.loginMember.userid }">
         <c:url var="bup" value="/qupview.do">
            <c:param name="q_no" value="${ question.q_no }" />
            <c:param name="page" value="${ currentPage }" />
         </c:url>
         <a class="updel" href="${ bup }">&nbsp;&nbsp;?????????&nbsp;&nbsp;</a> &nbsp;&nbsp;&nbsp;
         <c:url var="bdl" value="/qdel.do">
            <c:param name="q_no" value="${ question.q_no }" />
            <c:param name="q_rename_filename" value="${ question.q_rename_filename}" />
         </c:url>
         <a  class="updel" href="${ bdl }">&nbsp;&nbsp;?????????&nbsp;&nbsp;</a> &nbsp;&nbsp;
      </c:if>
      <c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin eq 'Y'}">
         <button class="reply2" onclick="showreplydiv();" id="replybtn">????????????</button> &nbsp;
      </c:if>
   </div>
   <!-- ?????? ??????~ -->

<div id="replydiv" style="display:none;">
<form action="reply.do" method="post" >
 <!-- ?????? ????????? ?????? ????????? ?????? -->
   <input type="hidden" name="a_ref" value="${ question.q_no }">
   <input type="hidden" name="page" value="${ currentPage }">
<table class="type02" align="center" width="500" border="1" cellspacing="0" cellpadding="5">
   <tr><th scope="row">??? ???</th><td><input class="inputds" type="text" name="a_title"></td></tr>
   <tr><th scope="row">?????????</th>
   <td><input class="inputds"  type="text" name="a_writer" readonly value="${ loginMember.userid }"></td></tr>
   <tr><th scope="row">??? ???</th><td><textarea class="inputdss"  rows="5" cols="50" name="a_content"></textarea></td></tr>
   
</table>
<div class="containerr2">
   <tr><th colspan="2">
      <input class="replybtn" type="submit" value="??????????????????"> &nbsp;
      <input class="replybtn" type="reset" value="????????????">
   </th></tr>
   </div>
</form> 
</div>
 <hr>

 <c:forEach items="${ requestScope.replylist }" var="r">
 <table class="type03" align="center">
      <tr><br>
         <th scope="row">?????? : </th>
         <td>${r.a_title }</td>
      </tr><br>
      <tr>
         <th scope="row">????????? : </th>
         <td>${ r.a_writer }</td>
      </tr><br>
      <tr><th scope="row">?????? : </th>
         <td><fmt:formatDate value="${ r.a_date }" pattern="yyyy-MM-dd" /></td></tr>
         <tr><br>
         <th scope="row">?????? : </th>
         <td>${r.a_content }</td>
         </tr>
         </table>
         <div class="rereply">
         <c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin eq 'Y'}"> 
            <c:url var="aup" value="/aupview.do">
               <c:param name="a_ref" value="${ r.a_ref }" />
               <c:param name="page" value="${ currentPage }" />
            </c:url>
            <div>
            <a class="replybtn2"  href="${ aup }">????????????</a> &nbsp;
            <c:url var="bdl" value="/adel.do">
               <c:param name="a_ref" value="${ r.a_ref }" />
               <c:param name="page" value="${ currentPage }" />
            </c:url>
            <a class="replybtn2"  href="${ bdl }">????????????</a> &nbsp;
         </c:if>

         </div>
         <hr>
   </c:forEach>
</body>
</html>



