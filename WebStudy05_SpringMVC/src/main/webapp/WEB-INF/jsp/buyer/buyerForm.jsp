<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="error">${message }<</div>

<h4 id="d">가입양식</h4>
<form method="post">
	<input type="hidden" name="buyerId" value="${buyer.buyerId }"/>
	<table class="table table-bordered">

	<tr>
		<th>거래처명</th>
		<td><input type="text" name="buyerName" class="form-control"
			 value="${buyer.buyerName }" /> <span class="error">${errors.buyerName }</span></td>
	</tr>

	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerLgu" class="form-control"
			 value="${buyer.buyerLgu }" /> <span class="error">${errors.buyerLgu }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerBank" class="form-control"
			 value="${buyer.buyerBank }" /> <span class="error">${errors.buyerBank }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerBankno" class="form-control"
			 value="${buyer.buyerBankno }" /> <span class="error">${errors.buyerBankno }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerBankname" class="form-control"
			 value="${buyer.buyerBankname }" /> <span class="error">${errors.buyerBankname }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerAdd1" class="form-control"
			 value="${buyer.buyerAdd1 }" /> <span class="error">${errors.buyerAdd1 }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerAdd2" class="form-control"
			 value="${buyer.buyerAdd2 }" /> <span class="error">${errors.buyerAdd2 }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerComtel" class="form-control"
			 value="${buyer.buyerComtel }" /> <span class="error">${errors.buyerComtel }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerFax" class="form-control"
			 value="${buyer.buyerFax }" /> <span class="error">${errors.buyerFax }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerMail" class="form-control"
			 value="${buyer.buyerMail }" /> <span class="error">${errors.buyerMail }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerCharger" class="form-control"
			 value="${buyer.buyerCharger }" /> <span class="error">${errors.buyerCharger }</span></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="buyerTelext" class="form-control"
			 value="${buyer.buyerTelext }" /> <span class="error">${errors.buyerTelext }</span></td>
	</tr>
	

		<tr>
			<td colspan="2">
				<input type="reset" value="취소" class="btn btn-warning" />
				<input type="submit" value="저장" class="btn btn-primary"/>
			</td>
		</tr>

	</table>
</form>

<script type="text/javascript">
let prodBuyerTag = $("[name=prodBuyer]");
$("[name=prodLgu]").on("change", function(event){
	let lgu = $(this).val();
	prodBuyerTag.find("option."+lgu).show();
	prodBuyerTag.find("option:first").show();
	
	
	prodBuyerTag.find("option:not(."+lgu+")").hide();
})


<%
if("UDATE".equals(request.getAttribute("command"))){
	

%>
$(":input:not(.editable)").prop("readonly", true);
$("#d").text("수정");
<%}%>
</script>






















