$(document).ready(
    function () {        
        //view add task window
        $('#add_task').click(
            function () {                
                $('#addtask_modal').modal('show');
                }
        );



    });

//funtion to show registration box
function showRegDiv(){
    $('#signinbox').hide(); $('#registerbox').show();
}

//funtion to show signin box
function showSigninDiv(){
    $('#signinbox').show(); $('#registerbox').hide();
}

//show registration success message
function ShowPopup() {
    $("#showRegistrationSuccessBtn").click();
}

function showAddTaskModal(){
    $('#addtask_modal').modal('show');
}

//$("#task_dropdown").on("change", function () {
//    $modal = $('#myModal');
//    if ($(this).val() === 'Add Task') {
//        $modal.modal('show');
//    }
//});

