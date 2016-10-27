<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    

   <div id="addProduct">

       <h3>Add a new product</h3><br /><br />
       All fields are required!
    <asp:Table ID="addProdTbl" CssClass="" runat="server">
        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType"> Product Name:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtProdName" runat="server" Width="300px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldtxtRegFirstnameValidator2" validationgroup="prodForm" runat="server" ErrorMessage="*" ControlToValidate="txtProdName" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Product Price: £</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtProdPrice" runat="server" TextMode="SingleLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" validationgroup="prodForm" runat="server" ErrorMessage="*" ControlToValidate="txtProdPrice" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Product Ingredients:  </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtProdIng" runat="server" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" validationgroup="prodForm" runat="server" ErrorMessage="*" ControlToValidate="txtProdIng" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>


        <asp:TableRow runat="server" BorderStyle="Solid" >
            <asp:TableCell runat="server" CssClass="regInputType"> Product Description:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtProdDesc" runat="server" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" validationgroup="prodForm" runat="server" ErrorMessage="*" ControlToValidate="txtProdDesc" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        
    </asp:Table>
    <asp:FileUpload id="FileUploadControl" runat="server" Width="342px" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" validationgroup="prodForm" runat="server" ErrorMessage="*" ControlToValidate="FileUploadControl" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:Button runat="server" id="UploadButton" text="Add Product" onclick="UploadButton_Click" CausesValidation="true" ValidationGroup="prodForm" />
    <br /><br />
    <asp:Label runat="server" id="StatusLabel" text="Upload status: " />

    </div>
</asp:Content>

