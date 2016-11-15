void function($){
  $('#starttimecal').datetimepicker({

    language:'zh-CN',

  });
  $('#endtimecal').datetimepicker({

    language:'zh-CN',

  });
  $('.ui.accordion').accordion()
  function resize(){
        $('#leftblock').height($('body').height()-$('.head').outerHeight())
  }
  resize()
  $(window).resize(resize)
}(window.jQuery)
