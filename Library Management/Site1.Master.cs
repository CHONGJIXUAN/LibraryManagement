using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Management
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true; //userlogin link button
                    LinkButton2.Visible = true; //usersignup link button
                    LinkButton4.Visible = false; //view books link button

                    LinkButton3.Visible = false; //logout link button
                    LinkButton7.Visible = false; //hello user link button

                    LinkButton6.Visible = true; //admin login link button
                    LinkButton11.Visible = false; //author management link button
                    LinkButton12.Visible = false; //pulisher management link button
                    LinkButton8.Visible = false; //book inventory link button
                    LinkButton9.Visible = false; //book issuing link button
                    LinkButton10.Visible = false; //member management link button
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //userlogin link button
                    LinkButton2.Visible = false; //usersignup linkbutton

                    LinkButton3.Visible = true; //logout link button
                    LinkButton7.Visible = true; //hello user link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton6.Visible = false; //admin login link button
                    LinkButton11.Visible = false; //author management link button
                    LinkButton12.Visible = false; //pulisher management link button
                    LinkButton8.Visible = false; //book inventory link button
                    LinkButton9.Visible = false; //book issuing link button
                    LinkButton10.Visible = false; //member management link button
                }
                else if(Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; //userlogin link button
                    LinkButton2.Visible = false; //usersignup linkbutton

                    LinkButton3.Visible = true; //logout link button
                    LinkButton7.Visible = true; //hello user link button
                    LinkButton7.Text = "Hello Admin";

                    LinkButton6.Visible = false; //admin login link button
                    LinkButton11.Visible = true; //author management link button
                    LinkButton12.Visible = true; //pulisher management link button
                    LinkButton8.Visible = true; //book inventory link button
                    LinkButton9.Visible = true; //book issuing link button
                    LinkButton10.Visible = true; //member management link button
                }
            }
            catch(Exception ex)
            {
                 Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
            
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminAuthorManagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminPublisherManagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminBookInventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminBookIssuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminMemberManagement.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewBooks.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["role"] = "";
            Session["fullname"] = "";

            LinkButton1.Visible = true; //userlogin link button
            LinkButton2.Visible = true; //usersignup link button
            LinkButton4.Visible = false; //view books link button

            LinkButton3.Visible = false; //logout link button
            LinkButton7.Visible = false; //hello user link button

            LinkButton6.Visible = false; //admin login link button
            LinkButton11.Visible = false; //author management link button
            LinkButton12.Visible = false; //pulisher management link button
            LinkButton8.Visible = false; //book inventory link button
            LinkButton9.Visible = false; //book issuing link button
            LinkButton10.Visible = false; //member management link button

            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e) {
            if (Session["role"].Equals("user"))
            {
                Response.Redirect("userProfile.aspx");
            }
            else
            {
                Response.Redirect("homepage.aspx");
            }
        }
    }
}