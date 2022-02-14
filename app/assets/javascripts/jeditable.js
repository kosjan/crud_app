$(document).ready(function() {
  $('.vk').editable('/employees/jeditable',{
    name : 'vk',
    tooltip   : 'Нажмите для редактирования',
    style  : "inherit",
    onsubmit: function(settings, td) {
      var input = $(td).find('input');
        var original = input.val();
        if (isName(original)) {
            return true;
        } else {
            input.css('background-color','#c00').css('color','#fff');
            return false;
        }
    },
    submitdata: function(value, settings) {
      var submitData = {
          id: this.parentNode.getAttribute("id"),
          column: this.getAttribute("id")
      };
      return submitData;
    }
  });

  $('#toggleSpinners').on('click', function(){

     $('#ibox1').children('.ibox-content').toggleClass('sk-loading');
     $('#ibox2').children('.ibox-content').toggleClass('sk-loading');

  })
  function isName(value) {
  if (value == "" ) return false;
  return true;}
});
