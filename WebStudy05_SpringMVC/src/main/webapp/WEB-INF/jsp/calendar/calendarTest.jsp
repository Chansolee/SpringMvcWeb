<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">
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

    
 

</head>

<body>

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
    let draggedEventIsAllDay;
    let activeInactiveWeekends = true;

    let calendar = $('#calendar').fullCalendar({

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
        // ?????? ?????? ?????? ????????? ??????
       element.popover({
          title: $('<div />', {
            class: 'popoverTitleCalendar',
            text: event.title
          }).css({
            'background': event.backgroundColor,
            'color': event.textColor
          }),
          content: $('<div />', {
              class: 'popoverInfoCalendar'
            }).append('<p><strong>?????????:</strong> ' + event.username + '</p>')
            .append('<p><strong>??????:</strong> ' + event.type + '</p>')
            .append('<p><strong>??????:</strong> ' + getDisplayEventDate(event) + '</p>')
            .append('<div class="popoverDescCalendar"><strong>??????:</strong> ' + event.description + '</div>'),
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

          url: "${pageContext.request.contextPath }/calendar/calendarList2.do",
          data: {
            // ????????? ????????? Date ????????? start, end ??? ?????????
            // startDate : moment(start).format('YYYY-MM-DD'),
            // endDate : moment(end).format('YYYY-MM-DD')
          },
          dataType : "json",
          success: function (response) {
//         	  console.log(response);
            let fixedDate = response.map(function (array) {
            	if(array.allDay ==1){
            		array.allDay =true;
            	}else{
            		array.allDay =false;
            	}
            	
//             	console.log(array);
              if (array.allDay && array.start !== array.end) {
                array.end = moment(array.end).add(1, 'days'); // ?????? ?????? AllDay ?????????
    															// ?????? ????????? ????????? ?????????
    															// ????????? ???????????? ????????? ?????? 
              }
              return array;
            });
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
        let newDates = calDateWhenResize(event);

        // ??????????????? ?????? ????????????
        $.ajax({
          type: "get",
          url: "",
          data: {
            // id: event._id,
            // ....
          },
          success: function (response) {
        	  alert("zzzzz");
            alert('??????: ' + newDates.startDate + ' ~ ' + newDates.endDate);
          }
        });

      },

      eventDragStart: function (event, jsEvent, ui, view) {
        draggedEventIsAllDay = event.allDay;
      },

      // ?????? ??????????????????
      eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
        $('.popover.fade.top').remove();

        // ???,??? view?????? ?????? <-> ?????? ????????????
        if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
          if (draggedEventIsAllDay !== event.allDay) {
            alert('???????????????????????? ??????<->?????? ????????? ???????????????.');
            location.reload();
            return false;
          }
        }

        // ????????? ????????? ????????????
        let newDates = calDateWhenDragnDrop(event);
      

        let dropData = {
        		testId:  event._id,
        		testTitle: event.title,
        		testStart: newDates.startDate,
        		testEnd: newDates.endDate,
        		testDescription: event.description,
        		testType: event.type,
        		testUsername: event.username,//?????? ??????????????? ???????????? ???????????? ?????????????
        		testBackgroundcolor: event.backgroundColor,
        		testTextcolor: '#ffffff',
                testAllday: event.allDay
            };
       
        if(dropData.testAllday==true){
        	dropData.testAllday = 1;
        }else{
        	dropData.testAllday = 0;
        }
        
        // ????????? ?????? ????????????
        $.ajax({
          type: "post",
          url: "${pageContext.request.contextPath }/calendar/calendarUpdate.do",
          data: dropData ,
          success: function (response) {
        	 
            alert('??????: ' + newDates.startDate + ' ~ ' + newDates.endDate);
            location.href = "${pageContext.request.contextPath }/calendar/calendarList.do";
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

        let today = moment();

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
        let $contextMenu = $("#contextMenu");
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

      let displayEventDate;

      if (event.allDay == false) {
        let startTimeEventInfo = moment(event.start).format('HH:mm');
        let endTimeEventInfo = moment(event.end).format('HH:mm');
        displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
      } else {
        displayEventDate = "????????????";
      }

      return displayEventDate;
    }

    function filtering(event) {
      let show_username = true;
      let show_type = true;

      let username = $('input:checkbox.filter:checked').map(function () {
        return $(this).val();
      }).get();
      let types = $('#type_filter').val();
      console.log("types"+types);
      show_username = username.indexOf(event.username) >= 0;
      console.log("username"+username);

      if (types && types.length > 0) {
        if (types[0] == "all") {
          show_type = true;
        } else {
          show_type = types.indexOf(event.type) >= 0;
        }
      }

      return show_username && show_type;
    }

    function calDateWhenResize(event) {

      let newDates = {
        startDate: '',
        endDate: ''
      };

      if (event.allDay) {
        newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
        newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
      } else {
        newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
        newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
      }

      return newDates;
    }

    function calDateWhenDragnDrop(event) {
      // ????????? ????????? ????????????
      let newDates = {
        startDate: '',
        endDate: ''
      }

      // ?????? & ????????? ?????? ?????? ??????
      if(!event.end) {
        event.end = event.start;
      }

      // ???????????? all day
      if (event.allDay && event.end === event.start) {
        console.log('1111')
        newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
        newDates.endDate = newDates.startDate;
      }

      // 2????????? all day
      else if (event.allDay && event.end !== null) {
        newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
        newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
      }

      // all day??? ??????
      else if (!event.allDay) {
        newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
        newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
      }

      return newDates;
      
    }
    
//========================================================addEvent.js======================================================


let eventModal = $('#eventModal');

let modalTitle = $('.modal-title');
let editAllDay = $('#edit-allDay');
let editTitle = $('#edit-title');
let editStart = $('#edit-start');
let editEnd = $('#edit-end');
let editType = $('#edit-type');
let editColor = $('#edit-color');
let editDesc = $('#edit-desc');

let addBtnContainer = $('.modalBtnContainer-addEvent');
let modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  ????????? ?????? ??????
 * ************** */
let newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //?????? ??????

    modalTitle.html('????????? ??????');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');


    //????????? ?????? ???????????? ??????
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

//         let eventData = {
//             _id: eventId,
//             title: editTitle.val(),
//             start: editStart.val(),
//             end: editEnd.val(),
//             description: editDesc.val(),
//             type: editType.val(),
//             username: '??????',//?????? ??????????????? ???????????? ???????????? ?????????????
//             backgroundColor: editColor.val(),
//             textColor: '#ffffff',
//             allDay: 0
//         };

        
        let eventData = {
//         		testId: eventId,
        		testTitle: editTitle.val(),
        		testStart: editStart.val(),
        		testEnd: editEnd.val(),
        		testDescription: editDesc.val(),
        		testType: editType.val(),
        		testUsername: '??????',//?????? ??????????????? ???????????? ???????????? ?????????????
        		testBackgroundcolor: editColor.val(),
        		testTextcolor: '#ffffff',
                testAllday: 0
            };

        if (eventData.testStart > eventData.testEnd) {
            alert('????????? ????????? ?????? ??? ????????????.');
            return false;
        }

        if (eventData.testTitle === '') {
            alert('???????????? ???????????????.');
            return false;
        }

        let realEndDay;

        if (editAllDay.is(':checked')) {
        	//?????? ?????? ????????? ?????? ????????? ????????? ????????? format 
            eventData.testStart = moment(eventData.testStart).format('YYYY-MM-DD');

            eventData.testEnd = moment(eventData.testEnd).format('YYYY-MM-DD');

            eventData.testAllday = 1;
        } else{
        	eventData.testAllday = 0;
        }

        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //????????? ?????? ??????
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath }/calendar/calendarInsert.do",
            data: eventData,
            success: function (response) {
            	console.log(response);
            	 location.href = "${pageContext.request.contextPath }/calendar/calendarList.do"
                //DB????????? ??????????????? ????????? ??????
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};
    	
//===================================================??????=====================================================
//===================================================??????=====================================================
//===================================================??????=====================================================
			

let editEvent = function (event, element, view) {

    $('#deleteEvent').data('id', event._id); //????????? ????????? ID
    $('#updateEvent').data('id', event._id);
    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
//         editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
        editEnd.val(moment(event.end).format('YYYY-MM-DD HH:mm'));
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('?????? ??????');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //???????????? ?????? ?????????
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {
//     	alert("??????????");

        if (editStart.val() > editEnd.val()) {
            alert('????????? ????????? ?????? ??? ????????????.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('???????????? ???????????????.')
            return false;
        }

        let statusAllDay;
        let startDate;
        let endDate;
        let displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).subtract(1,'days').format('YYYY-MM-DD'); //????????? ?????? 1?????? ???????????? 1??? ?????????

        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
           
        }

        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = endDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
		
        
        
        
        let modifiedData = {
        		testId:  $(this).data('id'),
        		testTitle: event.title,
        		testStart: event.start,
        		testEnd: event.end,
        		testDescription: event.description,
        		testType: event.type,
        		testUsername: event.username,//?????? ??????????????? ???????????? ???????????? ?????????????
        		testBackgroundcolor: event.backgroundColor,
        		testTextcolor: '#ffffff',
                testAllday: event.allDay
            };
         if(modifiedData.testAllday==true){
        	 modifiedData.testAllday = 1;
         }else{
        	 modifiedData.testAllday = 0;
         }

        //?????? ????????????
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath }/calendar/calendarUpdate.do",
            data: modifiedData,
            success: function (response) {
                alert('????????????');
                location.href = "${pageContext.request.contextPath }/calendar/calendarList.do"
            }
        });

    });
};

// =========================????????????===============================================
// =========================????????????===============================================
// =========================????????????===============================================	
$('#deleteEvent').on('click', function () {
    
    $('#deleteEvent').unbind();
    let deleteId = $(this).data('id');
//     $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');

    //?????????
    $.ajax({
        type: "post",
        url: "${pageContext.request.contextPath }/calendar/calendarDelete.do",
        data: {
        	testId : deleteId
        },
        success: function (response) {
            alert('?????????????????????!');
            location.href = "${pageContext.request.contextPath }/calendar/calendarList.do"
        }
    });

});	
    	
    	
    	
    	</script>

</body>
<%--     <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/addEvent.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/editEvent.js"></script> --%>
    <script src="${pageContext.request.contextPath }/resources/FullCalendar/js/etcSetting.js"></script>
</html>
