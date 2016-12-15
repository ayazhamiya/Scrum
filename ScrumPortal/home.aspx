<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ScrumPortal.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scrum Home</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo_user_ico.ico" style="width:16px;height:16px;" />

    <!-- Adding Bootsrtap CSS-->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-datepicker.css" rel="stylesheet" />
    <!-- Adding Font Awesome CSS -->
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="Content/custom.css" rel="stylesheet" /> 

    <!-- Adding JavaScript --> 
    <script src="jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>  
    <!--<script src="Scripts/jquery-3.1.1.min.js"></script>-->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
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
            <form runat="server">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Task</h4>
                </div>
                <div class="modal-body">

                    <!-- task start date & end date -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label class="control-label">Start Date</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="input-group input-append date" id="task_startdate">
                                        <input type="text" class="form-control" name="stardate" id="startdate_task" runat="server" />
                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label class="control-label">End Date</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="input-group input-append date" id="task_enddate">
                                        <input type="text" class="form-control" name="enddate" id="enddate_task" runat="server" />
                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- datepicker finish -->
                    <!-- project select dropdown -->
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-6">
                            <div class="dropdown">
                                <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                                    Select Project
                            <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Project 1</a></li>
                                    <li><a href="#">Project 2</a></li>
                                    <li><a href="#">Project 3</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                    <div class="form-group" style="margin-top: 10px;">
                        <!-- Name field -->
                        <label class="control-label " for="name">Name</label>
                        <input class="form-control" id="title_task" name="title" type="text" runat="server" />
                    </div>
                    <div class="form-group">
                        <!-- Description field -->
                        <label class="control-label " for="description">Description</label>
                        <textarea class="form-control" cols="40" id="description_task" name="description" rows="10" runat="server"></textarea>
                    </div>
            				
			</div>
          <div class="modal-footer">
            <asp:LinkButton id="addtask_btn" CssClass="btn btn-default " runat="server" OnClick="addtask_btn_Click">
                                    Add
                                </asp:LinkButton>
          </div>
          </form>
        </div>
        	
      </div>
    </div>
</body>
</html>
