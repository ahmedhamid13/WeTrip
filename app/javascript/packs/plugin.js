// Owl Carousel tours
$('.owl-tours').owlCarousel({
    loop:false,
    margin:5,
    responsiveClass:true,
    rtl: true,
    nav: true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
});
// Owl Carousel Images
$('.owl-img').owlCarousel({
    loop:false,
    margin:5,
    responsiveClass:true,
    rtl: true,
    nav: true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:4
        }
    }
});
// Flex Slider
$(window).load(function() {
  $('.cat-slider').flexslider({
    animation: "slide",
    controlNav: "thumbnails",
    rtl: true
  });
});
// Confirm button in checkout page
$(function () {
    $(".confirm-btn").on("click", function () {
        $(".confirm-btn").hide();
        $(".strong-block").show(4000);
    });
});
