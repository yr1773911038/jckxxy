/*
  jQuery MegaMenu Plugin
  Author: GeekTantra
  Author URI: http://www.geektantra.com
*/
var isIE6 = navigator.userAgent.toLowerCase().indexOf('msie 6') != -1;

jQuery.fn.megamenu = function(options) {
  options = jQuery.extend({
		  activate_action: "mouseover",
		  deactivate_action: "mouseleave",
		  show_method: "fadeIn",
		  hide_method: "simple",
		  justify: "left",
		  enable_js_shadow: true,
		  shadow_size: 0,
		  mm_timeout: 0
	  }, options);
  var $megamenu_object = this;
  if( options.activate_action == "click" ) options.mm_timeout = 0;
  $megamenu_object.children("li").each(function(){
    jQuery(this).addClass("mm-item");
    jQuery(".mm-item").css({ 'float': options.justify });
    
    jQuery(this).find("div:first").addClass("mm-item-content");
    jQuery(this).find("a:first").addClass("mm-item-link");
    var $mm_item_content = jQuery(this).find(".mm-item-content");
    var $mm_item_link = jQuery(this).find(".mm-item-link");
    $mm_item_content.hide();
    
    jQuery(document).bind("click", function(){
      jQuery(".mm-item-content").hide();
      jQuery(".mm-item-link").removeClass("mm-item-link-hover");
    });
    jQuery(this).bind("click", function(e){
      e.stopPropagation();
    });
    $mm_item_content.wrapInner('<div class="mm-content-base"></div>');
    
    var $mm_timer = 0;
    // Activation Method Starts
    jQuery(this).bind(options.activate_action, function(e){
      e.stopPropagation();
      var mm_item_link_obj = jQuery(this).find("a.mm-item-link");
      var mm_item_content_obj = jQuery(this).find("div.mm-item-content");
      clearTimeout($mm_timer);
      $mm_timer = setTimeout(function(){ //Emulate HoverIntent
        mm_item_link_obj.addClass("mm-item-link-hover");
        mm_item_content_obj.css({
          'top': ($mm_item_link.outerHeight()) +"px",
          'right': 15 + 'px'
        })
        
        
        switch(options.show_method) {
          case "simple":
                mm_item_content_obj.show();
                break;
          case "slideDown":
                mm_item_content_obj.height("auto");
                mm_item_content_obj.slideDown('fast');
                break;
          case "fadeIn":
                mm_item_content_obj.fadeTo('fast', 1);
                break;
          default:
                mm_item_content_obj.each( options.show_method );
                break;
        }
      }, options.mm_timeout);
    });
    // Activation Method Ends
    // Deactivation Method Starts
    jQuery(this).bind(options.deactivate_action, function(e){
      e.stopPropagation();
      clearTimeout($mm_timer);
      var mm_item_link_obj = jQuery(this).find("a.mm-item-link");
      var mm_item_content_obj = jQuery(this).find("div.mm-item-content");
//      mm_item_content_obj.stop();
      switch(options.hide_method) {
        case "simple":
              mm_item_content_obj.hide();
              mm_item_link_obj.removeClass("mm-item-link-hover");
              break;
        case "slideUp":
              mm_item_content_obj.slideUp( 'fast',  function() {
              mm_item_link_obj.removeClass("mm-item-link-hover");
              });
              break;
        case "fadeOut":
              mm_item_content_obj.fadeOut( 'fast', function() {
              mm_item_link_obj.removeClass("mm-item-link-hover");
              });
              break;
        default:
              mm_item_content_obj.each( options.hide_method );
              mm_item_link_obj.removeClass("mm-item-link-hover");
              break;
      }
      if(mm_item_content_obj.length < 1) mm_item_link_obj.removeClass("mm-item-link-hover");
    });
//    Deactivation Method Ends
  });
  this.find(">li:last").after('<li class="clear-fix"></li>');
  this.show();
};
