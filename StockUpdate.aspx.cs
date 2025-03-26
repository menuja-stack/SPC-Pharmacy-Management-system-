using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class StockUpdate : System.Web.UI.Page
    {
        WarehouseServiceReference.WarehouseWebServiceSoapClient obj =
new WarehouseServiceReference.WarehouseWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Get the list of drugs and populate the dropdown list
                DataSet DropdownDrug = obj.getDrugName();
                dlDrugDetails.DataSource = DropdownDrug;
                dlDrugDetails.DataValueField = "DrugName";
                dlDrugDetails.DataBind();

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Retrieve the StockID entered in the text box
            string DrugName = dlDrugDetails.Text;

            // Call the SearchStockPharmacy method to get the stock data based on the StockID
            DataSet stockData = obj.SearchStock(DrugName);

            // Set the data source of the gvStock to the filtered data and bind it
            DrugGridView.DataSource = stockData;
            DrugGridView.DataBind();

            DrugGridView.DataSource = obj.SearchStock(dlDrugDetails.Text);
            DrugGridView.DataBind();
        }

        protected void btnAddStock_Click(object sender, EventArgs e)
        {
            String DrugID = obj.getDrugId(dlDrugDetails.SelectedItem.Text);
            int stockQuantity = Convert.ToInt32(txtStockQuantity.Text);

            bool isSuccess = obj.AddDrugStock(DrugID, stockQuantity);

            DrugGridView.DataSource = obj.SearchStock(DrugID);
            DrugGridView.DataBind();

            if (isSuccess)
            {
                lblText.Text = "Failed to add stock.";
            }
            else
            {
                lblText.Text = "Stock added successfully!";
            }

        }
    }
}
