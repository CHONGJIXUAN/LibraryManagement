<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Library_Management.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Home Background Section --%>
    <section>
        <img src="imgs/imgs/home-bg.jpg" class="img-fluid"/>
    </section>


    <%-- Features Section --%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-center">
                    <img style="width:150px" src="imgs/imgs/digital-inventory.png" />
                    <h4>Digital Book Inventory</h4>
                    <p class="text-justify">The Digital Book Inventory in our e-Library Management System offers an intuitive and comprehensive platform for managing and accessing a wide array of digital publications in various formats, ensuring users can easily find and utilize resources with real-time availability updates.</p>
                </div>

                <div class="col-md-4 text-center">
                    <img style="width:150px" src="imgs/imgs/search-online.png" />
                    <h4>Search Books</h4>
                    <p class="text-justify">The Search Books feature provides a powerful and flexible search tool, allowing users to quickly locate specific titles or authors within our extensive digital library using advanced filtering options.</p>
                </div>

                <div class="col-md-4 text-center">
                    <img style="width:150px" src="imgs/imgs/defaulters-list.png" />
                    <h4>Defaulter List</h4>
                    <p class="text-justify">The Defaulter List automatically identifies and manages accounts with overdue books, streamlining the process for librarians to monitor and notify users, thus maintaining an efficient circulation system.</p>
                </div>
            </div>
        </div>
    </section>


    <%-- Home Banner Section --%>
    <section>
        <img src="imgs/imgs/in-homepage-banner.jpg" class="img-fluid"/>
    </section>

    <%-- Process Section --%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Process</h2>
                    <p><b>We have a Simple 3 Steps Process</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-center">
                    <img style="width:150px" src="imgs/imgs/sign-up.png" />
                    <h4>Sign Up</h4>
                    <p class="text-justify">The "Sign Up" process is quick and user-friendly, enabling new users to create their accounts and gain access to 
                        our digital resources with just a few clicks.</p>
                </div>

                <div class="col-md-4 text-center">
                    <img style="width:150px" src="imgs/imgs/search-online.png" />
                    <h4>Search Books</h4>
                    <p class="text-justify">Our "Search Books" feature offers a robust search engine that allows 
                        users to effortlessly locate and access books by title, author, or keywords within our extensive digital catalog.</p>
                </div>

                <div class="col-md-4 text-center">
                    <img style="width:150px" src="imgs/imgs/library.png" />
                    <h4>Visit Us</h4>
                    <p class="text-justify">The "Visit Us" section provides essential information about our physical library locations, 
                        including operating hours and available in-person services, to help users plan their visits effectively.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
