$(document).ready(function(){
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      themeSystem: 'bootstrap4',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listMonth'
      },
      weekNumbers: false,
      eventLimit: true,
      disableDragging: true,
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/events.json',

      // customButtons: {
      //   details: {
      //     text: 'New Event',
      //     click: function() {
      //       $('#new_event').modal();
      //     }
      //   }
      // },

      select: function(start, end) {
        var today = new Date();
        if (today <= start._d) {
          // console.log("sdsds");
          // console.log(event.event_name);
          $.getScript('/events/new', function() {
            $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
            date_range_picker();
            $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
            $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
          });

          calendar.fullCalendar('unselect');
        }
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function(event, jsEvent, view) {
        var today = new Date();
        if (event.event_name == "event"){
          var end = event.end.length > 0 ? event.end : event.start
          if (today <= end._d) {
            $.getScript(event.edit_url, function() {
              $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
              date_range_picker();
              $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
              $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
              if ($('#event_is_public').is(':checked')){
                $(".event-course").hide();
              }else{
                $(".event-course").show();
              }
            });
          }
        }else{
          $.getScript(event.show_url, function(){});
        }
      }
    });
  })
});

$(document).ready(function(){
  $('.calendar2').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today, details',
        center: 'title',
        right: 'month,listMonth'
      },
      disableDragging: true,
      selectable: true,
      selectHelper: true,
      editable: false,
      eventLimit: true,
      views: {
        month: {
          eventLimit: 2
        }
     },
      events: '/events.json',

      select: function(start, end) {
        var today = new Date();
        if (today <= start._d) {
          $.getScript('/events/new', function() {
            $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
            date_range_picker();
            $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
            $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
          });

          calendar.fullCalendar('unselect');
        }
      },
      
      eventClick: function(event, jsEvent, view) {
        var today = new Date();
        if (event.event_name == "event"){
          var end = event.end == null ? event.start : event.end
          if (today <= end) {
            $.getScript(event.edit_url, function() {
              $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
              date_range_picker();
              $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
              $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
              if ($('#event_is_public').is(':checked')){
                $(".event-course").hide();
              }else{
                $(".event-course").show();
              }
            });
          }
        }else{
          $.getScript(event.show_url, function(){});
        }
      }
    });
  })
});

// Date Range Picker
function date_range_picker() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        alwaysShowCalendars: true,
        minDate: new Date()
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
  })
};

$(document).on('click', '#event_is_public', function(){
  if ($(this).is(':checked')){
    $(".event-course").hide();
  }else{
    $(".event-course").show();
  }
});

$(document).on('click', '.new-event-btn', function(){
  $.getScript('/events/new', function() {
    start = new Date();
    end = start.setDate(start.getDate() + 2);
    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
    date_range_picker();
    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
  });
});

$(document).on("click", ".self-event-btn", function(){
  $.getScript('/self_event', function() {
    start = new Date();
    end = start.setDate(start.getDate() + 2);
    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
    date_range_picker();
    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
  });
});

$(document).on('click', '#announcement_is_public', function(){
  if ($(this).is(':checked')){
    $(".announcement-course").hide();
  }else{
    $(".announcement-course").show();
  }
});
