using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace my212_Project_32973934
{
    public partial class Degree : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LID"] == null || Session["MID"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                con = new SqlConnection();
                cmd = new SqlCommand();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                con.Open();

                cmd.CommandText = "SELECT MName FROM Materials WHERE Id=" + Request.QueryString["Id"];
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Page.Title = reader[0].ToString();
                    reader.Close();
                }
                else
                    reader.Close();

                con.Close();
            }
        }

    }
    
}