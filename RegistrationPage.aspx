<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>Registration Page</h1>
    <br />
    Required Fields are required!
    <br /><br />
    <asp:Label ID="lblInvalidEmail" runat="server" Text="Email already used! Contact us to retrieve your password." ForeColor="Red" Visible="false"></asp:Label>
    <asp:table id="regTable" cssclass="regTable" runat="server">
        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType"> Title:</asp:TableCell>
            <asp:TableCell runat="server" ForeColor="#FF3300">
                <asp:DropDownList ID="dropTitle" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Mr.</asp:ListItem>
                    <asp:ListItem>Mrs.</asp:ListItem>
                    <asp:ListItem>Miss.</asp:ListItem>
                    <asp:ListItem>Dr.</asp:ListItem>
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="dropTitle" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Firstname:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegFirstname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldtxtRegFirstnameValidator2" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegFirstname" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Surname:  </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegSurname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegSurname" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>


        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType"> Email Address:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegEmail" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Address:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegAddress" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Postcode:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegPostcode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegPostcode" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType"> Phone Number:  </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegPhoneNo" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegPhoneNo" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" validationgroup="regForm" runat="server" ErrorMessage='Invalid, use "01234567890" format!' ForeColor="Red" ControlToValidate="txtRegPhoneNo" ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType"> Password:  </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegPassword" runat="server" Text="" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" validationgroup="regForm" ErrorMessage="*" ControlToValidate="txtRegPassword" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType">Confirm Password:</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="txtRegConfirmPassword" runat="server" TextMode="Password" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" validationgroup="regForm" runat="server" ErrorMessage="*" ControlToValidate="txtRegConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" validationgroup="regForm" ErrorMessage="Passwords do not match!" ControlToValidate="txtRegConfirmPassword" ControlToCompare="txtRegPassword" ForeColor="Red"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow runat="server" BorderStyle="Solid">
            <asp:TableCell runat="server" CssClass="regInputType"></asp:TableCell>
            <asp:TableCell runat="server">
            <asp:Button ID="btnRegSubmit" runat="server" Text="Submit" OnClick="btnRegSubmit_Click1" causesvalidation="true"  validationgroup="regForm" />
            </asp:TableCell>
        </asp:TableRow>


    </asp:table>


</asp:Content>

