using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class userSignUp : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Sign Up Btn Click Event
        protected void SignUp_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {
                Response.Write("<script>alert('Member already exist with this Member ID, please try other')</script>");
            }
            else
            {
                signUpNewMember();
            }
        }

        //User Defined Method
        bool CheckMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl where member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", UserID.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                return false;
            }
        }

        void signUpNewMember()
        {
            string dateInput = Birth.Text.Trim();

            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl(full_name,dob,contact_no,email,state,city,postalcode,full_address,member_id,password,account_status) values (@full_name, @dob, @contact_no, @email, @state, @city, @postalcode, @full_address, @member_id, @password, @account_status)", con);

                cmd.Parameters.AddWithValue("@full_name", FullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", dateInput);
                cmd.Parameters.AddWithValue("@contact_no", ContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", City.Text.Trim());
                cmd.Parameters.AddWithValue("@postalcode", PostalCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", FullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", UserID.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successfully');</script>");
                Response.Redirect("userLogin.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }
    }
}