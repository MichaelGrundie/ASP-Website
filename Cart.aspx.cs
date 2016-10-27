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
        if (Session["noOFCartItems"] == null)
        {
            Session["noOFCartItems"] = "0";
        }

        int noOfCartItems = Int32.Parse(Session["noOFCartItems"].ToString());
        if (noOfCartItems == 0)
        {
            emptyCart.Visible = true;
        }
        else
        {
            String[] cartItems = getCartItems(noOfCartItems);

            /*TEST
            for (int z= 0; z<cartItems.Length; z++)
            {
                Response.Write(cartItems[z]);
            }*/

            for (int rowCtr = 1; rowCtr <= noOfCartItems; rowCtr++)
            {
                TableRow tRow = new TableRow();
                tblCartTable.Rows.Add(tRow);

                for (int i =1; i<=2; i++)
                {
                    if (i == 1)
                    {
                        TableCell tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        String itemName = databaseHelper.getDetails("name", cartItems[rowCtr - 1]);
                        tCell.Controls.Add(new LiteralControl(itemName + ":"));
                        tCell.Attributes.Add("class", "cartTableLeft");

                    }
                    else
                    {
                        TableCell tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        double price = Double.Parse(databaseHelper.getDetails("price", cartItems[rowCtr - 1]));
                        tCell.Controls.Add(new LiteralControl("£" + price.ToString()));
                        tCell.Attributes.Add("class", "cartTableRight");

                    }
                }
            }

            TableRow Row = new TableRow();
            tblCartTable.Rows.Add(Row);
            TableCell Cell = new TableCell();
            Row.Cells.Add(Cell);
            TableCell Cell2 = new TableCell();
            Row.Cells.Add(Cell2);

            Button clearTrolly = new Button();
            clearTrolly.ID = "clearTrolly";
            clearTrolly.Text = "Empty Cart";
            clearTrolly.Click += new System.EventHandler(clearTrolly_Click);

            Button checkout = new Button();
            checkout.ID = "checkout";
            checkout.Text = "Check out";
            checkout.Click += new System.EventHandler(checkout_Click);

            Cell.Controls.Add(clearTrolly);
            Cell.Attributes.Add("class", "cartTableLeft");

            Cell2.Controls.Add(checkout);
            Cell2.Attributes.Add("class", "cartTableRight");

        }

    }


    /*Lets the user commit an order. Displays a pop up if user is not signed in.
    Uses database helper to populate Order and OrderItems tables.*/
    private void checkout_Click(object sender, EventArgs e)
    {

        //Not signed in pop uo.
        if (Session["login"] == null)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('You must be logged in to check out!');</script>");
        }
        else
        {
            databaseHelper.sqlAddOrder(databaseHelper.getUserId(Session["new"].ToString()), getCartItems(Int32.Parse(Session["noOFCartItems"].ToString())));
            Session["noOFCartItems"] = "0";
            int total = 0;
            int orderNo = 12345;
            emptyCart.InnerHtml = "<br /> We have recieved you order please send a total payment of £" + total + " to our paypal email address: <u>Michaelgrundie@hotmail.com</u> so that we can complete"
                + " your order. <br /><br /> <strong> YOU MUST INCLUDE YOUR ORDER NUMBER:" + orderNo + " as a comment!<strong>";
            emptyCart.Visible = true;
            tblCartTable.Visible = false;
            LinkButton btnCart = this.Master.FindControl("btnCart") as LinkButton;
            btnCart.Text = "Cart (" + Session["noOFCartItems"].ToString() + " items)";
        }
    }

    //Clears trolly items in session data .
    private void clearTrolly_Click(object sender, EventArgs e)
    {
        Session["noOFCartItems"] = 0;
        Response.Redirect("Products.aspx");
    }


    /*Returns all cart items stored in session data as an array.*/
    protected String[] getCartItems(int noOfCartItems)
    {
        String[] cartItems = new String[noOfCartItems];

        int itemsIndex = 1;
        for(int i = 0; i< noOfCartItems; i++)
        {
            cartItems[i] = Session["Cart Item " + itemsIndex.ToString()].ToString();
            itemsIndex++;
        }

        return cartItems;
    }
}