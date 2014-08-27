(function toggleStyle() {
  $.ajax({
    type : 'GET',
    //dataType: "json",
    url : 'posts#index.js',
    //async : true,
    //data: {},
    dataType : "script",
    success: function() {
      setTimeout(toggleStyle, 60000);
    }
  });
})();
