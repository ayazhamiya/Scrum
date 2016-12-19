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
    <link href="Content/bootstrap-select.min.css" rel="stylesheet" />
    <!-- Adding Font Awesome CSS -->
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="Content/custom.css" rel="stylesheet" /> 

    <!-- Adding JavaScript --> 
    <script src="jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>  
    <!--<script src="Scripts/jquery-3.1.1.min.js"></script>-->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/bootstrap-select.min.js"></script>
    <script src="Scripts/custom.js"></script>

  
</head>
<body>    
    <nav class="navbar navbar-default " role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="img/logo_user.png" style="width: 30px; height: 30px;" /></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#"><strong>SCRUM Portal</strong></a></li>
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
                    <li><a href="#" ><p id="user_name" runat="server" class="text-capitalize text-primary"><strong>User Name</strong></p></a></li>
                    <li><i class="fa fa-user-circle" style="font-size: 36px"></i></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- main contents -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-md-3">
                        <div class="well">
                            <h4 class="text-danger"><span class="label label-danger pull-right" id="deadlinepassed_task" runat="server">10</span> Deadline passed </h4>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="well">
                            <h4 class="text-success"><span class="label label-success pull-right" id="completed_task" runat="server">5</span> Completed </h4>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="well">
                            <h4 class="text-primary"><span class="label label-primary pull-right" id="inprogress_task" runat="server">2</span> In Progress </h4>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="well">
                            <h4 class=" text"><span class="label label-default pull-right" id="notstarted_task" runat="server">5</span> Not Started </h4>
                        </div>
                    </div>
                </div>
                <!--/row-->
            </div>
            <!--/col-12-->
        </div><!--/row-->
        <div class="row">
            <div class="col-md-12">
                <h1>My Tasks</h1>
                <!-- My tasks table -->
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Task Title</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                          <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        <div class="row">

            


        </div>

    </div>

    <!-- Modal to add task -->
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
                            <!--populate dropdown list from db-->
                            <asp:DropDownList ID="projects_list" CssClass=" selectpicker" runat="server">
                                <asp:ListItem Text="Select Project" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <select class="selectpicker" id="status_task" runat="server">
                                <option>Not Started</option>
                                <option>In Progress</option>
                                <option>Completed</option>
                            </select>
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
