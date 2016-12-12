<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ScrumPortal.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scrum Login</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo_user_ico.ico" style="width:16px;height=16px;" />
    
    <!-- Adding Bootsrtap CSS-->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- Adding Font Awesome CSS -->
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="Content/custom.css" rel="stylesheet" /> 

    <!-- Adding JavaScript -->
    <script src="jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>   
    <!--<script src="Scripts/jquery-3.1.1.min.js"></script>-->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/custom.js"></script>

    <!-- Funtion to display Modal -->

</head>
<body>
   <form id="mainform" runat="server">
    <div class="mainBackground"><!-- Setting main backround -->
        <div class="container">
            <!-- Brand logo -->
            <div class="row">
                <img src="img/logo_user.png" class="img-responsive center-block" />
            </div>
            
            <div class="row">
                <!-- Sign in box -->
                <div id="signinbox" class=" col-md-8 col-md-offset-2">
                <div class="panel panel-default panel-info">
                    <div class="panel-heading">Sign in</div>
                    <div class="panel-body">
                        <!-- Login Form -->
                        <div id="loginform" class="form-horizontal" role="form">
                            
                                <div class="col-md-10 col-md-offset-1 input-group custom-input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="email" class="form-control" id="email_signin" placeholder="Enter Email Address" runat="server"/>
                                </div>
                                <div class="col-md-10 col-md-offset-1 input-group custom-input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" class="form-control" id="psw_signin" placeholder="Enter Password" runat="server" />
                                </div>
                                <asp:LinkButton id="signin_btn" CssClass="btn btn-default btn-lg col-md-2 col-md-offset-5" 
                                      OnClick="signin_btn_Click" runat="server" >
                                    Sign in
                                </asp:LinkButton>
                                <div class="form-group">
                                    <div class="col-md-8 col-md-offset-2 controls">
                                        <div style="border-top: 1px solid#070e57; margin-top:10px; padding-top:20px; font-size:85%">
                                            Don't have an Account?
                                            <a href="#" id="register_link" onclick="javascript:showRegDiv()">
                                                Register here
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                            
                        </div>
                    </div>

                </div>
                </div>
                <!--Register box -->
                <div id="registerbox" style="display:none;" class=" col-md-8 col-md-offset-2">
                    <div class="panel panel-default panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                        </div>
                        <div class="panel-body">
                            <div id="signupform" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input id="email_signup" type="text" class="form-control" name="email" placeholder="Email Address" runat="server"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <input id="fname_signup" type="text" class="form-control" name="firstname" placeholder="First Name" runat="server"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Last Name</label>
                                    <div class="col-md-9">
                                        <input id="lname_signup" type="text" class="form-control" name="lastname" placeholder="Last Name" runat="server"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input id="psw_signup" type="password" class="form-control" name="passwd" placeholder="Password" runat="server"/>
                                    </div>
                                </div>
                                <asp:LinkButton id="signup_btn" CssClass="btn btn-success btn-lg col-md-2 col-md-offset-5" 
                                    runat="server" OnClick="signup_btn_Click">
                                    Register
                                </asp:LinkButton>
                                <div class="form-group">
                                    <div class="col-md-8 col-md-offset-2 controls">
                                        <div style="border-top: 1px solid#070e57; margin-top:10px; padding-top:20px; font-size:85%">
                                            Already have an account?
                                            <a href="#" id="signin_link" onclick="javascript:showSigninDiv()">
                                                Sign in here
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- MODAL START -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Registration done Successfully</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblMessage" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Close</button>                            
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal --> 
            <!-- Hidden show model button -->
            <button type="button" style="display: none;" id="showRegistrationSuccessBtn" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModal">
                Launch demo modal
            </button>
        <!-- MODAL FINISH -->
        </div>
    </div>
  </form>
</body>
</html>