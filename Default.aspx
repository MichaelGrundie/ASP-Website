<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="homeWelcome">
        <h1>Welcome to Relievaderm!</h1>
        <br />
        Have a browse to discover some truely fantastic skin care products.
       <br />
        Sign in or register to order your proucts today.
    </div>
    <div id="homeImage">
        <asp:Image ID="cream" CssClass="cream" runat="server" ImageUrl="Images/Cream.jpg" />
    </div>
    <div id="videoText">
        Watch our video to see how Relievaderm has changed Rudy's life.
    </div>
    <div id="homeVideo">
        <iframe width="500" height="315" src="https://www.youtube.com/embed/XAlv4M7Vui4" frameborder="0" allowfullscreen></iframe>
    </div>
</asp:Content>

