<%@ Page Title="" Language="C#" MasterPageFile="~/RelievadermMaster.master" AutoEventWireup="true" CodeFile="Testimonials.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            
            <asp:Image ID="testimonialImage" CssClass="testimonialImage"   runat="server" BorderStyle="None" />
            <asp:Button ID="btnPrevious" runat="server" Text="<<Previous" OnClick="btnPrevious_Click1" />
            <asp:Button ID="btnNext" runat="server" Text="Next>>" OnClick="btnNext_Click" />

</asp:Content>

