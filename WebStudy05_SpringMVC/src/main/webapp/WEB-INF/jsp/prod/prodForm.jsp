<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="error">${message }<</div>

<h4 id="d">가입양식</h4>
<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="prodId" value="${prod.prodId }"/>
	<table class="table table-bordered">

	<tr>
		<th>상품명</th>
		<td><input type="text" name="prodName" class="form-control"
			 value="${prod.prodName }" /> <span class="error">${errors.prodName }</span></td>
	</tr>
	<tr>
		<th>상품분류코드</th>
		<td>
<%-- 		<input type="text" name="prodLgu" class="form-control" value="${prod.prodLgu }" />  --%>
			
			<select name="prodLgu"  class="form-control">

						<c:forEach items="${lprodList}" var="lprod">
							<option value="${lprod['lprodGu'] }">${lprod['lprodNm'] }</option>
						</c:forEach>
				
				</select>
			<span class="error">${errors.prodLgu }</span></td>
	</tr>
	<tr>
		<th>거래처코드</th>
		<td>
<%-- 		<input type="text" name="prodBuyer" class="form-control" value="${prod.prodBuyer }" /> --%>
			
			<select name="prodBuyer"  class="form-control">

						<c:forEach items="${buyerList}" var="buyer">

							<option value="${buyer['buyerId'] }" class="${buyer['buyerLgu'] }">
								${buyer['buyerName'] }
							</option>
						</c:forEach>
			
				</select>
			 <span class="error">${errors.prodBuyer }</span></td>
	</tr>
	<tr>
		<th>매입가</th>
		<td><input type="number" name="prodCost" class="form-control"
			 value="${prod.prodCost }" /> <span class="error">${errors.prodCost }</span></td>
	</tr>
	<tr>
		<th>소비자가</th>
		<td><input type="number" name="prodPrice" class="form-control"
			 value="${prod.prodPrice }" /> <span class="error">${errors.prodPrice }</span></td>
	</tr>
	<tr>
		<th>판매가</th>
		<td><input type="number" name="prodSale" class="form-control"
			 value="${prod.prodSale }" /> <span class="error">${errors.prodSale }</span></td>
	</tr>
	<tr>
		<th>상품개락설명</th>
		<td><input type="text" name="prodOutline" class="form-control"
			 value="${prod.prodOutline }" /> <span class="error">${errors.prodOutline }</span></td>
	</tr>
	<tr>
		<th>상품상세설명</th>
		<td><input type="text" name="prodDetail" class="form-control"
			 value="${prod.prodDetail }" /> <span class="error">${errors.prodDetail }</span></td>
	</tr>
	<tr>
		<th>이미지(소)</th>
		<td><input type="file" name="prodImage" class="form-control"
			  /> <span class="error">${errors.prodImage }</span></td>
	</tr>
	<tr>
		<th>재고수량</th>
		<td><input type="number" name="prodTotalstock" class="form-control"
			 value="${prod.prodTotalstock }" /> <span class="error">${errors.prodTotalstock }</span></td>
	</tr>
	<tr>
		<th>신규일자(등록일)</th>
		<td><input type="date" name="prodInsdate" class="form-control"
			 value="${prod.prodInsdate }" /> <span class="error">${errors.prodInsdate }</span></td>
	</tr>
	<tr>
		<th>안전재고수량</th>
		<td><input type="number" name="prodProperstock"
			class="form-control"  value="${prod.prodProperstock }" /> <span
			class="error">${errors.prodProperstock }</span></td>
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






















