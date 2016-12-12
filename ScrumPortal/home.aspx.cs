using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ScrumPortal
{
    public partial class home : System.Web.UI.Page
    {
        private string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserName"]!=null){
                username = Session["UserName"].ToString();
                user_name.InnerText = username;
            }
            else
                user_name.InnerText = "Guest User";
            
        }
    }
}