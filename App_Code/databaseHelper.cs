using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;

/// <summary>
/// Used to add and get information from database.
/// </summary>
public class databaseHelper
{
    public databaseHelper()
    {

    }

    //adds a new user to CustomerTable
    public static void regNewUser(string Title, string Forename, string Surname, string Address,
        string Postcode, string PhoneNumber, string Email, string Password)
    {
        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand addCustomerRecord = new SqlCommand("INSERT INTO [CustomerTable] ([Title], [Forename], [Surname], [Address], [Postcode], [PhoneNumber], [EmailAddress], [Password]) VALUES (@title1, @fname1, @sname1, @address1, @postcode1, @phonenumber1, @email1, @password1)", connect);
        addCustomerRecord.Parameters.AddWithValue("@title1", Title);
        addCustomerRecord.Parameters.AddWithValue("@fname1", Forename);
        addCustomerRecord.Parameters.AddWithValue("@sname1", Surname);
        addCustomerRecord.Parameters.AddWithValue("@address1", Address);
        addCustomerRecord.Parameters.AddWithValue("@postcode1", Postcode);
        addCustomerRecord.Parameters.AddWithValue("@phonenumber1", PhoneNumber);
        addCustomerRecord.Parameters.AddWithValue("@email1", Email);
        addCustomerRecord.Parameters.AddWithValue("@password1", Password);
        connect.Open();
        addCustomerRecord.ExecuteNonQuery();
        connect.Close();
    }


    //Changes a users password after first checking their current password.
    public static bool passwordChange(string oldPassword, string email, string newPassword)
    {
        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand checkPassword = new SqlCommand("SELECT [Password] FROM [CustomerTable] WHERE ([EmailAddress] = @email)", connect);
        
        checkPassword.Parameters.AddWithValue("@email", email);
        connect.Open();
        String userPassword = checkPassword.ExecuteScalar().ToString();

        if (userPassword == oldPassword)
        {
            SqlCommand changePassword = new SqlCommand("UPDATE [CustomerTable] SET [Password] = " + newPassword + " WHERE [EmailAddress] = @email", connect);
            changePassword.Parameters.AddWithValue("email", email);
            changePassword.ExecuteNonQuery();
            return true;
        }
        else
        {
            return false;
        }
    }


    //returns requested product details
    public static string getDetails(string detailsType, string productNumber)
    {
        string columnName = detailsType;

        if (detailsType == "name")
        {
            columnName = "ProductName";

        }
        else if (detailsType == "image")
        {
            columnName = "Image";
        }
        else if (detailsType == "price")
        {
            columnName = "Price";
        }


        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand findDetail = new SqlCommand("SELECT [" + columnName + "] FROM [ProductsTable] WHERE ([ProductNumber] = @detail)", connect);
        findDetail.Parameters.AddWithValue("@detail", Int32.Parse(productNumber));
        connect.Open();

        string detail = findDetail.ExecuteScalar().ToString();

        connect.Close();

        return detail;

    }


    //Adds an order to OrderTable and adds order items to OrderedItems table.
    public static void sqlAddOrder(String CustomerNumber, string[] OrderedItems)
    {
        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand addOrder = new SqlCommand("INSERT INTO [OrdersTable] ([CustomerNumber]) VALUES (@customerNumber)", connect);
        SqlCommand getOrderID = new SqlCommand("SELECT TOP 1 [OrderNumber] FROM [OrdersTable] ORDER BY [OrderNumber] DESC; ", connect);
        addOrder.Parameters.AddWithValue("@CustomerNumber", CustomerNumber);
        connect.Open();
        addOrder.ExecuteNonQuery();
        int orderNumber = Int32.Parse(getOrderID.ExecuteScalar().ToString());
        connect.Close();

        for (int i = 0; i < OrderedItems.Length; i++)
        {
            SqlCommand addOrderItems = new SqlCommand("INSERT INTO [OrderedItems] ([ProductNumber], [OrderNumber], [Quantity])" +
                " Values (@itemNo, @OrderNo, 1)", connect);
            addOrderItems.Parameters.AddWithValue("@itemNO", OrderedItems[i]);
            addOrderItems.Parameters.AddWithValue("@OrderNo", orderNumber);
            connect.Open();
            addOrderItems.ExecuteNonQuery();
            connect.Close();
        }

    }


    //returns a customer number using the customer's email address
    public static String getUserId(string username)
    {
        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand findDetail = new SqlCommand("SELECT [CustomerNumber] FROM [CustomerTable] WHERE ([EmailAddress] = @email)", connect);
        findDetail.Parameters.AddWithValue("@email", username);
        connect.Open();

        String detail = findDetail.ExecuteScalar().ToString();
        connect.Close();

        return detail;
    }


    //Adds a new product to product table.
    public static void addProduct(string name, string price, string ingredients, string description, string filename)
    {
        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand addNewProduct = new SqlCommand("INSERT INTO [ProductsTable] ([ProductName], [Description], [Price], [Ingredients], [Image]) VALUES (@name, @description, @price, @ingredients, @filename)", connect);
        addNewProduct.Parameters.AddWithValue("@name", name);
        addNewProduct.Parameters.AddWithValue("@price", price);
        addNewProduct.Parameters.AddWithValue("@ingredients", ingredients);
        addNewProduct.Parameters.AddWithValue("@description", description);
        addNewProduct.Parameters.AddWithValue("@filename", "~/Images/" + filename);
                connect.Open();
        addNewProduct.ExecuteNonQuery();
        connect.Close();
    }


    public static bool unigueEmail(string email)
    {
        SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand checkEmail = new SqlCommand("SELECT COUNT(*) FROM [CustomerTable] WHERE ([EmailAddress] = @email)", connect);
        checkEmail.Parameters.AddWithValue("@email", email);
        connect.Open();
        int tempRow = Convert.ToInt32(checkEmail.ExecuteScalar().ToString());
        connect.Close();

        if (tempRow > 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    //Returns 0 for an invalid login password.
    //Returns 1 for and admin.
    //Returns 2 for a customer.
    //Returns 4 for an invalid login email.
    public static int checkLoginEmail(string email, string password)
    {
        if (!unigueEmail(email))
        {
            SqlConnection connect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand checkPassword = new SqlCommand("SELECT [Password] FROM [CustomerTable] WHERE ([EmailAddress] = @email)", connect);
            SqlCommand checkAdmin = new SqlCommand("SELECT [IsAdmin] FROM [CustomerTable] WHERE ([EmailAddress] = @email)", connect);
            checkPassword.Parameters.AddWithValue("@email", email);
            connect.Open();
            String userPassword = checkPassword.ExecuteScalar().ToString();
            checkAdmin.Parameters.AddWithValue("@email", email);
            string isAdmin = checkAdmin.ExecuteScalar().ToString();
            connect.Close();

            if (userPassword == password)
            {
                if (isAdmin == "True")
                {
                    return 1;
                }
                else
                {
                    return 2;
                }
            }
            else
            {
                return 0;
            }
        }
        else
        {
            return 4;
        }
    }
}