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
        setImageUrl(0);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        setImageUrl(1);
    }
    protected void btnPrevious_Click1(object sender, EventArgs e)
    {
        setImageUrl(2);

    }

    private void setImageUrl(int direction)
    {
        if (ViewState["ImageDisplayed"] == null)
        {
            testimonialImage.ImageUrl = "~/Images/1.png";
            ViewState["ImageDisplayed"] = 1;
        }
        else if (direction == 1)
        {
            int i = (int)ViewState["ImageDisplayed"];
            i++;
            testimonialImage.ImageUrl = "~/Images/" + i.ToString() + ".png";
            ViewState["ImageDisplayed"] = i;
            if (i == 6)
            {
                ViewState["ImageDisplayed"] = 0;
            }
        }
        else if (direction == 2)
        {
            int i = (int)ViewState["ImageDisplayed"];
            i--;
            if (i < 1)
            {
                i = 6;
            }
            testimonialImage.ImageUrl = "~/Images/" + i.ToString() + ".png";
            ViewState["ImageDisplayed"] = i;
        }
    }

}
