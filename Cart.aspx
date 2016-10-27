<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <h3 id="emptyCart" runat="server" visible="false">CART EMPTY</h3>

    <asp:Table ID="tblCartTable" runat="server"></asp:Table>
</asp:Content>

