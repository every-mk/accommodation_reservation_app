$(function()
{
  /* アイコンクリックした時のメニュー表示・非表示を切り替える. */
  $("header .host-icon").on('click', function() {
    if ($(".header-nav-menu").hasClass("display-none"))
    {
      $(".header-nav-menu").removeClass("display-none");
    }
    else
    {
      $(".header-nav-menu").addClass("display-none");
    }
  });
})
