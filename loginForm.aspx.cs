using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class loginForm : System.Web.UI.Page
    {
        loginServiceReference.LoginWebServiceSoapClient obj =
new loginServiceReference.LoginWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Username = txtUsername.Text;
            string Password = txtPassword.Text;

            string loginResult = obj.login(Username, Password);

            lblText.Text = loginResult;

            if (loginResult.Contains("Pharmacy Login Successful"))
            {
                Response.Redirect("PharmacyDashboard.aspx");
            }
            else if (loginResult.Contains("Staff Login Successful"))
            {
                Response.Redirect("StaffDashboard.aspx");
            }
            else
            {
                lblText.Text = "Invalid credentials. Please try again.";
            }

        }
    }
}