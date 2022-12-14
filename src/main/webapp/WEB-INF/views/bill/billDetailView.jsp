<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="currentPage" value="${ requestScope.currentPage }"></c:set>
<c:set var="date3"><fmt:formatDate type="date" pattern="yyyy MM dd" value="${ bill.bill_timestamp }"/></c:set>
<c:set var="date2"><fmt:formatDate type="date" pattern="yyyy-MM-dd'T'HH:mm:ss" value="${ bill.bill_timestamp }"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style type="text/css">
	.editable{
		color:#880000; 
		background-color: #d3d3d3;
	}
	
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}

table.qa-table{
   width: 500px;
   text-align:center;
   border : 1px solid #ccc;
   margin-left: auto; 
   margin-right: auto;
   border-collapse: collapse;
   line-height: 1.5;
}
table.qa-table thead{
   border-right: 1px solid #ccc;
   border-left: 1px solid #ccc;
   background: #4886FA;
}
table.qa-table thead th {
   padding: 10px;
   font-weight: solid;
   vertical-align: top;
   color: #fff;
}
table.qa-table tbody tr{;
   font-weight: bold;
   border-bottom: 1px solid #ccc;
   background: #fff;
   height : 38px;
}
table.qa-table tbody tr th{;
   font-weight: bold;
   border-bottom: 1px solid #ccc;
   background: #F0F8FF; 
   height : 38px;
}
.paging {
    position: fixed;
    bottom: 100px;
    width: 100%;
   text-align : center;
}
.a{
   color: #4886FA;
}
</style>



<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
categoryCheck = () => {$('#bill_category input[value="${bill.bill_category}"]').attr('checked', true)};
$(() => {

		//document.querySelector("#bill_category input[value='${bill.bill_category}']").setAttribute('checked', true)
	categoryCheck();
	
	
		
	$("input[name=update]").click(() => {
		// ???????????????
	
		$('input[name=bill_category]').attr('disabled', false);
		$(".editable:input").attr('readonly', false); //????????? ?????????... ???
		$(".editable:input").css('backgroundColor', "#ffffff", "color", "#ffffff");
		
		$("input[name=update]").css("display", "none");
		$("input[name=apply]").css("display", "inline");
	});
	
	$("input[name=rollback]").click(() => {
		// ???????????????
		$('input[name=bill_category]').attr('disabled', true);
		
		$(".editable:input").attr('readonly', true); //????????? ?????????... ???
		$(".editable:input").css('backgroundColor', "#d3d3d3", "color", "#880000");
		
		
		$("input[name=update]").css("display", "inline");
		$("input[name=apply]").css("display", "none");
	});
	
	
	// ???????????????
	$("#delete").click(() => {
/* 		var rlt = confirm('?????????????????????????'); 

		if(rlt){ //??????
			console.log("?????? ?????? ??????");
			location.href = "${ pageContext.servletContext.contextPath }/deleteBill.do?bill_id=${bill.id}";
			
		}

		else {

		// ?????? ???????????? 
			console.log("?????? ??????");
		} */
		
		Swal.fire({
			  title: '????????? ???????????????????????????',
			  text: "??????????????? ?????? ???????????? ??? ????????????.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '??????',
			  cancelButtonText: '??????'
			}).then((result) => {
			  if (result.value) {
	              //"??????" ????????? ????????? ??? ????????? ????????? ????????? ???????????? ??????.
	              console.log("?????? ?????? ??????");
	              Swal.fire({
	            	  icon: 'success',
	            	  title:"?????????????????????.", 
	              }).then((result2) =>{
	           	  location.href = "${ pageContext.servletContext.contextPath }/deleteBill.do?bill_id=${bill.id}";
	         
				  
	              
	              });
			  }
			})
	});
	
});


</script>
</head>
<body>

	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<!-- jstl ?????? ???????????? ?????? : /WEB-INF/views/common/menubar.jsp -->
	<hr>
	<h2 align="center">?????? ????????????</h2>
	<br>
	<form action="updateBill.do" method="post">
		<input type="hidden" name="id" value="${ bill.id }">
		<input type="hidden" name="bill_id" value="${ bill.id }">
		<input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="date" value="${ date }" >
		<table class="qa-table" align="center" width="410" border="1" cellspacing="0"
			cellpadding="5">
			
			
			<tr>
				<th width="120">?????????</th>
				<td><input type="text" name="userid"
					value="${ loginMember.userid }" style="color:#880000; background-color: #d3d3d3;" readonly></td>
			</tr>
			
			<tr>
				<th width="120">?????? ??????</th>
				<td><input class="editable" type="text" name="bill_price" value="${ bill.bill_price }" readonly></td>
			</tr>
			
			<tr>
				<th width="120">?????? ?????? ??? &nbsp; ??????</th>
				<td><input class="editable" type="datetime-local" name="bill_timestamp2"
					id="bill_timestamp" value="${ date2 }" readonly></td>
			</tr>
			
			<tr>
				<th width="120">??????</th>
				<td><textarea class="editable" rows="5" cols="32" name="bill_content"
						id="bill_content"  readonly>${bill.bill_content}</textarea></td>
			</tr>
			
			<tr>
				<th width="120">????????????</th>
				<td id="bill_category">
							<input type="radio" name="bill_category" value="??????" readonly disabled>??????
					&nbsp; <input type="radio" name="bill_category" value="??????/??????" readonly disabled>??????/??????
					&nbsp; <input type="radio" name="bill_category" value="?????????" readonly disabled>?????????
					&nbsp; <input type="radio" name="bill_category" value="??????" readonly disabled >??????
				</td>
			</tr>
			
			<tr id="cardinfo">
				<th width="120">?????? ??????</th>
				<td><input class="editable" type="text" name="bill_cardinfo" value="${ bill.bill_cardinfo }" readonly></td>
			</tr>
			<tr id="store_name">
				<th width="120">?????????</th>
				<td><input class="editable" type="text" name="bill_storeinfo_name" value="${ bill.bill_storeinfo_name }" readonly></td>
			</tr>
			<tr id="store_bizNum">
				<th width="120">????????? ??????</th>
				<td><input class="editable" type="text" name="bill_storeinfo_biznum" value="${ bill.bill_storeinfo_biznum }" readonly></td>
			</tr>
			<tr id="store_tel">
				<th width="120">?????? ????????????</th>
				<td><input class="editable" type="text" name="bill_storeinfo_tel" value="${ bill.bill_storeinfo_tel }" readonly></td>
			</tr>
			
			<tr>
				<th colspan="2">
					<c:if test="${ empty count }">
					<button class="btn btn-primary" type="button"
						onclick="javascript:location.href='billListView.do?page=${ currentPage }&userid=${ loginMember.userid }&date=${date}'">??????</button>
					</c:if>
					<c:if test="${ !empty count }">
					<button class="btn btn-primary" type="button"
						onclick="javascript:location.href='multiUploadCompleteView.do?count=${ count }&userid=${ loginMember.userid }'">??????</button>
						<input type="hidden" value="${ count }" name="count">
					</c:if>
					&nbsp;
						<input class="btn btn-primary" type="button" name="update" value="??????">
						<input class="btn-success btn" style="display: none;  " type="submit" name="apply" value="??????"> &nbsp;
						<input class="btn btn-warning" type="reset" name="rollback" value="??????">
						<c:url var="bdl" value="/deleteBill.do">
							<c:param name="bill_id" value="${ bill.id }" />
						</c:url>
						<div  style="float:right; text-align: right;"><input style="background-color: #ff0000;" class="btn btn-danger" type="button"  type="button" id="delete" value="??????"></div>
		
				</th>
			</tr>
		</table>
	</form>
	<hr>
	<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>



</body>
</html>