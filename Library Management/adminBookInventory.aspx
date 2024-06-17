<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminBookInventory.aspx.cs" Inherits="Library_Management.adminBookInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                        <div class="col text-center">
                            <h4>Book Details</h4>
                        </div>
                    </div>                         

                    <div class="row">
                        <div class="col text-center">
                            <img style="width:100px" src="imgs/imgs/books.png" class="card-img-top" id="imgview">
                        </div>
                    </div> 
                    <hr />

                    <div class="row">
                        <div class="col">
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" onchange="readURL(this)"/>
                        </div>
                    </div>
          
                    <div class="row">
                        <div class="col-md-3">
                            <label>Book ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="BookID" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-9">
                            <label>Book Name</label>
                            <div class="form-group">
                                <asp:TextBox ID="BookName" runat="server" CssClass="form-control" placeholder="Book Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Language</label>
                            <div class="form-group">
                                <asp:DropDownList ID="Language" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                    <asp:ListItem Text="Chinese" Value="Chinese"></asp:ListItem>
                                    <asp:ListItem Text="Malay" Value="Malay"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <label>Publisher Name</label>
                            <div class="form-group">
                                <asp:DropDownList ID="PublisherName" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Author Name</label>
                            <div class="form-group">
                                <asp:DropDownList ID="AuthorName" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                            <label>Publisher Date</label>
                            <div class="form-group">
                                <asp:TextBox ID="PublisherDate" runat="server" CssClass="form-control" placeholder="Publisher Date" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>Genre</label>
   
                            <div class="form-group">
                                <asp:ListBox ID="Genre" runat="server" SelectionMode="Multiple" CssClass="form-control" Rows="5">
                                    <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
                                    <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                    <asp:ListItem Text="Comic Book" Value="Comic Book"></asp:ListItem>
                                    <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem>
                                    <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                    <asp:ListItem Text="Healthy Living" Value="Healthy Living"></asp:ListItem>
                                    <asp:ListItem Text="Wellness" Value="Wellness"></asp:ListItem>
                                    <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                    <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                    <asp:ListItem Text="Poetry" Value="Poetry"></asp:ListItem>
                                    <asp:ListItem Text="Personal Development" Value="Personal Development"></asp:ListItem>
                                    <asp:ListItem Text="Romance" Value="Romance"></asp:ListItem>
                                    <asp:ListItem Text="Science Fiction" Value="Science Fiction"></asp:ListItem>
                                    <asp:ListItem Text="Suspense" Value="Suspense"></asp:ListItem>
                                    <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                    <asp:ListItem Text="Art" Value="Art"></asp:ListItem>
                                    <asp:ListItem Text="Autobiography" Value="Autobiography"></asp:ListItem>
                                    <asp:ListItem Text="Encyclopedia" Value="Encyclopedia"></asp:ListItem>
                                    <asp:ListItem Text="Health" Value="Health"></asp:ListItem>
                                    <asp:ListItem Text="History" Value="History"></asp:ListItem>
                                    <asp:ListItem Text="Math" Value="Math"></asp:ListItem>
                                    <asp:ListItem Text="TextBook" Value="TextBook"></asp:ListItem>
                                    <asp:ListItem Text="Science" Value="Science"></asp:ListItem>
                                    <asp:ListItem Text="Travel" Value="Travel"></asp:ListItem>
                                </asp:ListBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Edition</label>
                            <div class="form-group">
                                <asp:TextBox ID="Edition" runat="server" CssClass="form-control" placeholder="Edition"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Book Cost(per unit)</label>
                            <div class="form-group">
                                <asp:TextBox ID="BookCost" runat="server" CssClass="form-control" placeholder="Book Cost(per unit)" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>Pages</label>
                            <div class="form-group">
                                <asp:TextBox ID="Pages" runat="server" CssClass="form-control" placeholder="Pages" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Actual Stock</label>
                            <div class="form-group">
                                <asp:TextBox ID="ActualStock" runat="server" CssClass="form-control" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Current Stock</label>
                            <div class="form-group">
                                <asp:TextBox ID="CurrentStock" runat="server" CssClass="form-control" placeholder="Current Stock" TextMode="Number" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>Issued Books</label>
                            <div class="form-group">
                                <asp:TextBox ID="IssuedBooks" runat="server" CssClass="form-control" placeholder="Issued Books" TextMode="Number" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label>Book Description</label>
                            <div class="form-group">
                                <asp:TextBox ID="BookDescription" runat="server" CssClass="form-control" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-4">
                            <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="btn btn-lg btn-block btn-success" OnClick="AddBtn_Click"/>
                        </div>
                        <div class="col-4">
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="btn btn-lg btn-block btn-warning" OnClick="UpdateBtn_Click"/>
                        </div>
                        <div class="col-4">
                            <asp:Button ID="DeletBtn" runat="server" Text="Delete" CssClass="btn btn-lg btn-block btn-danger" OnClick="DeletBtn_Click"/>
                        </div>
                    </div>

                      <a href="homepage.aspx">Back to the Home Page</a><br><br>
                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <h4>Book Inventory List</h4>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                                        
                                        <ItemStyle Font-Bold="True" Font-Italic="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="BookName" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                                <div class="col-12">
                                                                    Author: <asp:Label ID="AuthorName" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label> | Genre:
                                                                    <asp:Label ID="Genre" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label> | Language: 
                                                                    <asp:Label ID="Language" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-12">
                                                                    Publisher:
                                                                    <asp:Label ID="PublisherName" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    &nbsp;| Publisher Date:
                                                                    <asp:Label ID="PublisherDate" runat="server" Font-Bold="True" Text='<%# Eval("publisher_date") %>'></asp:Label>
                                                                    &nbsp;| Pages:
                                                                    <asp:Label ID="Pages" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    &nbsp;| Edition:
                                                                    <asp:Label ID="Edition" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-12">
                                                                    Cost:
                                                                    <asp:Label ID="BookCost" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    &nbsp;| Actual Stock:
                                                                    <asp:Label ID="ActualStock" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Available:
                                                                    <asp:Label ID="Available" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>
                                                                </div>
                                                                <div class="col-12">

                                                                    Desciption:
                                                                    <asp:Label ID="Description" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("book_description") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' CssClass="img-fluid"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
