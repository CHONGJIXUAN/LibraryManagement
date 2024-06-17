<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="Library_Management.aboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1>About Us</h1>
                <p class="lead">Learn more about our library management system.</p>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="card-body">
                    <h2 class="text-center">Our Mission</h2>
                    <p>Our mission is to provide an efficient and user-friendly library management system that helps libraries of all sizes manage their collections and serve their communities better.</p>
                </div>
            </div>
            <div class="col-6">
                <div class="card-body">
                    <h2 class="text-center">Our Story</h2>
                    <p>Founded in 2023, our library management system was developed to address the challenges faced by modern libraries. We strive to offer the best tools and features to simplify library operations and enhance user experience.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
