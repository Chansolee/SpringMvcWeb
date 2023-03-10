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

        <!-- ?????? ????????? ???????????? / ???????????? ?????? ????????? ?????? -->
        <div  id="contextMenu" class="dropdown clearfix"> 
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">????????????1</a></li>
                <li><a tabindex="-1" href="#">????????????2</a></li>
                <li><a tabindex="-1" href="#">????????????3</a></li>
                <li><a tabindex="-1" href="#">????????????4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- ?????? ?????? MODAL -->
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
                                <label class="col-xs-4" for="edit-allDay">????????????</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">?????????</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">??????</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">???</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">??????</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="????????????1">????????????1</option>
                                    <option value="????????????2">????????????2</option>
                                    <option value="????????????3">????????????3</option>
                                    <option value="????????????4">????????????4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">??????</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">?????????</option>
                                    <option value="#9775fa" style="color:#9775fa;">?????????</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">?????????</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">?????????</option>
                                    <option value="#f06595" style="color:#f06595;">?????????</option>
                                    <option value="#63e6be" style="color:#63e6be;">?????????</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">?????????</option>
                                    <option value="#4d638c" style="color:#4d638c;">??????</option>
                                    <option value="#495057" style="color:#495057;">?????????</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">??????</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                        <button type="button" class="btn btn-primary" id="save-event">??????</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">??????</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">??????</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">??????</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">?????????</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="????????????1">????????????1</option>
                            <option value="????????????2">????????????2</option>
                            <option value="????????????3">????????????3</option>
                            <option value="????????????4">????????????4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                 <button type="button" class="btn btn-primary" id="insert">??????</button>
                    <label for="calendar_view">????????????</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
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
  firstDay                  : 0, // ???????????? ?????? ?????? ????????? 1
  weekNumbers               : false,
  selectable                : true,
  weekNumberCalculation     : "ISO",
  eventLimit                : true,
  views                     : { 
                                month : { eventLimit : 12 } // ??? ????????? ?????? ????????? 12???,
															// ???????????? + ?????????
                              },
  eventLimitClick           : 'week', // popover
  navLinks                  : true,
  defaultDate               : moment('2019-05'), // ?????? ????????? ?????? ????????? ??????
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
                                  titleFormat  : 'YYYY??? M??? D???',
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
  customButtons             : { // ?????? ????????? & ????????? ??????
                                viewWeekends : {
                                  text  : '??????',
                                  click : function () {
                                    activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                                    $('#calendar').fullCalendar('option', { 
                                      weekends: activeInactiveWeekends
                                    });
                                  }
                                }
                               },


  eventRender: function (event, element, view) {

    // ????????? hover??? ??????
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
        }).append('<p><strong>?????????:</strong> ' + event.testUsername + '</p>')
        .append('<p><strong>??????:</strong> ' + event.testType + '</p>')
        .append('<p><strong>??????:</strong> ' + getDisplayEventDate(event) + '</p>')
        .append('<div class="popoverDescCalendar"><strong>??????:</strong> ' + event.testDescription + '</div>'),
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
	 * ?????? ????????? **************
	 */
  events: function (start, end, timezone, callback) {
    $.ajax({
      type: "get",
     url: "../resources/FullCalendar/data.json",
//       url: "${pageContext.request.contextPath }/calendar/calendarList2.do",
      data: {
        // ????????? ????????? Date ????????? start, end ??? ?????????
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
            array.testEnd = moment(array.testEnd).add(1, 'days'); // ?????? ?????? AllDay ?????????
															// ?????? ????????? ????????? ?????????
															// ????????? ????????????
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

  // ?????? ????????????
  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
    $('.popover.fade.top').remove();

    /**
	 * ??????????????? ????????? ???????????? ????????? ?????? ??????????????? ?????????.
	 */
    var newDates = calDateWhenResize(event);

    // ??????????????? ?????? ????????????
    $.ajax({
      type: "get",
      url: "",
      data: {
        // id: event._id,
        // ....
      },
      success: function (response) {
        alert('??????: ' + newDates.startDate + ' ~ ' + newDates.endDate);
      }
    });

  },

  eventDragStart: function (event, jsEvent, ui, view) {
    draggedEventIsAllDay = event.testAllday;
  },

  // ?????? ??????????????????
  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
    $('.popover.fade.top').remove();

    // ???,??? view?????? ?????? <-> ?????? ????????????
    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
      if (draggedEventIsAllDay !== event.testAllday) {
        alert('???????????????????????? ??????<->?????? ????????? ???????????????.');
        location.reload();
        return false;
      }
    }

    // ????????? ????????? ????????????
    var newDates = calDateWhenDragnDrop(event);

    // ????????? ?????? ????????????
    $.ajax({
      type: "get",
      url: "",
      data: {
        // ...
      },
      success: function (response) {
        alert('??????: ' + newDates.startDate + ' ~ ' + newDates.endDate);
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

    // ?????? ????????? ???????????? ????????????
    var $contextMenu = $("#contextMenu");
    $contextMenu.on("click", "a", function (e) {
      e.preventDefault();

      // ?????? ????????? ?????????
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

  // ????????? ????????? ???????????????
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
    displayEventDate = "????????????";
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
  // ????????? ????????? ????????????
  var newDates = {
    startDate: '',
    endDate: ''
  }

  // ?????? & ????????? ?????? ?????? ??????
  if(!event.testEnd) {
    event.testEnd = event.testStart;
  }

  // ???????????? all day
  if (event.testAllday && event.testEnd === event.testStart) {
    console.log('1111')
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD');
    newDates.endDate = newDates.startDate;
  }

  // 2????????? all day
  else if (event.testAllday && event.testEnd !== null) {
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.testEnd._d).subtract(1, 'days').format('YYYY-MM-DD');
  }

  // all day??? ??????
  else if (!event.testAllday) {
    newDates.startDate = moment(event.testStart._d).format('YYYY-MM-DD HH:mm');
    newDates.endDate = moment(event.testEnd._d).format('YYYY-MM-DD HH:mm');
  }

  return newDates;
}
    
    </script>

    
<!-- </body> -->

<!-- </html> -->