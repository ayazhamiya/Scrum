using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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
            
            //get user name from session and display it in Header Bar
            if(Session["UserName"]!=null){
                username = Session["UserName"].ToString();
                user_name.InnerText = username;
            }
            else
                user_name.InnerText = "Guest User";

            //get user id from session
            if (Session["UserID"] != null)
            {
                userid = (int)(Session["UserID"]);
                //user_name.InnerText = username;
            }
            else
                userid = 0;

            //load projects list from DB to project dropdown in add task
            try
            {
                var connection = ConfigurationManager.ConnectionStrings["Scrumdb_connection"];
                SqlConnection con = new SqlConnection(connection.ConnectionString);
                using (SqlCommand cmd = new SqlCommand("SELECT project_id, project_workitem+' : '+project_title as projectname FROM projects"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    projects_list.DataSource = cmd.ExecuteReader();
                    projects_list.DataTextField = "projectname";
                    projects_list.DataValueField = "project_id";
                    projects_list.DataBind();
                    con.Close();

                }

            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("**** exception: " + ex);
            }
            //add items to projects_list
            projects_list.Items.Insert(0, new ListItem("--Select Projects--", "0"));
            
            //getting tasks for current user and display in table 
            DataTable dt= new DataTable();
            try
            {
                var connection = ConfigurationManager.ConnectionStrings["Scrumdb_connection"];
                SqlConnection con = new SqlConnection(connection.ConnectionString);
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tasks where userid="+userid))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                        
                    }

                }

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("**** exception: " + ex);
            }
            //DataTable dt = this.GetData();
 
        //Building an HTML string.
        StringBuilder html = new StringBuilder();
 
       //Building the Data rows.
        int inprogress = 0, notstarted = 0, completed = 0, deadlinepassed=0;
        int task_no = 1;
        DateTime? task_enddate=null;
        foreach (DataRow row in dt.Rows)
        {
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                

                if (column.ColumnName.Equals("task_title"))
                {
                    html.Append("<td>");
                    html.Append(task_no);
                    html.Append("</td>");

                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");

                    task_no++;
                }

                if (column.ColumnName.Equals("task_startdate"))
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                if (column.ColumnName.Equals("task_enddate"))
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");

                    //check if deadline is passed
                    string taskenddate = row[column.ColumnName].ToString();
                    task_enddate = Convert.ToDateTime(taskenddate);
                    //string[] onlydate = taskenddate.Split(' ');
                    //taskenddate= onlydate[0];

                    //string currentdate = DateTime.Now.ToString();
                    //string[] onlycurrentdate = taskenddate.Split(' ');
                    //currentdate = onlycurrentdate[0];
                    
                }
                if (column.ColumnName.Equals("task_status"))
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                    
                    //code to check the task count based on status
                    if(row[column.ColumnName].Equals("In Progress"))
                    {
                        inprogress++;
                    }
                    if (row[column.ColumnName].Equals("Not Started"))
                    {
                        notstarted++;
                    }
                    if (row[column.ColumnName].Equals("Completed"))
                    {
                        completed++;
                    }
                    if (task_enddate < DateTime.Now && !row[column.ColumnName].Equals("Completed"))
                    {
                        deadlinepassed++;
                    }

                }

                
            }
            html.Append("</tr>");
        }
        //set count to status boxes
            deadlinepassed_task.InnerText = deadlinepassed.ToString();
            completed_task.InnerText = completed.ToString();
            inprogress_task.InnerText = inprogress.ToString();
            notstarted_task.InnerText = notstarted.ToString();
 
  
 
        //Append the HTML string to Placeholder.
        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
    }

            
        
        

        protected void addtask_btn_Click(object sender, EventArgs e)
        {
            string title = title_task.Value;
            string description = description_task.Value;
            string startdate = startdate_task.Value;
            string enddate = enddate_task.Value;
            string status = status_task.Value ;
            
            
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
                    command.Parameters.Add("@task_status", SqlDbType.VarChar).Value = status;
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

            //reload page after saving task
            Response.Redirect(Request.RawUrl);
        }
    }
}