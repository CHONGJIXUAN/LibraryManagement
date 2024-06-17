<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminMemberManagement.aspx.cs" Inherits="Library_Management.adminMemberManagement" %>
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
                            <h4>Member Details</h4>
                        </div>
                    </div>                         

                    <div class="row">
                        <div class="col text-center">
                            <img style="width:100px" src="imgs/imgs/generaluser.png" class="card-img-top">
                        </div>
                    </div> 
                    <hr />
              
                    <div class="row">
                        <div class="col-md-3">
                            <label>Member ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="MemberID" runat="server" CssClass="form-control" placeholder="Member ID"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>Full Name</label>
                            <div class="form-group">
                                <asp:TextBox ID="FullName" runat="server" CssClass="form-control" placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <label>Account Status</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="Status" runat="server" CssClass="form-control mr-1" placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success mr-1" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-warning mr-1" OnClick="LinkButton2_Click"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-danger mr-1" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <label>DOB</label>
                            <div class="form-group">
                                <asp:TextBox ID="DOB" runat="server" CssClass="form-control" placeholder="DOB" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Contact Number</label>
                            <div class="form-group">
                                <asp:TextBox ID="ContactNumber" runat="server" CssClass="form-control" placeholder="Contact Number" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <label>Email ID</label>
                            <div class="form-group">
                                <asp:TextBox ID="EmailID" runat="server" CssClass="form-control" placeholder="Email ID" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>State</label>
                            <div class="form-group">
                                <asp:TextBox ID="State" runat="server" CssClass="form-control" placeholder="State" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>City</label>
                            <div class="form-group">
                                <asp:TextBox ID="City" runat="server" CssClass="form-control" placeholder="City" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>Postal Code</label>
                            <div class="form-group">
                                <asp:TextBox ID="PostalCode" runat="server" CssClass="form-control" placeholder="Postal Code" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label>Full Address</label>
                            <div class="form-group">
                                <asp:TextBox ID="FullAddress" runat="server" CssClass="form-control" placeholder="Full Address" ReadOnly="true" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-8 mx-auto">
                            <asp:Button ID="DeletBtn" runat="server" Text="Delete User Permanently" CssClass="btn btn-lg btn-block btn-danger" OnClick="DeletBtn_Click"/>
                        </div>
                    </div>

                      <a href="homepage.aspx">Back to the Home Page</a><br><br>
                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <h4>Member List</h4>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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
