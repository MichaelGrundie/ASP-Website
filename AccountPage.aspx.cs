using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["new"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        changePassword.Visible = false;
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        changePassword.Visible = true;
        btnChangePassword.Visible = false;
    }

    protected void btnSubmitNewPassword_Click(object sender, EventArgs e)
    {
        if (databaseHelper.passwordChange(txtOldPassword.Text, Session["new"].ToString(), txtNewPassword.Text))
        {
            btnChangePassword.Visible = true;
            changePassword.Visible = false;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Incorrect current password entered!');</script>");
            changePassword.Visible = true;
            btnChangePassword.Visible = false;
        }
    }
}