void function($){
     $('input[type="file"]').on("change", function(){
   var $this = $(this)
    // Get a reference to the fileList
    var files = !!this.files ? this.files : [];
    // If no files were selected, or no FileReader support, return
    if (!files.length || !window.FileReader) return;
    // Only proceed if the selected file is an image
    if (/^image/.test( files[0].type)){
        // Create a new instance of the FileReader
        var reader = new FileReader();
        // Read the local file as a DataURL
        reader.readAsDataURL(files[0]);
        // When loaded, set image data as background of div
        reader.onloadend = function(){
            $this.parent().siblings('.img_content').css("background-image","url("+this.result+")");
            if($this.parent('.submitAvatar'))
            $this.parent('.submitAvatar').find('img').attr('src',this.result)
        }
    }
});


$('input[name="avatar"]').on('change',function(){
  $(this).closest('form').submit()
})
$('.nickname.button').state({
  text:{
    inactive:'<i class="edit icon"></i>修改昵称',
    active:'<i class="checkmark icon"></i>确认修改',
  },
  onActivate:function(e){
    nickname = $('.input.nickname').text()
    $('.input.nickname').html('<input class="ui input fluid" type="text" name="nickname">').find('input[name="nickname"]').val(nickname)
    },
  onDeactivate:function(){
    $form = $(this).closest('form')
    $.post($form.attr('action'),$form.serialize(),function(data){
      $('.input.nickname').html(data)
    })
  }
})

}(window.jQuery)
