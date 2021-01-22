$(document).ready(function(){
  $('#subcribe-button').click(function(){
    if($('#subcribe-button').val() == 'Subcribe'){
      $('#subcribe-button').val('Unsubcribe')
    }else{
      $('#subcribe-button').val('Subcribe')
    }
  })
});