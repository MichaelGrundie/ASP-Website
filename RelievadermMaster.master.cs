using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class RelievadermMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["noOFCartItems"] == null)
        {
            Session["noOFCartItems"] = "0";
        }
        btnCart.Text = "Cart (" + Session["noOFCartItems"].ToString() + " items)";


        try
        {
            if (Session["login"].ToString() == "True")
            {
                login.Visible = false;
                btnAccountButton.Visible = true;
                btnLogout.Visible = true;
            }

            if (Session["isAdmin"].ToString() == "True")
            {
                btnAccountButton.Text = "Admin Page";
                btnCart.Visible = false;
            }

        }
        catch
        {

        }


    }
    

    //Checks if Username exists. Checks password matches username. Authorises 
    //user as admin or customer.
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        int userStatus = databaseHelper.checkLoginEmail(txtUsername.Text, txtPassword.Text);
        switch (userStatus)
        {
            case 0:
                lblIncorrectDetails.Text = "Details Invalid!";
                lblIncorrectDetails.Visible = true;
                txtPassword.Text = "";
                txtUsername.Text = "";
                break;

            case 1:
            case 2:
                if (userStatus == 1)
                {
                    Session["isAdmin"] = "True";
                    btnAccountButton.Text = "Admin Page";
                    btnCart.Visible = false;
                }
                Session["new"] = txtUsername.Text;
                login.Visible = false;
                btnAccountButton.Visible = true;
                btnLogout.Visible = true;
                Session["login"] = "True";
                break;

            case 4:
                lblIncorrectDetails.Text = "Username Invalid!";
                lblIncorrectDetails.Visible = true;
                txtPassword.Text = "";
                txtUsername.Text = "";
                break;
        }
    }


    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegistrationPage.aspx");
    }


    //Signs user out. Cart items are not lost by using Session.Abandon
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session["new"] = null;
        Session["isAdmin"] = null;
        btnAccountButton.Visible = false;
        btnLogout.Visible = false;
        Page.Response.Redirect(Page.Request.Url.ToString(), false);
    }


    protected void btnCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");

    }


    //Redirects admins to Admin page. Redirects customers to Account page.
    protected void btnAccountButton_Click(object sender, EventArgs e)
    {
        if (Session["isAdmin"] != null)
        {
            Response.Redirect("AdminPage.aspx");
        }
        else
        {
            Response.Redirect("AccountPage.aspx");

        }
    }
}
