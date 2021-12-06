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
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                con = new SqlConnection();
                cmd = new SqlCommand();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                con.Open();

                cmd.CommandText = "SELECT fullname FROM Admin WHERE Id=" + Session["AdminID"];
                cmd.Parameters.AddWithValue("@username", tb_usernameLec.Text);
                cmd.Parameters.AddWithValue("@pass", tb_passLec.Text);
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

        protected void btn_Insert_Click(object sender, EventArgs e)
        {

        }

        protected void btn_InsertLec_Click(object sender, EventArgs e)
        {
            if (tb_usernameLec.Text.TrimStart().TrimEnd() == "" || tb_passLec.Text == "" || tb_fullname.Text == "")
            {
                lb_msg.Text = "Sorry... You must fill in Username, Password and Fullname textboxes!";
            }
            else
            {
                con.Open();
                cmd.CommandText = "SELECT id FROM Lecturers WHERE username=@usernameLec AND pass=@passLec AND active='true'";
                cmd.Parameters.AddWithValue("@usernameLec", tb_usernameLec.Text);
                cmd.Parameters.AddWithValue("@passLec", tb_passLec.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    lb_msg.Text = "Username and Password already exist in Database!";
                }
                else
                {

                    reader.Close();


                    cmd.CommandText = "INSERT INTO Lecturers (username,pass,fullname,notes,active) VALUES (@username2,@pass2,@fullname,@notes,'false')";
                    cmd.Parameters.AddWithValue("@username2", tb_usernameLec.Text);
                    cmd.Parameters.AddWithValue("@pass2", tb_passLec.Text);
                    cmd.Parameters.AddWithValue("@fullname", tb_fullname.Text);
                    cmd.Parameters.AddWithValue("@notes", tb_notes.Text);

                    cmd.ExecuteNonQuery();
                    lb_msg.Text = "Lecturer Inserted Successfully";
                    GridView_Lecturers.DataBind();
                }
                con.Close();
            }
        }

        protected void LinkButton_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void btn_insertM_Click(object sender, EventArgs e)
        {
            if(tb_MName.Text.TrimStart().TrimEnd() == "")
            {
                lb_msgM.Text = "Sorry... You must fill in Material Name textbox!";
            }
            else
            {
                con.Open();
                cmd.CommandText = "SELECT id FROM Materials WHERE MName=@MName";
                cmd.Parameters.AddWithValue("@MName", tb_MName.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    lb_msgM.Text = "Sorry... the name of the material already found in database!";
                }
                else
                {

                    reader.Close();


                    cmd.CommandText = "INSERT INTO Materials (MName,LID,notes) VALUES (@MNameP,@LID,@notesP)";
                    //cmd.Parameters.AddWithValue("@username2", tb_usernameLec.Text);
                    cmd.Parameters.AddWithValue("@MNameP", tb_MName.Text);
                    cmd.Parameters.AddWithValue("@LID", ddl_Lec.SelectedValue);
                    cmd.Parameters.AddWithValue("@notesP", tb_MNotes.Text);


                    cmd.ExecuteNonQuery();
                    lb_msgM.Text = "The Name Of The Material Has Been Inserted Successfully";
                    GridView_Materials.DataBind();
                }
                con.Close();
            }
        }
    }
}