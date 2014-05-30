
function ready(){
    $(".alert").alert();
    $("button.btn").first().click(function(e){
        e.preventDefault();
        $('div.hidden').removeClass('hidden').addClass('show');
    });
    $("button.btn").last().click(function(e){
        e.preventDefault();

        var email = $('#email').val();
        $.post('/go_home', {
            email: email
        }, function(responseValue){

            var startIndex = responseValue.indexOf('<body>'),
                bodyTagLen = '<body>'.length,
                endIndex = responseValue.indexOf('</body>'),
                newBody = responseValue.substring(startIndex + bodyTagLen, endIndex);

            $('body').html(newBody);
        });
    });
}

$(document).on('page:load', ready);
$(ready);
