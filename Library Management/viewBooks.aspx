<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewBooks.aspx.cs" Inherits="Library_Management.viewBooks" %>
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
    <div class="container">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col text-center">
                            <h4>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                Book Inventory List</h4>
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
</asp:Content>
