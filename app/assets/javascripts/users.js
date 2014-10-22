
$(function(){
    $('#add_role_button').click(function(){
        var optionTags = '<option value="-1"></option>';
        $(gon.not_my_roles).each(function(index, role){
            optionTags += '<option value="' + index + '">' + role + '</option>';
        });

        //'<li>I am a new role</li>'
        $(this).parent().find('ul')
               .append('<li><select name="role_id">' + optionTags + '</select><button class="remove_role_button">-</button></li>');
        $('.remove_role_button').click(function(){
            $(this).parent().remove();
        });
    });
});