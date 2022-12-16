/**
 * 
 */
 	let updateForm = $("#updateForm");
 	let updateBtn = $("#updateBtn").on("click", function(event){
 		let who = viewModal.data("who");
 		if(!who) return false;
 		updateForm.get(0).who.value = who;
	 	updateForm.submit();
 	});
 	let deleteForm = $("#deleteForm");
 	let deleteBtn = $("#deleteBtn").on("click", function(event){
 		let who = viewModal.data("who");
 		if(!who) return false;
 		if(confirm("진짜 삭제할까?")){
	 		deleteForm.get(0).who.value = who;
	 		deleteForm.submit();
 		}
 	});
	let viewModal = $("#exampleModal").on("hidden.bs.modal", function(event){
		$(this).find(".modal-body").empty();
		viewForm.get(0).reset();
		viewModal.data("who", "");
	}).on("show.bs.modal", function(event){
		let dataTr = event.relatedTarget;
		let who = $(dataTr).data('who');
		viewModal .data("who", who);
		viewForm.find('[name=who]').val(who);
		viewForm.submit();
	});
	let viewForm = $("#viewForm").on("submit", function(event){
		event.preventDefault();
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize(); // ajaxForm 적용
		$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				let member=resp;
				table = `
				
				<table>






	<tr>
		<th>회원아이디</th>
		<td>${member['memId'] }</td>
	</tr>
	<tr>
		<th>MEM_PASS</th>
		<td>${member['memPass'] }</td>
	</tr>
	<tr>
		<th>MEM_NAME</th>
		<td>${member['memName'] }</td>
	</tr>
	<tr>
		<th>MEM_REGNO1</th>
		<td>${member['memRegno1'] }</td>
	</tr>
	<tr>
		<th>MEM_REGNO2</th>
		<td>${member['memRegno2'] }</td>
	</tr>
	<tr>
		<th>MEM_BIR</th>
		<td>${member['memBir'] }</td>
	</tr>
	<tr>
		<th>MEM_ZIP</th>
		<td>${member['memZip'] }</td>
	</tr>
	<tr>
		<th>MEM_ADD1</th>
		<td>${member['memAdd1'] }</td>
	</tr>
	<tr>
		<th>MEM_ADD2</th>
		<td>${member['memAdd2'] }</td>
	</tr>
	<tr>
		<th>MEM_HOMETEL</th>
		<td>${member['memHometel'] }</td>
	</tr>
	<tr>
		<th>MEM_COMTEL</th>
		<td>${member['memComtel'] }</td>
	</tr>
	<tr>
		<th>MEM_HP</th>
		<td>${member['memHp'] }</td>
	</tr>
	<tr>
		<th>MEM_MAIL</th>
		<td>${member['memMail'] }</td>
	</tr>
	<tr>
		<th>MEM_JOB</th>
		<td>${member['memJob'] }</td>
	</tr>
	<tr>
		<th>MEM_LIKE</th>
		<td>${member['memLike'] }</td>
	</tr>
	<tr>
		<th>MEM_MEMORIAL</th>
		<td>${member['memMemorial'] }</td>
	</tr>
	<tr>
		<th>MEM_MEMORIALDAY</th>
		<td>${member['memMemorialday'] }</td>
	</tr>
	<tr>
		<th>MEM_MILEAGE</th>
		<td>${member['memMileage'] }</td>
	</tr>
	<tr>
		<th>MEM_DELETE</th>
		<td>${member['memDelete'] }</td>
	</tr>
	<tr>
		<th>MEM_IMG</th>
		<td>
		<img src="data:image/*;base64,${member.base64Img }"/>
		${member['memImg'] }</td>
	</tr>`
   table += 
				
					`<tr>
						<th>구매목록</th>`
			 
						$.each(member.prodList, function (index, prod) {
						table +=	`<td>${prod.prodName }</td>`
				 
				
						})
			table +=`</tr>	
						</table>`;

	
				
				viewModal.find(".modal-body").html(table);
			},
			error : function(errorResp) {
				console.log(errorResp.status);
				viewModal.find(".modal-body").html(errorResp.responseText);
			}
		});
		return false;
	});