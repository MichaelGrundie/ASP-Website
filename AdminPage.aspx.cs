using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAdmin"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                if ((FileUploadControl.PostedFile.ContentType == "image/jpeg") ||
                    (FileUploadControl.PostedFile.ContentType == "image/pjpeg") ||
                    (FileUploadControl.PostedFile.ContentType == "image/png") ||
                    (FileUploadControl.PostedFile.ContentType == "image/gif"))
                {
                    if (FileUploadControl.PostedFile.ContentLength < 10485760)
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        FileUploadControl.SaveAs(Server.MapPath("~/Images/") + filename);
                        databaseHelper.addProduct(txtProdName.Text, txtProdPrice.Text, txtProdIng.Text, txtProdDesc.Text, filename);
                        StatusLabel.Text = "Upload status: Product Added!";
                    }
                    else
                        StatusLabel.Text = "Upload status: The file has to be less than 10 mb!";
                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG, GIF, and PNG files are accepted!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The product could not be added. The following error occured: " + ex.Message;
            }
        }
    }


}