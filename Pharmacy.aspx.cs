using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class Pharmacy : System.Web.UI.Page
    {
        loginServiceReference.LoginWebServiceSoapClient obj =
new loginServiceReference.LoginWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    txtPharmacyId.Text = obj.AutoPharmacyID();
                    txtUserId.Text = obj.AutoUserId();
                }
                catch (Exception ex)
                {
                    lblText.Text = "Error: " + ex.Message;
                }
            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblText.Text = "Data validated";

                string value = obj.insertPharmacy(
                    txtPharmacyId.Text,
                    txtPharmacyname.Text,
                    txtLocation.Text,
                    txtContact.Text,
                    txtUsername.Text,
                    txtPassword.Text
                );

                int norecord = Int32.Parse(value);

                if (norecord > 0)
                {
                    lblText.Text = "Pharmacy Registered Successfully";
                }
                else
                {
                    lblText.Text = "Pharmacy Registration Failed";
                }
            }


        }
    }
}