<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminPublisherManagement.aspx.cs" Inherits="Library_Management.adminPublisherManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                      <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <h4>Publisher Details</h4>
                            </div>
                        </div> 
                        

                        <div class="row">
                            <div class="col text-center">
                                <img style="width:100px" src="imgs/imgs/publisher.png" class="card-img-top">
                            </div>
                        </div> 
                        <hr />
                      
                        <div class="row">
                            <div class="col-md-4">
                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="PublisherID" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="Button1" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="Button1_Click"/>
                                    </div>
                                </div>
                            </div>
                            

                            <div class="col-md-8">
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="PublisherName" runat="server" CssClass="form-control" placeholder="Publisher Name" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                    <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn btn-lg btn-block btn-success" OnClick="Button2_Click"/>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-lg btn-block btn-warning" OnClick="Button3_Click"/>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" runat="server" Text="Delete" CssClass="btn btn-lg btn-block btn-danger" OnClick="Button4_Click"/>
                            </div>
                        </div>
                          <a href="homepage.aspx">Back to the Home Page</a><br>
                          <br>
                        </div>
                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col text-center">
                                    <h4>Publisher List</h4>
                                </div>
                            </div>
                            <hr />

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                            <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
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
