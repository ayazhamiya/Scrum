using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace ScrumPortal
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_btn_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("sigup button clicked");
            string email = email_signup.Value;
            string fname = fname_signup.Value;
            string lname = lname_signup.Value;
            string psw = psw_signup.Value;
            int usertype = 1;
            int isauthenticate = 1;

            //SQL Connection
            try
            {
                var connection = ConfigurationManager.ConnectionStrings["Scrumdb_connection"];
                System.Diagnostics.Debug.WriteLine("connection string is : "+connection);
                SqlConnection con = new SqlConnection(connection.ConnectionString);
                System.Diagnostics.Debug.WriteLine("connection string is : " + con.ConnectionString);
                //SQL Command
                SqlCommand command = new SqlCommand();
                try
                {
                    con.Open();
                    //pass connection object to command
                    command.Connection = con;
                    command.CommandType = CommandType.StoredProcedure;

                    command.CommandText = "registerUser";//store procedure name

                    command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                    command.Parameters.Add("@fname", SqlDbType.VarChar).Value = fname;
                    command.Parameters.Add("@lname", SqlDbType.VarChar).Value = lname;
                    command.Parameters.Add("@psw", SqlDbType.VarChar).Value = psw;
                    command.Parameters.Add("@usertype", SqlDbType.Int).Value = usertype;
                    command.Parameters.Add("@isauthenticate", SqlDbType.Int).Value = isauthenticate;

                    command.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine("**** query executed ****** ");

                    //show registation success message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                    this.lblMessage.Text = "Your Registration is done successfully. Your Manager will approve your account shortly";
 

                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("------ exception: " + ex);
                }
                finally
                {
                    con.Close();
                }

            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("**** exception: "+ex);
            }
          
        }

        protected void signin_btn_Click(object sender, EventArgs e)
        {
            string email = email_signin.Value;
            string psw = psw_signin.Value;
            int islogin = 0;

            //sql connection
            try
            {
                var connection = ConfigurationManager.ConnectionStrings["Scrumdb_connection"];
                System.Diagnostics.Debug.WriteLine("connection string is : " + connection);
                SqlConnection con = new SqlConnection(connection.ConnectionString);
                System.Diagnostics.Debug.WriteLine("connection string is : " + con.ConnectionString);
                //SQL Command
                SqlCommand command = new SqlCommand();
                try
                {
                    con.Open();
                    //pass connection object to command
                    command.Connection = con;
                    command.CommandType = CommandType.StoredProcedure;

                    command.CommandText = "loginUser";//store procedure name

                    command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;                 
                    command.Parameters.Add("@password", SqlDbType.VarChar).Value = psw;


                    islogin = Convert.ToInt32(command.ExecuteScalar());
                    if(islogin==1)
                        System.Diagnostics.Debug.WriteLine("**** User matched. Successfully signed in ****** ");
                    else
                        System.Diagnostics.Debug.WriteLine("**** No user match. Signing in unsuccessful ****** ");

                    //show registation success message
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                    //this.lblMessage.Text = "Your Registration is done successfully. Your Manager will approve your account shortly";


                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("------ exception: " + ex);
                }
                finally
                {
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("**** exception: " + ex);
            }

        }
    }
}