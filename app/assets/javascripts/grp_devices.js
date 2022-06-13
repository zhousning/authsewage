$(".grp_devices").ready(function() {
  if ($(".grp_devices.index").length > 0) {
    getGrpDeviceItems('grp_devices');
  }
});

function getGrpDeviceItems(method) {
  var $table = $('#item-table')
  var url = "/" + method + "/query_all";
  $.get(url).done(function (objs) {
    var data = [];
    $.each(objs, function(index, item) {
      data.push({
        'id' : index + 1,
        'fct' : item.fct,
        'idno' : item.idno,
        'name' : item.name,
        'mdno' : item.mdno,
        'unit' : item.unit,
        'pos' : item.pos,
        'supplier' : item.supplier,
        'state' : item.state,
        'pos_no' : item.pos_no
      });
    });
    $table.bootstrapTable('load', data);
  })
}

