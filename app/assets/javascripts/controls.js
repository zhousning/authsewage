$(".controls.index").ready(function() {
  if ($(".controls.index").length > 0) {
    var table = "#day-pdt-rpt-table";
    var url = '/grp_static/query_by_area';

    loadSelectData('/grp_static/query_device')

    $(".area-time-search").on('click', function(e) {
      var start = $("#start").val();
      var fct = $("#fct").val();
      
      request_params = {start: start, fct: fct}
      $.get(url, request_params).done(function (obj) {
        console.log(obj);
        var html = '<caption>今日签到人数</caption>'; 
        $.each(obj, function(town, value) {
          var town_count = 0;
          var country_html = ''
          var sum = 0;
          var first_html = ''
          $.each(value, function(country, count) {
            town_count += count;
            sum += 1;
            if (sum == 1) {
              first_html = '<td>' + country + '(' + count + ')</td>';
            } else {
              country_html += '<tr><td>' + country + '(' + count + ')</td></tr>'; 
            }
          })
          html += '<tr><td rowspan=' + sum + '>' + town + '(' + town_count + ')</td>' + first_html + '</tr>' + country_html 
        })
        $(table).html(html);
      })
    })
  }
});

