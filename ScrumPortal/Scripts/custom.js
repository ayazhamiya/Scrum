$(document).ready(
    function () {



    });


function showRegDiv(){
    $('#signinbox').hide(); $('#registerbox').show();
}

function showSigninDiv(){
    $('#signinbox').show(); $('#registerbox').hide();
}

function ShowPopup() {
    $("#showRegistrationSuccessBtn").click();
}

$("#task_dropdown").on("change", function () {
    $modal = $('#myModal');
    if ($(this).val() === 'Add Task') {
        $modal.modal('show');
    }
});