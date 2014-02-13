$(document).ready(function () {
    $(".hoverli1").hover(
        function () {
            $('ul.file_menu1').stop().slideDown('fast');
        },
        function () {
            $('ul.file_menu1').slideUp('fast');
        }
    );
});

$(document).ready(function () {
    $(".hoverli2").hover(
        function () {
            $('ul.file_menu2').stop().slideDown('fast');
        },
        function () {
            $('ul.file_menu2').slideUp('fast');
        }
    );

//    $(".file_menu li").hover(
//        function () {
//            $(this).children("ul").slideDown('medium');
//        },
//        function () {
//            $(this).children("ul").slideUp('medium');
//        }
//    );
});