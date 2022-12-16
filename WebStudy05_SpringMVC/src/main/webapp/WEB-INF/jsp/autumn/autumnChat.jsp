<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<style type="text/css">
		.my {
			background-color: yellow;
		}
	</style>

  
    <div class="container">
   
            <div>
            	 <p>채팅방</p>
                <ul id="roomList">
				
                </ul>
                 
            </div>
        </div>
 		<input type="button" value="+"  id="memberList"
                class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#tooltippopovers" >
        <form id="createForm"  method="post">
            <input type="text" name="name" class="form-control">
            <input type="submit" class="btn btn-secondary" value="개설하기"/>
        </form>
 
 
 
<div class="modal fade" id="tooltippopovers" tabindex="-1" aria-labelledby="tooltippopoversLabel" aria-hidden="true">
  <div class="modal-dialog mt-6" role="document">
    <div class="modal-content border-0">
      <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1"><button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button></div>
      <div class="modal-body p-0">
        <div class="bg-light rounded-top-lg py-3 ps-4 pe-6">
          <h4 class="mb-1" id="tooltippopoversLabel">멤버리스트</h4>
        </div>
        <div class="p-4 pb-0">
          <div class="row">
            <div class="col">
            	<ul id="modalList">
            	
            	
            	</ul>
  <input type="submit" class="btn btn-secondary" id="create" value="개설하기"/>
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
 
	<script type="text/javascript">
// 	$("#chatRoomList").on("click", function(){
// 		let memId = $(this).data('value');
// 		alert(memId);
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/autumn/chatRoomList.do",
			data : {memId : "${pageContext.request.userPrincipal.realUser.memId }"},
			method : "get",
			
			dataType : "json", // Accept vs Content-Type
			success : function(resp) {
			let messageList = resp;
				console.log(messageList);
				let texts =[];
				$.each(messageList, function(index,message){
					let chatRoom = message.chatRoomList;
					let viewURL = "${pageContext.request.contextPath }/chat/chat.do?roomId="+chatRoom[0].roomId+"&roomName="+chatRoom[0].roomName;
					 let text =  $("<li>").html(
							$("<a>").attr("href",viewURL)
							.attr("id","room")
							.attr("data-value",chatRoom[0].roomId)
							.text(chatRoom[0].roomName)
							);
				
					 
				texts.push(text);
					
						
					
					
				});
				$("#roomList").append(texts);
					
				
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
// 	});	
		
 </script>
<script>
$("#createForm").on("submit", function(event){
	event.preventDefault();
	
	let method = this.method;
	let data = $(this).serialize();
	$.ajax({
		url : "${pageContext.request.contextPath}/chat/roomCreate.do",
		method : method,
		data : data,
		dataType : "json", // Accept vs Content-Type
		success : function(resp) {
			
// 			location.href = "${pageContext.request.contextPath }/chat/room.do";
			let chatRoom = resp;
			
			let viewURL = "${pageContext.request.contextPath }/chat/chat.do?roomId="+chatRoom.roomId+"&roomName="+chatRoom.roomName;
			
				let room = $("<li>").html($("<a>").attr("href", viewURL)
											.text(chatRoom.roomName));
				
			let ul = $("#roomList");
			
			ul.prepend(room);
			},
		
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	return false;
});

$("#memberList").on("click", function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/autumn/allMemberList.do",
		
// 		url : cf_getContextPath()+"/chat/allMemberList.do",
		method : "get",
		
		dataType : "json", // Accept vs Content-Type
		success : function(resp) {
			console.log(resp);
			
		
						
			let list = resp;
			let texts =[];
			$.each(list, function(index,member){
			
			let url = "${pageContext.request.contextPath }/chat/chat.do?roomId="+member.memId+"&roomName="+member.memName 

// 				let text =  $("<li>").html(
// 							$("<a>").attr("href",url)
// 							.attr("id","amem")
// 							.attr("data-value",member.memDelete)
// 							.text(member.memName+"상태:"+member.memDelete)
// 							);

			 let text = $("<li>").html(
				 		$("<input>")
			 			.attr("type","checkbox")
			 			.attr("name","memId")
			 			.attr("value",member.memId)
			 			).append(member.memName+"상태:"+member.memDelete);
				texts.push(text);
						
			});
			console.log(texts);
// 			$("#onLineUser").append(texts);
			$("#modalList").append(texts);

		
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	
});


$(document).on("click","#create",function(event){
	event.preventDefault();
	let memIds = [];
	$("[name=memId]:checked").each(function(){
		let checkMemId = $(this).val();
		memIds.push(checkMemId);
	});
	
	alert(memIds.toString());
	$.ajax({
		url : "${pageContext.request.contextPath}/autumn/insertChatRoom.do",
		
// 		url : cf_getContextPath()+"/chat/allMemberList.do",
		method : "post",
		data : {"memId" : memIds},
		dataType : "json", // Accept vs Content-Type
		success : function(resp) {
			let chatRoom = resp;
			location.href= "${pageContext.request.contextPath }/chat/chat.do?roomId="+chatRoom.roomId+"&roomName="+chatRoom.roomName;
			
			
		
	

		
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	return false;
});

</script>