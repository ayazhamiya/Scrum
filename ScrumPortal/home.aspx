<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ScrumPortal.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scrum Home</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo_user_ico.ico" style="width:16px;height:16px;" />

    <!-- Adding Bootsrtap CSS-->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- Adding Font Awesome CSS -->
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="Content/custom.css" rel="stylesheet" /> 

    <!-- Adding JavaScript -->   
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/custom.js"></script>

  
</head>
<body>    
    <nav class="navbar navbar-default " role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="img/logo_user.png" style="width:30px;height:30px;"/></a>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">SCRUM Portal</a></li>
      </ul>
      
      <ul class="nav navbar-nav">
        <li><a href="#">Task</a></li>
        <li class="dropdown" id="task_dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tasks <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#" id="add_task" onclick="javascript:showAddTaskModal()">Add Task</a></li>
            <li><a href="#" id="view_task">View Tasks</a></li>
            <li class="divider"></li>
            <li><a href="#" id="assign_task">Assign Tasks</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="#" id="user_name" runat="server">User Name</a></li>
          <li><i class="fa fa-user-circle" style="font-size:36px"></i></li>
      </ul> 
    </div><!-- /.navbar-collapse -->
  </div>
</nav>
    
    <!-- Modal -->
    <div id="addtask_modal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add Task</h4>
          </div>
          <div class="modal-body">
            <form>
                
	            <div class="form-group"> <!-- Name field -->
		            <label class="control-label " for="name">Name</label>
		            <input class="form-control" id="name" name="name" type="text"/>
	            </div>	
	            <div class="form-group"> <!-- Description field -->
		            <label class="control-label " for="description">Description</label>
		            <textarea class="form-control" cols="40" id="description" name="description" rows="10"></textarea>
	            </div>	
             </form>					
			</div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Add</button>
          </div>
        </div>

      </div>
    </div>
</body>
</html>
