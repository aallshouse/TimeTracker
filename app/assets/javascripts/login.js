
function ready(){
    $(".alert").alert();
    $("button.btn").click(function(e){
        e.preventDefault();
        $('div.hidden').removeClass('hidden').addClass('show');
    });
}

$(document).on('page:load', ready);
$(ready);
