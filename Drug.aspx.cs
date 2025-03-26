using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class Drug : System.Web.UI.Page
    {
        WarehouseServiceReference.WarehouseWebServiceSoapClient obj =
   new WarehouseServiceReference.WarehouseWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDrugID.Text = obj.AutoDrugID();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblText.Text = "Data validated";

                string sourceType = dlSourceType.SelectedItem.Text;
                int quantity;

                try
                {
                    quantity = Convert.ToInt32(txtStockQuantity.Text);

                    string value = obj.insertDrug(
                        txtDrugID.Text,
                        txtDrugName.Text,
                        txtCategory.Text,
                        txtUnitPrice.Text, 
                        quantity,
                        sourceType
                    );

                    if (int.TryParse(value, out int norecord) && norecord > 0)
                    {
                        lblText.Text = "Record Successfully Added";
                    }
                    else
                    {
                        lblText.Text = "Failed to Add Record: " + value;
                    }
                }
                catch (Exception ex)
                {
                    lblText.Text = "An error occurred: " + ex.Message;
                }
            }


        }
    }
}