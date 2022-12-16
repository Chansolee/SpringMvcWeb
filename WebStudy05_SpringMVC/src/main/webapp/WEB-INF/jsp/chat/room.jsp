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
            <div id="testList">
            	  <p>현재접속자</p>
            	  <ul id="onLineUser">
				<c:forEach var="singleSession" items="${allWsSessions}"> 
				<c:set var="url" value="${pageContext.request.contextPath }/chat/chat.do?roomId=${singleSession.principal.realUser.memId}&roomName=${singleSession.principal.realUser.memName}" />
				<li><a href="${url }"><c:out value="${singleSession.principal.realUser.memName}" /></a></li>
				</c:forEach>	
                </ul>
                <input type="button" value="+"  id="memberList"
                class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#tooltippopovers"
                >
            </div>
            
            <div>
            	 <p>채팅방</p>
                <ul id="roomList">
				<c:forEach var="chatRoomVO" items="${chatList}">
				<c:set var="url" value="${pageContext.request.contextPath }/chat/chat.do?roomId=${chatRoomVO.roomId }&roomName=${chatRoomVO.roomName }" />

			    <li><a href="${url }"><c:out value="${chatRoomVO.roomName}" /></a></li>
				</c:forEach>	
                </ul>
            </div>
        </div>
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
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
 
	<script type="text/javascript">

		
			
// 			$.ajax({
// 				url : "${pageContext.request.contextPath}/chat/roomList.do",
// 				method : "get",
// 				data : "",
// 				dataType : "json",
// 				success : function(resp) {
// 		 			let chatRoom = resp;
// 		 			let viewURL = "${pageContext.request.contextPath }/chat/chat.do?roomId="+chatRoom.roomId;
					
// 		 				let room = $("<li>").html($("<a>").attr("href", viewURL)
// 		 											.text(chatRoom.roomName));
						
// 		 			let list = $("#roomList");
// 		 			list.append(room);

// 				},
// 				error : function(xhr) {
// 					console.log(xhr.status);
// 				}
// 			});
		
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
		url : "${pageContext.request.contextPath}/chat/allMemberList.do",
		
// 		url : cf_getContextPath()+"/chat/allMemberList.do",
		method : "get",
		
		dataType : "json", // Accept vs Content-Type
		success : function(resp) {
			
		
						
			let list = resp;
			let texts =[];
			$.each(list, function(index,member){
			
			let url = "${pageContext.request.contextPath }/chat/chat.do?roomId="+member.memId+"&roomName="+member.memName 

				let text =  $("<li>").html(
							$("<a>").attr("href",url)
							.attr("id","amem")
							.attr("data-value",member.memDelete)
							.text(member.memName+"상태:"+member.memDelete)
							);

				
				texts.push(text);
						
			});
// 			console.log(texts);
// 			$("#onLineUser").append(texts);
			$("#modalList").append(texts);
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
});

$(document).on("click", '#amem',function(event){ //비접속자에게 채팅 못하게하는 로직임 
	let memDelete=$(this).data('value');
	if(memDelete==0){
		alert("비접속자와는 메신저를 할 수 없습니다!");
		event.preventDefault();
	}
	
});
</script>