<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminBookIssuing.aspx.cs" Inherits="Library_Management.adminBookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
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
                                <h4>Book Issuing</h4>
                            </div>
                        </div>                         

                        <div class="row">
                            <div class="col text-center">
                                <img style="width:100px" src="imgs/imgs/books.png" class="card-img-top">
                            </div>
                        </div> 
                        <hr />
                      
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="MemberID" runat="server" CssClass="form-control" placeholder="Member ID" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="BookID" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button ID="Button1" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="Button1_Click"/>
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="MemberName" runat="server" CssClass="form-control" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="BookName" runat="server" CssClass="form-control" placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="StartDate" runat="server" CssClass="form-control" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>End Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="EndDate" runat="server" CssClass="form-control" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="Button2" runat="server" Text="Issue" CssClass="btn btn-lg btn-block btn-primary" OnClick="Button2_Click"/>
                            </div>
                            <div class="col-6">
                                <asp:Button ID="Button3" runat="server" Text="Return" CssClass="btn btn-lg btn-block btn-warning" OnClick="Button3_Click"/>
                            </div>
                        </div>
                      
                       
                            
                          <a href="homepage.aspx">Back to the Home Page</a><br><br>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col text-center">
                                    <h4>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                        Issued Book List</h4>
                                </div>
                            </div>
                            <hr />

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
