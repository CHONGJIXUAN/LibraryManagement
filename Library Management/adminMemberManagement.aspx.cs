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
    public partial class adminMemberManagement : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go Button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
                getMemberByID();

        }

        //Active Button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
                updateStatusByID("Active");
        }

        //Pending Button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
                updateStatusByID("Pending");

        }

        //Deactive Button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
                updateStatusByID("Deactive");
        }

        //Delete Button
        protected void DeletBtn_Click(object sender, EventArgs e)
        {
                deleteMemberID();
        }

        //user defined function
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl where member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        FullName.Text = dr.GetValue(0).ToString();
                        Status.Text = dr.GetValue(10).ToString();
                        DOB.Text = dr.GetValue(1).ToString();
                        ContactNumber.Text = dr.GetValue(2).ToString();
                        EmailID.Text = dr.GetValue(3).ToString();
                        State.Text = dr.GetValue(4).ToString();
                        City.Text = dr.GetValue(5).ToString();
                        PostalCode.Text = dr.GetValue(6).ToString();
                        FullAddress.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        void updateStatusByID(string status)
        {
            if (checkMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(connection);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status = '" + status + "' WHERE member_id = '" + MemberID.Text.Trim() + "' ", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Update Member Successfull');</script>");
                    clearForm();

                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID')</script>");
            }
            
        }

        void clearForm()
        {
            MemberID.Text = "";
            FullName.Text = "";
            Status.Text = "";
            DOB.Text = "";
            ContactNumber.Text = "";
            EmailID.Text = "";
            State.Text = "";
            City.Text = "";
            PostalCode.Text = "";
            FullAddress.Text = "";
        }

        void deleteMemberID()
        {
            if (checkMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(connection);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id = '" + MemberID.Text.Trim() + "' ", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Delete Member Successfull');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID')</script>");
            }
        }

        bool checkMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl where member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
    }
}