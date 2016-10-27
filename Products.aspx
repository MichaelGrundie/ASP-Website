<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="contentTitle">Products Page</h3>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ProductsTable]"></asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductNumber" DataSourceID="SqlDataSource2" CssClass="productsTable" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="2" RepeatDirection="Horizontal">
        <ItemStyle CssClass="productItems" HorizontalAlign="Center" Wrap="True" Width="443px" VerticalAlign="Top" BorderStyle="Dotted" BorderColor="#00ccff" BorderWidth="2px"  />
        <ItemTemplate>

            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Width="200px" height-="200px"/>
            <br />
            Product Name:&nbsp;
            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
            <br />
            Description:
            <br />
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
            <br />
            Ingredients:<br />
            <asp:Label ID="IngredientsLabel" runat="server" Text='<%# Eval("Ingredients") %>' />
            <br />
            Price:&nbsp;£
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
            <br />
            <br />
            <asp:Button ID="addToBasket" runat="server" Text="Add To Cart" OnClick="addToBasket_Click" />
            <asp:HiddenField ID="hidFieldItemNo" runat="server" Value='<%# Eval("ProductNumber") %>' />
            <br />
        </ItemTemplate>
        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#0099CC" />
    </asp:DataList>
    &nbsp; 

</asp:Content>

