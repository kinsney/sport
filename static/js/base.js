void function($){
    $('.rating')
  .rating({
    maxRating: 5
  }).filter('.readonly').rating('disable')

    $('.ui.modal').modal()
    if($('.toc.item').is('a'))$('.ui.sidebar').sidebar('attach events', '.toc.item');
    $dropdownItem = $('.dropdown');
    $dropdownItem.dropdown({on:'hover',allowAdditions: true})

    $menuItem = $('.container .menu .item').not($dropdownItem)
    $menuItem.tab()
}(window.jQuery)
