<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html lang="ko"> -->

<!-- <head> -->
<!--     <meta charset="utf-8" /> -->
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <title>FullCalendar Example</title> -->
    <link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/FullCalendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/FullCalendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${pageContext.request.contextPath }/resources/FullCalendar/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.request.contextPath }/resources/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/FullCalendar/css/main.css">
    
    <script type="text/javascript" src='${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/jquery.min.js'></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
<%--     <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/main.js"></script> --%>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/addEvent.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/editEvent.js"></script>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/etcSetting.js"></script>

<!-- </head> -->

<!-- <body> -->
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 / 아이디에 클릭 이벤트 준듯 -->
        <div  id="contextMenu" class="dropdown clearfix"> 
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">카테고리1</a></li>
                <li><a tabindex="-1" href="#">카테고리2</a></li>
                <li><a tabindex="-1" href="#">카테고리3</a></li>
                <li><a tabindex="-1" href="#">카테고리4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                 <button type="button" class="btn btn-primary" id="insert">추가</button>
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
    <script>
    $("#insert").on("click", function(){
//     	alert("gd");
		$("#eventModal").modal('show');
// 		 eventModal.modal('show');
		
	})
	
	var draggedEventIsAllDay;
var activeInactiveWeekends = true;

var calendar = $('#calendar').fullCalendar({

 /***************************************************************************
	 * OPTIONS
	 **************************************************************************/
  locale                    : 'ko',    
  timezone                  : "local", 
  nextDayThreshold          : "09:00:00",
  allDaySlot                : true,
  displayEventTime          : true,
  displayEventEnd           : true,
  firstDay                  : 0, // 월요일이 먼저 오게 하려면 1
  weekNumbers               : false,
  selectable                : true,
  weekNumberCalculation     : "ISO",
  eventLimit                : true,
  views                     : { 
                                month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개,
															// 나머지는 + 처리됨
                              },
  eventLimitClick           : 'week', // popover
  navLinks                  : true,
  defaultDate               : moment('2019-05'), // 실제 사용시 현재 날짜로 수정
  timeFormat                : 'HH:mm',
  defaultTimedEventDuration : '01:00:00',
  editable                  : true,
  minTime                   : '00:00:00',
  maxTime                   : '24:00:00',
  slotLabelFormat           : 'HH:mm',
  weekends                  : true,
  nowIndicator              : true,
  dayPopoverFormat          : 'MM/DD dddd',
  longPressDelay            : 0,
  eventLongPressDelay       : 0,
  selectLongPressDelay      : 0,  
  header                    : {
                                left   : 'today, prevYear, nextYear, viewWeekends',
                                center : 'prev, title, next',
                                right  : 'month, agendaWeek, agendaDay, listWeek'
                              },
  views                     : {
                                month : {
                                  columnFormat : 'dddd'
                                },
                                agendaWeek : {
                                  columnFormat : 'M/D ddd',
                                  titleFormat  : 'YYYY년 M월 D일',
                                  eventLimit   : false
                                },
                                agendaDay : {
                                  columnFormat : 'dddd',
                                  eventLimit   : false
                                },
                                listWeek : {
                                  columnFormat : ''
                                }
                              },
  customButtons             : { // 주말 숨기기 & 보이기 버튼
                                viewWeekends : {
                                  text  : '주말',
                                  click : function () {
                                    activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                                    $('#calendar').fullCalendar('option', { 
                                      weekends: activeInactiveWeekends
                                    });
                                  }
                                }
                               },


  eventRender: function (event, element, view) {

    // 일정에 hover시 요약
    element.popover({
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: event.testTitle
        
      }).css({
        'background': event.testBackgroundcolor,
        'color': event.testTextcolor
      }),
      content: $('<div />', {
          class: 'popoverInfoCalendar'
        }).append('<p><strong>등록자:</strong> ' + event.testUsername + '</p>')
        .append('<p><strong>구분:</strong> ' + event.testType + '</p>')
        .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.testDescription + '</div>'),
      delay: {
        show: "800",
        hide: "50"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
    });

    return filtering(event);

  },

  /***************************************************************************
	 * 일정 받아옴 **************
	 */
  events: function (start, end, timezone, callback) {
    $.ajax({
      type: "get",
     url: "../resources/FullCalendar/data.json",
//       url: "${pageContext.request.contextPath }/calendar/calendarList2.do",
      data: {
        // 화면이 바뀌면 Date 객체인 start, end 가 들어옴
        // startDate : moment(start).format('YYYY-MM-DD'),
        // endDate : moment(end).format('YYYY-MM-DD')
      },
      dataType : "json",
      success: function (response) {
    	  console.log(response);
        var fixedDate = response.map(function (array) {
        	if(array.testAllday ==1){
        		array.testAllday =true;
        	}else{
        		array.testAllday =false;
        	}
        	
          if (array.testAllday && array.testStart !== array.testEnd) {
            array.testEnd = moment(array.testEnd).add(1, 'days'); // 이틀 이상 AllDay 일정인
															// 경우 달력에 표기시 하루를
															// 더해야 정상출력
          }
          return array;
        });
        console.log(fixedDate);
        callback(fixedDate);
      }
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") $(".fc-content").css('height', 'auto');
  },

  // 일정 리사이즈
  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
    $('.popover.fade.top').remove();

    /**
	 * 리사이즈시 수정된 날짜반영 하루를 빼야 정상적으로 반영됨.
	 */
    var newDates = calDateWhenResize(event);

    // 리사이즈한 일정 업데이트
    $.ajax({
      type: "get",
      url: "",
      data: {
        // id: event._id,
        // ....
      },
      success: function (response) {
        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
      }
    });

  },

  eventDragStart: function (event, jsEvent, ui, view) {
    draggedEventIsAllDay = event.testAllday;
  },

  // 일정 드래그앤드롭
  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
    $('.popover.fade.top').remove();

    // 주,일 view일때 종일 <-> 시간 변경불가
    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
      if (draggedEventIsAllDay !== event.testAllday) {
        alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
        location.reload();
        return false;
      }
    }

    // 드랍시 수정된 날짜반영
    var newDates = calDateWhenDragnDrop(event);

    // 드롭한 일정 업데이트
    $.ajax({
      type: "get",
      url: "",
      data: {
        // ...
      },
      success: function (response) {
        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
      }
    });

  },

  select: function (startDate, endDate, jsEvent, view) {

    $(".fc-body").unbind('click');
    $(".fc-body").on('click', 'td', function (e) {

      $("#contextMenu")
        .addClass("contextOpened")
        .css({
          display: "block",
          left: e.pageX,
          top: e.pageY
        });
      return false;
    });

    var today = moment();

    if (view.name == "month") {
      startDate.set({
        hours: today.hours(),
        minute: today.minutes()
      });
      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
      endDate = moment(endDate).subtract(1, 'days');

      endDate.set({
        hours: today.hours() + 1,
        minute: today.minutes()
      });
      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    } else {
      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    }

    // 날짜 클릭시 카테고리 선택메뉴
    var $contextMenu = $("#contextMenu");
    $contextMenu.on("click", "a", function (e) {
      e.preventDefault();

      // 닫기 버튼이 아닐때
      if ($(this).data().role !== 'close') {
        newEvent(startDate, endDate, $(this).html());
      }

      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

    $('body').on('click', function () {
      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

  },

  // 이벤트 클릭시 수정이벤트
  eventClick: function (event, jsEvent, view) {
    editEvent(event);
  }

});

function getDisplayEventDate(event) {

  var displayEventDate;

  if (event.testAllday == false) {
    var startTimeEventInfo = moment(event.testStart).format('HH:mm');
    var endTimeEventInfo = moment(event.testEnd).format('HH:mm');
    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
  } else {
    displayEventDate = "하루종일";
  }

  return displayEventDate;
}

function filtering(event) {
  var show_username = true;
  var show_type = true;

  var username = $('input:checkbox.filter:checked').map(function () {
    return $(this).val();
  }).get();
  var types = $('#type_filter').val();

  show_username = username.indexOf(event.testUsername) >= 0;

  if (types && types.length > 0) {
    if (types[0] == "all") {
      show_type = true;
    } else {
      show_type = types.indexOf(event.testType) >= 0;
    }
  }

  return show_username && show_type;
}

function calDateWhenResize(event) {

  var newDates = {
    startDate: '',
    endDate: ''
  };

  if (event.testAllday) {
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.testEnd._d).subtract(1, 'days').format('YYYY-MM-DD');
  } else {
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD HH:mm');
    newDates.endDate = moment(event.testEnd._d).format('YYYY-MM-DD HH:mm');
  }

  return newDates;
}

function calDateWhenDragnDrop(event) {
  // 드랍시 수정된 날짜반영
  var newDates = {
    startDate: '',
    endDate: ''
  }

  // 날짜 & 시간이 모두 같은 경우
  if(!event.testEnd) {
    event.testEnd = event.testStart;
  }

  // 하루짜리 all day
  if (event.testAllday && event.testEnd === event.testStart) {
    console.log('1111')
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD');
    newDates.endDate = newDates.startDate;
  }

  // 2일이상 all day
  else if (event.testAllday && event.testEnd !== null) {
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.testEnd._d).subtract(1, 'days').format('YYYY-MM-DD');
  }

  // all day가 아님
  else if (!event.testAllday) {
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD HH:mm');
    newDates.endDate = moment(event.testEnd._d).format('YYYY-MM-DD HH:mm');
  }

  return newDates;
}
    
    </script>

    
<!-- </body> -->

<!-- </html> -->