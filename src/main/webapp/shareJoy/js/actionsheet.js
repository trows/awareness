/**
 * Created by jf on 2015/9/11.
 */

$(function () {
      //点击上滑层
      $('#showActionSheet').click(function() {
               $('.share-box').show();
              var mask = $('#mask');
              var weuiActionsheet = $('#weui_actionsheet');
              weuiActionsheet.addClass('weui_actionsheet_toggle');
              mask.show().addClass('weui_fade_toggle').click(function () {
                        $(".share-box").hide();
                        hideActionSheet(weuiActionsheet, mask);
             });
            $('#actionsheet_cancel').click(function () {
                         $('.share-box').hide();
                        hideActionSheet(weuiActionsheet, mask);
            });
            weuiActionsheet.unbind('transitionend').unbind('webkitTransitionEnd');
            function hideActionSheet(weuiActionsheet, mask) {
                    weuiActionsheet.removeClass('weui_actionsheet_toggle');
                    mask.removeClass('weui_fade_toggle');
                    weuiActionsheet.on('transitionend', function () {
                        mask.hide();
                    }).on('webkitTransitionEnd', function () {
                        mask.hide();
                    })
                }
      });
     //选项卡
     $(".act-btn li").click(function(){
       $(".act-btn li").eq($(this).index()).addClass('active').siblings().removeClass('active');
       $(".myact").hide().eq($(this).index()).show();
     });

     //分享指示弹出层
     $('.share').click(function(event) {
       $('.dialog').show();
     });
     $('.dialog').click(function(event) {
       $(this).hide();
     });
     
});