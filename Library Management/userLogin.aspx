<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="Library_Management.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                        <div class="col text-center">
                            <img style="width:150px" src="imgs/imgs/generaluser.png" class="card-img-top" alt="General User Image">
                        </div>
                    </div> 

                    <div class="row">
                        <div class="col text-center">
                            <h3>Member Login</h3>
                        </div>
                    </div> 

                    <div class="row">
                        <div class="col text-center">
                            <hr>
                        </div>
                    </div> 

                    <!-- Login Information -->
                    <div class="row">
                        <div class="col text-center">
                            <p><strong>If you don't want to register an account. Use the following credentials to log in:</strong></p>
                            <p>Admin ID: <code>user01</code></p>
                            <p>Password: <code>user123</code></p>
                        </div>
                    </div>
                    <hr>

                    <div class="row">
                        <div class="col">
                            <label>Member ID</label>
                            <div class="form-group text-center">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                            </div>

                            <label>Password</label>
                            <div class="form-group text-center">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>

                            <div class="form-group text-center">
                                <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-success btn-block btn-lg" OnClick="Button1_Click"/>
                            </div>

                            <div class="form-group text-center">
                                <asp:Button ID="Button2" runat="server" Text="Sign Up" class="btn btn-info btn-block btn-lg" OnClick="Button2_Click"/>
                            </div>

                        </div>
                    </div> 

                  </div>
                </div>

                <a href="homepage.aspx">Back to the Home Page</a><br><br>
            </div>
        </div>
    </div>
</asp:Content>
