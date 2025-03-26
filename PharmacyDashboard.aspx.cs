using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class PharmacyDashboard : System.Web.UI.Page
    {
        WarehouseServiceReference.WarehouseWebServiceSoapClient obj =
new WarehouseServiceReference.WarehouseWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set the Stock ID text box to the generated order ID (from AutoOrderId)
                txtOrderID.Text = obj.AutoOrderId();

                // Get the list of pharmacies and populate the dropdown list
                DataSet ds = obj.getPharmacyName();
                dlpharmacy.DataSource = ds;
                dlpharmacy.DataBind();

                // Set the DataValueField for the dropdown to "PharmacyName"
                dlpharmacy.DataValueField = "Name";
                dlpharmacy.DataBind();

            }
        }

        protected void btnOrderStock_Click(object sender, EventArgs e)
        {
            // Retrieve the input values
            string DrugID = txtDrugID.Text;
            int quantity = Convert.ToInt32(txtQuantity.Text);
            string pharmacyName = dlpharmacy.SelectedItem.Text;  // Assuming dlPharmacy is a DropDownList for Pharmacy selection

            // Get the PharmacyID using the selected Pharmacy Name
            string pharmacyId = obj.getPharmacyId(pharmacyName);

            // Generate a new OrderID
            string orderId = obj.AutoOrderId();

            // Call PlaceOrder to insert the order details
            bool isOrderPlaced = obj.Order(orderId, pharmacyId, DrugID, quantity);

            // Display a message based on the result of the order placement
            if (isOrderPlaced)
            {
                lblText.Text = "Order has been successfully placed!";
            }
            else
            {
                lblText.Text = "Failed to place the order. Please check stock or try again.";
            }

            // Optionally, refresh the stock view grid
            StockGridView.DataSource = obj.SearchStock(DrugID);
            StockGridView.DataBind();

        }

        protected void Btn_Search_Click(object sender, EventArgs e)
        {
            // Retrieve the StockID entered in the text box
            string DrugID = txtDrugID.Text;

            // Call the SearchStockPharmacy method to get the stock data based on the StockID
            DataSet stockData = obj.SearchDrug(DrugID);

            // Set the data source of the gvStock to the filtered data and bind it
            StockGridView.DataSource = stockData;
            StockGridView.DataBind();
        }
    }
}