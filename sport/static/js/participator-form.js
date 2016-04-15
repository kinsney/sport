void function($){
    $(function(){
        var $forms = $('#participator-forms')
        $('body').on('click', 'a[href="#login"], a[href="#register"]', function (event) {
            event.preventDefault()
            $forms.trigger($(this).attr('href'))
        })

        $forms.on('#login #register', function (event) {
            var href = event.type
            if ($forms.css('display') == 'none'){
                $forms.css('display', '')
            }

            $forms.find('.buttons>a').removeClass('positive').filter('[href="' + href + '"]').addClass('positive')
            $forms.find('form').css('display', 'none')
            $(href).slideDown();
        })

        $forms.on('click', function (event) {
            if ($(event.target).is('#participator-forms')) {
            $('#login:visible, #register:visible').slideUp(function(){$forms.fadeOut('fast');})
            }
        })

        $forms.find('form').on('submit', function () {
            $(this).find('.error').empty()
        }).on('success', function () {
            location.reload(true)
        }).on('fail', function (_, status) {
            var $error = $(this).find('.error')
            var errorText = $error.data(status.toString())
            $error.text(errorText)
        })

        $forms.find('[data-action]').click(function (event) {
            var $this = $(this).prop('disabled', true)
            var $form = $this.parents('form')
            var $error = $form.find('.error').empty()
            var phone = $form.find('[name="phone"]').val()
            var text = $this.text()

            function tick(seconds) {
                if (seconds > 0) {
                $this.animate({'width':'140px'}).css({'background-color':'#E0E1E2'}).text(seconds + ' 秒重新获取')
                setTimeout(tick, 1000, seconds - 1)
                } else {
                $this.text(text).animate({'width':'5em'}).css({'background-color':'##FF9600'})
                $this.prop('disabled', false)
                }
            }

            if (!/1\d{10}/.test(phone)) {
                $error.text('请输入合法的手机号码')
                $this.prop('disabled', false)
            } else {
            $.ajax({
                url: $this.data('action'),
                method: 'POST',
                data: $form.serialize(),
                success: function () {
                tick(60)
                },
            error: function (jqXHR, textStatus) {
                var $error = $form.find('.error')
                var errorText = $error.data(jqXHR.status.toString())
                $error.text(errorText ? errorText : textStatus)
                $this.prop('disabled', false)
            }
            })
            }
        })
        $forms.on('change','[name="agree"]',function(){
            $forms.find('[name="zhuce"]').prop('disabled',!$(this).prop('checked'))
            $(this).prop('checked')
            $forms.find('[name="zhuce"]').prop('disabled')
        })
    })
}(window.jQuery)
