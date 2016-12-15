using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ScrumPortal
{
    public partial class home : System.Web.UI.Page
    {
        private string username;
        private int userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserName"]!=null){
                username = Session["UserName"].ToString();
                user_name.InnerText = username;
            }
            else
                user_name.InnerText = "Guest User";
            
        }

        protected void addtask_btn_Click(object sender, EventArgs e)
        {
            string title = title_task.Value;
            string description = description_task.Value;
            string startdate = startdate_task.Value;
            string enddate = enddate_task.Value;
            
            //adding userid from session
            if (Session["UserID"] != null)
            {
                userid = (int)(Session["UserID"]);
                //user_name.InnerText = username;
            }
            else
                userid=0;
            //System.Diagnostics.Debug.WriteLine("title: "+title+" desc: "+description+" sdate: "+startdate+" edate: "+enddate);

            //connection to db
            try
            {
                var connection = ConfigurationManager.ConnectionStrings["Scrumdb_connection"];
                SqlConnection con = new SqlConnection(connection.ConnectionString);
                //SQL Command
                SqlCommand command = new SqlCommand();

                try
                {
                    con.Open();
                    //pass connection object to command
                    command.Connection = con;
                    command.CommandType = CommandType.StoredProcedure;

                    command.CommandText = "addtask";//store procedure name
                    command.Parameters.Add("@task_title", SqlDbType.VarChar).Value = title;
                    command.Parameters.Add("@task_description", SqlDbType.VarChar).Value = description;
                    command.Parameters.Add("@task_startdate", SqlDbType.Date).Value = startdate;
                    command.Parameters.Add("@task_enddate", SqlDbType.Date).Value = enddate;
                    command.Parameters.Add("@userid", SqlDbType.Int).Value = userid;
                    command.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine("**** query executed ****** ");

                }
                catch(Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("------ exception: " + ex);
                }
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("**** exception: " + ex);
            }
        }
    }
}