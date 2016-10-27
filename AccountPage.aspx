<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="AccountPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Forename" HeaderText="Forename" SortExpression="Forename" />
            <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Title], [Forename], [Surname], [Address], [Postcode], [PhoneNumber], [EmailAddress] FROM [CustomerTable] WHERE ([EmailAddress] = @EmailAddress)">
        <SelectParameters>
            <asp:SessionParameter Name="EmailAddress" SessionField="new" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Title</asp:ListItem>
        <asp:ListItem>Forename</asp:ListItem>
        <asp:ListItem>Surname</asp:ListItem>
        <asp:ListItem>Address</asp:ListItem>
        <asp:ListItem>Postcode</asp:ListItem>
        <asp:ListItem>Phone Number</asp:ListItem>
        <asp:ListItem>Email Address</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="txtNewDetail" runat="server" placeholder="Enter new detail."></asp:TextBox>
    <asp:Button ID="btnChangeDetail" runat="server" Text="Change Detail" /><br />
    <br />
    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" /> <br />

    <div id ="changePassword" runat="server">
        &nbsp;&nbsp;Old Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>

        <br />
        New Password:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp; Confirm New:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtNewPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmitNewPassword" runat="server" Text="Submit" OnClick="btnSubmitNewPassword_Click" />

    </div>

</asp:Content>

