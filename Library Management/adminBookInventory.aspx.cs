using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Library_Management
{
    public partial class adminBookInventory : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }

            GridView1.DataBind();
            
        }

        //Add Button
        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                Response.Write("<script>alert('Book ID already exist, please try other')</script>");
            }
            else
            {
                addNewBook();
            }
        }

        //Update Button
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                updateBook();
            }
            else
            {
                Response.Write("<script>alert('Book does not exist, please try other')</script>");
            }
        }

        //Delete Button
        protected void DeletBtn_Click(object sender, EventArgs e)
        {
            deleteBook();
        }

        //Go Button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                getBookByID();
            }
            else
            {
                Response.Write("<script>alert('Book does not exist, please try other')</script>");
            }
        }

        //user defined function
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                AuthorName.DataSource = dt;
                AuthorName.DataValueField = "author_name";
                AuthorName.DataBind();

                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl", con);

                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                PublisherName.DataSource = dt;
                PublisherName.DataValueField = "publisher_name";
                PublisherName.DataBind();

            }
            catch(Exception ex)
            {
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

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl where book_id = @book_id", con);
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

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach(int i in Genre.GetSelectedIndices()) 
                {
                    genres = genres + Genre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/bookInventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("bookInventory/" + filename));
                filepath = "~/bookInventory/" + filename;

                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id, book_name, genre, author_name, publisher_name, publisher_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link) " +
                    "values (@book_id, @book_name, @genre, @author_name, @publisher_name, @publisher_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", AuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", PublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_date", PublisherDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", Language.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", Edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", BookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", Pages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", BookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", ActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("current_stock", ActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Add Book Successfull');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
        }

        void updateBook()
        {
            if (checkBookExist())
            {
                try
                {
                    //Date
                    string dateInput = PublisherDate.Text.Trim();

                    //Stock
                    int actual_stock = Convert.ToInt32(ActualStock.Text.Trim());
                    int current_stock = Convert.ToInt32(CurrentStock.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than Issued Books')</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            CurrentStock.Text = "" + current_stock;
                        }
                    }

                    //Genre ListBox
                    string genres = "";
                    foreach (int i in Genre.GetSelectedIndices())
                    {
                        genres = genres + Genre.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    //Upload File
                    string filepath = global_filepath;
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (FileUpload1.HasFile && filename != "")
                    {
                        filepath = "~/book_inventory/" + filename;
                        FileUpload1.SaveAs(Server.MapPath(filepath));
                    }

                    //Database Connection
                    SqlConnection con = new SqlConnection(connection);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name = @book_name, genre = @genre, author_name = @author_name, " +
                        "publisher_name = @publisher_name, publisher_date = @publisher_date, language = @language, edition = @edition, book_cost = @book_cost, " +
                        "no_of_pages = @no_of_pages, book_description = @book_description, actual_stock = @actual_stock, current_stock = @current_stock, book_img_link = @book_img_link " +
                        "WHERE book_id = @book_id", con);

                    cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", AuthorName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", PublisherName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_date", dateInput);
                    cmd.Parameters.AddWithValue("@language", Language.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", Edition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", BookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", Pages.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", BookDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Update Book Successful');</script>");

                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID')</script>");
            }
        }


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count >= 1) {
                    BookName.Text = dt.Rows[0]["book_name"].ToString();
                    Language.SelectedValue = dt.Rows[0]["language"].ToString();
                    PublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                    AuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString();
                    PublisherDate.Text = dt.Rows[0]["publisher_date"].ToString();

                    Genre.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for(int j = 0; j < genre[i].Length; j++)
                        {
                            if (Genre.Items[j].ToString() == genre[i])
                            {
                                Genre.Items[j].Selected = true;
                            }
                        }
                    }

                    Genre.SelectedValue = dt.Rows[0]["genre"].ToString();
                    Edition.Text = dt.Rows[0]["edition"].ToString();
                    BookCost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    Pages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    ActualStock.Text = dt.Rows[0]["actual_stock"].ToString();
                    CurrentStock.Text = dt.Rows[0]["current_stock"].ToString();
                    IssuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    BookDescription.Text = dt.Rows[0]["book_description"].ToString();

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book Id')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");

            }
        }

        void ClearForm()
        {
            BookID.Text = "";
            BookName.Text = "";
            PublisherDate.Text = "";
            ActualStock.Text = "";
            CurrentStock.Text = "";
            Genre.ClearSelection();
            AuthorName.ClearSelection();
            PublisherName.ClearSelection();
            Language.ClearSelection();
            Edition.Text = "";
            BookCost.Text = "";
            Pages.Text = "";
            BookDescription.Text = "";
        }

        void deleteBook()
        {
            if (checkBookExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(connection);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id = '" + BookID.Text.Trim() + "' ", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Delete Book Successfull');</script>");
                    //clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' " + ex.Message + " ')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID')</script>");
            }
        }
    }
}