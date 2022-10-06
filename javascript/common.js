// Navigation
$('#menu-toggle').click(function () {
    var $body = $('body'),
        $menu = $('.nav-container'),
        $hamburger = $('.hamburger');
    $body.toggleClass('menu-open')
    if ($body.hasClass('menu-open')) {
        $menu.addClass('menu-active');
        $hamburger.addClass('is-active');
    } else {
        $menu.removeClass('menu-active');
        $hamburger.removeClass('is-active');
    }
});