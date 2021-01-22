$(document).ready(function(){
  $('#like-button').click(function(){
    if($('#like-button').val() == 'Like'){
      console.log(1)
      $('#like-button').val('Unlike')
    }else{
      console.log(2)
      $('#like-button').val('Like')
    }
  })
});