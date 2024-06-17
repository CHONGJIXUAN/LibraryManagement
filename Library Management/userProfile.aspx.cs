using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class userProfile : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || Session["username"].ToString() == "")
                {
                    Response.Write("<script>alert('Session Expired Login Again')</script>");
                    Response.Redirect("userLogin.aspx");
                }
                else
                {
                    getUserData();

                    if (!Page.IsPostBack)
                    {
                        getUserDetails();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(' "+ex.Message+" ')</script>");
                Response.Write("<script>alert('Session Expired Login Again')</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        //Update Button
        protected void update_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || Session["username"].ToString() == "")
                {
                    Response.Write("<script>alert('Session Expired Login Again')</script>");
                }
                else
                {
                    updateUserDetails();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                Response.Write("<script>alert('Session Expired Login Again')</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        //user defined function
        void getUserData()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl where member_id = '" + Session["username"].ToString() +"' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        void getUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl where member_id = '" + Session["username"].ToString() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                FullName.Text = dt.Rows[0]["full_name"].ToString();
                Birth.Text = dt.Rows[0]["dob"].ToString();
                ContactNumber.Text = dt.Rows[0]["contact_no"].ToString();
                Email.Text = dt.Rows[0]["email"].ToString();
                State.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                City.Text = dt.Rows[0]["city"].ToString();
                PostalCode.Text = dt.Rows[0]["postalcode"].ToString();
                FullAddress.Text = dt.Rows[0]["full_address"].ToString();
                UserID.Text = dt.Rows[0]["member_id"].ToString();
                Password.Text = dt.Rows[0]["password"].ToString();

                Status.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "Active")
                {
                    Status.CssClass = "badge badge-pill badge-success";
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Pending")
                {
                    Status.CssClass = "badge badge-pill badge-warning";
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Deactive")
                {
                    Status.CssClass = "badge badge-pill badge-danger";
                }
                else
                {
                    Status.CssClass = "badge badge-pill badge-secondary";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        void updateUserDetails()
        {
            string password = "";
            if(new_password.Text.Trim() == "")
            {
                password = Password.Text.Trim();
            }
            else
            {
                password = new_password.Text.Trim();
            }

            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET full_name = @full_name, dob = @dob, contact_no = contact_no, email = @email, state = @state, city = @city," +
                    "postalcode = @postalcode, full_address = @full_address, password = @password, account_status = @account_status  WHERE member_id = '" + Session["username"].ToString() + "' ", con);

                cmd.Parameters.AddWithValue("@full_name", FullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", Birth.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", ContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", State.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", City.Text.Trim());
                cmd.Parameters.AddWithValue("@postalcode", PostalCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", FullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                int result = cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_issue_tbl SET member_name = @member_name WHERE member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_name", FullName.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());

                cmd.ExecuteNonQuery();
                con.Close();

                if(result > 0)
                {
                    Response.Write("<script>alert('Update Details Successfull');</script>");
                    getUserDetails();
                    getUserData();

                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Entry');</script>");
                }
                //clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check Condition Here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }
    }
}