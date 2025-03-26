using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class supplier : System.Web.UI.Page
    {
        SupplierServiceReference.SupplierWebServiceSoapClient obj =
    new SupplierServiceReference.SupplierWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSupplierId.Text = obj.AutoSupplierId();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblText.Text = "Data validated";

                string value = obj.insertSupplier(
                    txtSupplierId.Text,
                    txtSuppliername.Text,
                    txtSupplierContact.Text,
                    txtSupplierEmail.Text
                );

                int norecord = Int32.Parse(value);

                if (norecord > 0)
                {
                    lblText.Text = "Record Successfully Added";
                }
                else
                {
                    lblText.Text = "Record Failed to Add";
                }
            }


        }
    }
}