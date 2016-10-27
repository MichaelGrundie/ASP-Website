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
    }

    protected void addToBasket_Click(object sender, EventArgs e)
    {
        Button addToCart = (Button)sender;
        DataListItem item = (DataListItem)addToCart.NamingContainer;
        HiddenField hid = (HiddenField)item.FindControl("hidFieldItemNo");
        int noOfItemsInCart = Int32.Parse(Session["noOFCartItems"].ToString());
        noOfItemsInCart++;
        Session["Cart Item " + noOfItemsInCart.ToString()] = hid.Value;
        Session["noOFCartItems"] = noOfItemsInCart.ToString();
        LinkButton btnCart = this.Master.FindControl("btnCart") as LinkButton;
        btnCart.Text = "Cart (" + Session["noOFCartItems"].ToString() + " items)";
    }
}






/* TEST CODE TO DISPLAY SESSION DATA
       
        for (int i = 0; i < Session.Contents.Count; i++)
        {
            Response.Write(Session.Keys[i] + " - " + Session[i] + "<br />");
        }

        foreach (string key in Session.Keys)
        {
            Response.Write(key + " - " + Session[key] + "<br />");
        }*/
