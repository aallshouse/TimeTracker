
$(function(){
    $('#add_role_button').click(function(){
        var optionTags = '<option value="-1"></option>';
        $(gon.not_my_roles).each(function(index, role){
            optionTags += '<option value="' + role.id + '">' + role.name + '</option>';
        });

        //'<li>I am a new role</li>'
        var $ul = $(this).parent().find('ul');
        $ul.append('<li class="role_list_item"><select name="role_id" class="select_role">' + optionTags + '</select><button class="remove_role_button">-</button></li>');
        $ul.find('.remove_role_button').click(function(){
            $(this).parent().remove();
        });
    });
    $('.remove_role_button').click(function(){
        $(this).parent().remove();
    });
    $('#save_role_button').click(function(){
        var roles = [];
        $('select').each(function(){
            roles.push($(this).val());
        });

        $.ajax({
            url: gon.update_user_path,
            type: 'PUT',
            data: {
                roles: roles
            }
        }).done(function(){
            $('#flash_notice').text('User was successfully saved.');
        });
    });
});
