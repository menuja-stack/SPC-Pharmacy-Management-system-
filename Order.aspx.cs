using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client
{
    public partial class Order : System.Web.UI.Page
    {
        WarehouseServiceReference.WarehouseWebServiceSoapClient obj =
new WarehouseServiceReference.WarehouseWebServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOrders();
        }

        private void LoadOrders()
        {
            DataSet ds = obj.GetAllOrder();
            if (ds != null && ds.Tables.Count > 0)
            {
                gvOrder.DataSource = ds.Tables[0];
                gvOrder.DataBind();
            }
        }


        protected void gvOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}