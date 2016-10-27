using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationPage : System.Web.UI.Page
{

    protected void Page_PreRender(object sender, EventArgs e)
    {
        LinkButton register = (LinkButton)Master.FindControl("btnRegister");
        register.Visible = false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Checks reg email is unique. Saves new user's details, displays error if email is used.
    protected void btnRegSubmit_Click1(object sender, EventArgs e)
    {
        if (databaseHelper.unigueEmail(txtRegEmail.Text))
        {
            databaseHelper.regNewUser(dropTitle.SelectedValue, txtRegFirstname.Text, txtRegSurname.Text,
                txtRegAddress.Text, txtRegPostcode.Text, txtRegPhoneNo.Text, txtRegEmail.Text, txtRegPassword.Text);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Account Created Successfully!'); window.location = 'default.aspx';</script>");
        }
        else
        {
            lblInvalidEmail.Visible = true;
        }

    }

}