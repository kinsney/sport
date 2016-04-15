;(function($){
    $.fn.extend({
        recSelector:function(data){
            function isArray(ary){
                return ary instanceof Array
            }
            function isNullObj(obj){
                for(var i in obj){
                    if(obj.hasOwnProperty(i)){
                        return false;
                    }
                }
                return true;
            }
            function renderLists(obj,$selector,$control,level){
                var $search=$selector.find("input")
                $selector.find(".jq-rs-content>ul").each(function(){
                    var $this=$(this)
                    var index=$this.index()+1
                    if(index>level){$this.remove()}
                })
                if(isNullObj(obj)){
                    $selector.find(".jq-rs-content").append("<ul><li>"+empty+"</li></ul>")
                }
                else{
                    $ul=$("<ul></ul>").appendTo($selector.find(".jq-rs-content"))
                    if(isArray(obj)){
                        for(var i=0;i<obj.length;i++){
                            if(obj[i])$ul.append('<li>'+obj[i]+'</li>')
                        }
                        $ul.on("click","li",function(){
                            var path=[]
                            $control.val($(this).text()).trigger('change')
                            $selector.find(".active").each(function(){
                                path.push($(this).text())
                            })
                            $control.data("path",path)
                            $selector.fadeOut(function(){$selector.find("input").hide()})
                        })
                        $empty=$("<li>"+empty+"</li>").appendTo($ul).hide().click(function(e){e.stopPropagation()})
                    }
                    else{
                        for(var item in obj){
                            $ul.append('<li>'+item+'</li>')
                        }
                        $ul.on("click","li",function(){
                            var $this=$(this)
                            $('.jq-rs-content').animate({'scrollTop':$this.parent().height()},500);
                            $this.siblings(".active").removeClass("active")
                            $this.addClass("active")
                            if(isArray(obj[$this.text()])&&obj[$this.text()].length>8){$search.show()}
                            else{$search.hide();$search.val("")}
                            renderLists(obj[$this.text()],$selector,$control,level+1)
                        })
                    }
                }
            }

            var empty=data.config.empty||"暂无数据",
                title=data.config.title||"请选择",
                $body=$('body'),
                $control=$(this),
                control=$control[0],
                index=$('.jq-rs').length

            $control.attr("readonly",true).css("cursor","pointer")
            $selector=$('<div class="jq-rs"><div class="jq-rs-title"><input placeholder="搜索" type="text" /><span>'+data.config.title+'</span></div><div class="jq-rs-content"></div></div>').appendTo($body)
            var recdata=data.data

            if($body.css('position')=='static')$body.css('position','relative')
            $control.on('click',function(e){
                var controlOffsetX=control.offsetLeft-parseInt($body.css("margin-left")),
                    controlOffsetY=control.offsetTop-parseInt($body.css("margin-top"))+parseInt($control.height())+parseInt($control.css("padding-top"))+parseInt($control.css("padding-bottom"))+parseInt($control.css("border-top-width"))+parseInt($control.css("border-bottom-width"))
                    selectorOffsetX=controlOffsetX,
                    selectorOffsetY=controlOffsetY,
                    selectorWidth=$selector.width(),
                    controlWidth=$control.width()+parseInt($control.css("padding-left"))+parseInt($control.css("padding-right"))
                    windowWidth=$(window).width()

                if((selectorOffsetX+selectorWidth)>windowWidth){
                    selectorOffsetX=selectorOffsetX-selectorWidth+controlWidth
                }

                $selector.fadeToggle(200)
                renderLists(recdata,$selector,$control,0)
            })
            $selector.on("keyup",".jq-rs-title>input",function(){
                var value=$(this).val()
                    $li=$selector.find("ul:last-child li")
                    $empty=$li.last()
                    $empty.show()
                $li.each(function(){
                    var $this=$(this)
                    if($this.text().indexOf(value)==-1&&$this.index()!=$li.length-1){
                        $this.hide()
                    }else if($this.index()!=$li.length-1){
                        $this.show()
                        $empty.hide()
                    }
                })
            })
            $(window).on("resize",function(){$selector.fadeOut(function(){$selector.find("input").hide()})})
            $("body").on("click",function(e){
                var $target=$(e.target)
                if($target[0]!=$control[0]&&$selector.find($target).length==0)$selector.fadeOut(function(){$selector.find("input").hide()})
            })
            return this
        }
    })
})(jQuery);
