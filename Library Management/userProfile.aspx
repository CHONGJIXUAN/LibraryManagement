<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Library_Management.userProfile" %>
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
                                <img style="width:100px" src="imgs/imgs/generaluser.png" class="card-img-top" alt="General User Image">
                            </div>
                        </div> 

                        <div class="row">
                            <div class="col text-center">
                                <h4>Your Profile</h4>
                                <span>Account Status - </span>
                                <asp:Label ID="Status" runat="server" Text="Your Status" CssClass="badge badge-pill badge-info"></asp:Label>
                            </div>
                        </div> 
                      
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="FullName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Birth" runat="server" CssClass="form-control" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ContactNumber" runat="server" CssClass="form-control" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="State" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Select" Value="select" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Johor" Value="Johor" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Kedah" Value="Kedah" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Kelantan" Value="Kelantan" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Malacca" Value="Malacca" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Negeri Sembilan" Value="Negeri Sembilan" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Pahang" Value="Pahang" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Penang" Value="Penang" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Perak" Value="Perak" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Perlis" Value="Perlis" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Sabah" Value="Sabah" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Sarawak" Value="Sarawak" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Selangor" Value="Selangor" runat="server"></asp:ListItem>
                                        <asp:ListItem Text="Terengganu" Value="Terengganu" runat="server"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="City" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Postal Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="PostalCode" runat="server" CssClass="form-control" placeholder="Postal Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-12">
                                <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="FullAddress" runat="server" CssClass="form-control" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col text-center">
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label>User ID</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="UserID" runat="server" CssClass="form-control" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Old Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="new_password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                                                
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <div class="form-group text-center">
                                        <asp:Button ID="update" runat="server" Text="Update" class="btn btn-primary btn-block btn-lg" OnClick="update_Click"/>
                                    </div>
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
                                    <img style="width:100px" src="imgs/imgs/books1.png"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col text-center">
                                    <h4>Your Issued Books</h4>
                                    <asp:Label ID="Label2" runat="server" Text="your books info" CssClass="badge badge-pill badge-info"></asp:Label>
                                </div>
                            </div>
                            <hr />

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
