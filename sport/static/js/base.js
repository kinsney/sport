void function($){
    $('.rating')
  .rating({
    maxRating: 5
  }).filter('.readonly').rating('disable')


    $dropdownItem = $('.dropdown');
    $dropdownItem.dropdown({on:'hover',allowAdditions: true})

    $menuItem = $('.container .menu .item').not($dropdownItem)
    $menuItem.tab()
}(window.jQuery)
