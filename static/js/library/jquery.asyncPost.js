void function ($) {

  function asyncPost($form) {
    $form.on('submit.asyncPost', function (event) {
      $form.find('[type="submit"]').addClass('loading')
      event.preventDefault()
      $.ajax({
        url: $form.attr('action'),
        method: $form.attr('method'),
        data: $form.serialize(),
        success: function () {
          $form.trigger("success")
        },
        error: function (xhr) {
          $form.trigger("fail", [xhr.status, xhr.responseText])
        },
        complete: function () {
          $form.trigger("complete")
        }
      })
    }).on('fail', function (_,status,textStatus) {
      $form.find('[type="submit"]').removeClass('loading')
      var $error = $(this).find('.error')
      if($error.length!=0){
        var errorText = $error.data(status.toString())
        $error.text(errorText ? errorText : textStatus)
      }
    })
    .on('success',function(){
      $form.find('[type="submit"]').removeClass('loading').find('i').removeClass().addClass('checkmark icon')
      var $error = $(this).find('.error')
      if($error.length!=0){
        //$error.text("提交成功！")
        $form[0].reset()
      }
    })
  }

  $.fn.asyncPost = function () {
    this.filter('form').each(function () {
      asyncPost($(this))
    })
    return this
  }

  $(function () {
    $('form[data-async="post"]').asyncPost()
  })
} (window.jQuery)
