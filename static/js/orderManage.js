void function($){
var currentTab;
$('.ui.modal').modal({
            blurring:true
         })
  $('.dynamic.menu .item').tab({
    apiSettings: {
      loadingDuration: 300,
      cache   : false,
      context : 'parent',
      auto    : true,
      alwaysRefrsh:true,
      history : false,
      url   : '/participator/ordermanage/{$tab}',
      method: 'post',
      data:{
        csrfmiddlewaretoken:$('input[name="csrfmiddlewaretoken"]').val()
      }
    },
    onLoad:function(tabPath){
      currentTab = tabPath
      $('.rating').rating({maxRating:5})
      $('.rating').not('.readonly').rating({onRate:function(value){
        $(this).parent('.reply').find('input[name="rating"]').val(value)
      }})
      $('.rating').filter('.readonly').rating('disable')
         $('.cancel').on('click',function(){
          $(this).hasClass('reject')?$('.rejectReason.modal').modal('show'):$('.withdrawReason.modal').modal('show')
          ordernumber = $(this).data('ordernumber')
            $('.send').api({
              url:'/participator/cancel/{ordernumber}',
              urlData:{
                ordernumber:ordernumber
              },
              method:'post',
              serializeForm:true,
              onSuccess:function(message){
                $('.modal').modal('hide')
                $('.dynamic.menu .item').tab('change tab',currentTab)
              },
              onError:function(message){
                  $('.modal').modal('hide')
                  $('.dynamic.menu .item').tab('change tab',currentTab)
              }
          })
         })
         $('.cancelTransaction').on('click',function(){
          $('.transactionCancel.modal').modal('show')
          trannumber = $(this).data('trannumber')
          $('.confirmCancel').api({
              url:'/participator/cancelTransaction/{trannumber}',
              urlData:{
                trannumber:trannumber
              },
              method:'post',
              data:{
              csrfmiddlewaretoken:$('input[name="csrfmiddlewaretoken"]').val()
              },
              onSuccess:function(message){
                $('.modal').modal('hide')
                $('.dynamic.menu .item').tab('change tab',currentTab)
              },
              onError:function(message){
                  $('.modal').modal('hide')
                  $('.dynamic.menu .item').tab('change tab',currentTab)
              }
          })
         })
         // 同意交易
         $('.nodTransaction').on('click',function(){
          $('.confirmTransaction.modal').modal('show')
          trannumber = $(this).data('trannumber')
          $('.transactionConfirm').api({
              url:'/participator/confirmTransaction/{trannumber}',
              urlData:{
                trannumber:trannumber
              },
              method:'post',
              data:{
              csrfmiddlewaretoken:$('input[name="csrfmiddlewaretoken"]').val()
              },
              onSuccess:function(message){
                $('.modal').modal('hide')
                $('.dynamic.menu .item').tab('change tab',currentTab)
              },
              onError:function(message){
                  $('.modal').modal('hide')
                  $('.dynamic.menu .item').tab('change tab',currentTab)
              }
          })
         })
         $('.changeStatus.button').api({
            url:'/participator/orderConfirm/{ordernumber}',
            method:'post',
            data:{
              csrfmiddlewaretoken:$('input[name="csrfmiddlewaretoken"]').val()
            },
            onSuccess:function(message){
                $('.dynamic.menu .item').tab('change tab',currentTab)
            },
            onError:function(message){
                $('.dynamic.menu .item').tab('change tab',currentTab)
            }
        })
         $('.reply .submit.button').api({
            url:'/participator/orderComment/{ordernumber}',
            method:'post',
            serializeForm:true,
            onSuccess:function(message){
                $('.dynamic.menu .item').tab('change tab',currentTab)
            },
            onError:function(message){
                $('.dynamic.menu .item').tab('change tab',currentTab)
            }
        })
        $('.actions a.reply').state({
              text:{
                      inactive:'回复',
                      active:'收起回复',
                  },
          onActivate:function(e){
                  $(this).closest('.comments').find('form.reply').slideDown()
              },
          onDeactivate:function(e){
            $(this).closest('.comments').find('form.reply').slideUp()
          }
        })
    }
  })
  $('.dynamic.menu .item').tab('change tab','recent')
}(window.jQuery)
