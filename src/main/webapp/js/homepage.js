/*$(document).ready(function(){
	/*$('.fl').focus(function(){
		var field = $(this);
		if (field.val()==field.attr('defaultValue')){
			field.val('');
		}
	});
    $('.menu-item').mousemove(function(){
      $(this).find('ul').slideDown();
});
    $('.menu-item').mouseleave(function(){
      $(this).find('ul').slideUp();
});
$('.slidejs-container').slidesjs({
        width: 940,
        height: 528,
        play: {
          active: true,
          auto: true,
          interval: 2000,
          swap: true
        }
      });
});*/
$(function () {
    var loca = window.location.href;
    loca = loca.toString();

    var first = $(".nav>li>a");
    var second = $(".catlog li a");

    for (var i = 0; i < first.length; i++) {
        var temp  = first[i].toString().split("/");
        var temp1 = temp[0]+"/"+temp[1]+"/"+temp[2]+"/"+temp[3];
       // alert(temp1);
        if (loca.search(temp1) != -1){
            $(".nav>li>a").eq(parseInt(i)).addClass("firstMenus").siblings().removeClass("firstMenus");
        }
    }

    for (var i = 0; i < second.length; i++) {
        // alert(second[i]);
        var temp1  = second[i].toString();
        if (loca.search(temp1) != -1){
            //alert(temp1);
            $(".catlog li a").eq(parseInt(i)).addClass("twoMenus").siblings().removeClass("twoMenus");
        }
    }

})