$(document).ready(
    function () {        
        
        //add task start date function
        $('#task_startdate').datepicker({

        });

        //add task end date function
        $('#task_enddate').datepicker({

        });

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

//show add task window
function showAddTaskModal() {
    
    $('#addtask_modal').modal('show');
}

//$("#task_dropdown").on("change", function () {
//    $modal = $('#myModal');
//    if ($(this).val() === 'Add Task') {
//        $modal.modal('show');
//    }
//});

