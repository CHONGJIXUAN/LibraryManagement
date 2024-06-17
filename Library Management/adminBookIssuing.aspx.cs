using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.CompilerServices;

namespace Library_Management
{
    public partial class adminBookIssuing : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getBook();
        }

        //Issue Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkBookExist() && checkBookExist())
            {
                if (checkIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already have this book')</script>");
                }
                else
                {
                    issueBooks();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID')</script>");
            }
        }

        //Return Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkBookExist() && checkBookExist())
            {
                if (checkIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This Entry does not exist')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID')</script>");
            }
        }

        //user defined function
        void getBook()
        {
            try{
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    BookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book Id')</script>");
                }

                cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());    
                da = new SqlDataAdapter (cmd);
                dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count >= 1)
                {
                    MemberName.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Member Id')</script>");
                }
            }
            catch(Exception ex){
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        bool checkBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id = @book_id AND current_stock >0", con);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
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
            catch(Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                return false;
            }
        }

        bool checkIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE member_id = @member_id AND book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
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

        bool checkMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
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

        void issueBooks()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl(member_id, member_name, book_id, book_name, issue_date, due_date) values " +
                    "(@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);

                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", MemberName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", StartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", EndDate.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock - 1 WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Add New Issue Book Successfull');</script>");
                //clearForm();

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE book_id = '" + BookID.Text.Trim() + "' AND member_id = '"+MemberID.Text.Trim()+"' ", con);
                int result = cmd.ExecuteNonQuery();
                if(result > 0)
                {
                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock + 1 WHERE book_id = @book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                    cmd.ExecuteNonQuery();

                    con.Close();
                    Response.Write("<script>alert('Books Return Successfully');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Error - Invalid details');</script>");
                }
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
                if(e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check Condition Here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if(today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }catch (Exception ex) {
                Response.Write("<script>alert(' "+ ex.Message +" ')</script>");
            }
        }
    }
}