using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SPC
{
    /// <summary>
    /// Summary description for WarehouseWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WarehouseWebService : System.Web.Services.WebService
    {
        SqlConnection sqlCon = null;
        public SqlConnection getConnection()
        {
            try
            {
                sqlCon = new SqlConnection
                    ("data source=LAPTOP-UPJJMA0A\\SQLEXPRESS;initial catalog=SPC;Integrated Security=True");

                sqlCon.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error connecting to Db" + ex);
            }
            return sqlCon;
        }

        [WebMethod]
        public string AutoDrugID()
        {
            string DrugID = null;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select DrugID from DrugTable", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                string id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        id = dr[0].ToString();
                    }
                    string idString = id.Substring(1);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        DrugID = "D00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        DrugID = "D0" + CTR;
                    }
                    else if (CTR > 99)
                    {
                        CTR = CTR + 1;
                        DrugID = "D" + CTR;
                    }
                }
                else
                {
                    DrugID = "D001";
                }
                dr.Close();
            }
            catch (Exception e1)
            {
                DrugID = e1.ToString();
            }
            return DrugID;
        }
        [WebMethod]
        public string insertDrug(string DrugID, string DrugName, string Category, string UnitPrice, int StockQuantity, string Source)
        {
            int NoRows = 0;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("INSERT INTO DrugTable VALUES ('" +
                                                        DrugID + "','" +
                                                        DrugName + "','" +
                                                        Category + "','" +
                                                        UnitPrice + "'," +
                                                        StockQuantity + ",'" +
                                                        Source + "');", sqlCon);
                NoRows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            return NoRows.ToString();
        }

        [WebMethod]
        public bool AddDrugStock(string DrugID, int newStock)
        {
            bool records = false;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("update DrugTable set StockQuantity = StockQuantity+" + newStock + "where DrugID='" + DrugID + "'", sqlCon);

                SqlDataReader dr = cmd.ExecuteReader();
                records = dr.HasRows;
                dr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error updating in the Drug stock" + ex);
            }
            return records;
        }

        [WebMethod]
        public DataSet SearchStock(string DrugName)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();

                string query = string.IsNullOrEmpty(DrugName) ?
                   "SELECT * FROM DrugTable" :
                   "SELECT * FROM DrugTable WHERE DrugName = '" + DrugName + "'";

                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "DrugTable");

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Drug Stock" + ex);
            }
            return ds;
        }

        [WebMethod]
        public DataSet getDrugName()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select DrugName from DrugTable", sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds, "DrugTable");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Drug Name " + ex);
            }
            return ds;
        }

        [WebMethod]
        public string getDrugId(string DrugName)
        {
            string DrugID = "";
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select DrugID from DrugTable where DrugName = '" + DrugName + "'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();

                Boolean records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        DrugID = dr[0].ToString();
                    }
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Drug Name" + ex);
            }
            return DrugID;
        }


        [WebMethod]
        public string AutoOrderId()
        {
            string OrderID = null;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select OrderID from OderTable", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                string id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        id = dr[0].ToString();
                    }
                    string idString = id.Substring(2);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        OrderID = "OD00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        OrderID = "OD0" + CTR;
                    }
                    else if (CTR > 99)
                    {
                        CTR = CTR + 1;
                        OrderID = "OD" + CTR;
                    }
                }
                else
                {
                    OrderID = "OD001";
                }
                dr.Close();
            }
            catch (Exception e1)
            {
                OrderID = e1.ToString();
            }
            return OrderID;
        }

        [WebMethod]
        public bool Order(string OrderID, string PharmacyID, string DrugID, int Quantity)
        {
            bool records = false;
            try
            {
                getConnection();

                SqlCommand cmdUpdateStock = new SqlCommand("UPDATE DrugTable SET StockQuantity = StockQuantity - " + Quantity + " WHERE DrugID = '" + DrugID + "' AND StockQuantity >= " + Quantity, sqlCon);

                int rowsAffected = cmdUpdateStock.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    SqlCommand cmdInsertOrder = new SqlCommand("INSERT INTO OderTable (OrderID, PharmacyID, DrugID, Quantity) VALUES ('" + OrderID + "', '" + PharmacyID + "', '" + DrugID + "', " + Quantity + ")", sqlCon);
                    int orderRowsAffected = cmdInsertOrder.ExecuteNonQuery();

                    if (orderRowsAffected > 0)
                    {
                        records = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error processing order: " + ex);
            }
            return records;
        }


        [WebMethod]
        public DataSet SearchDrug(string DrugID)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();

                string query = string.IsNullOrEmpty(DrugID) ?
                    "SELECT * FROM DrugTable" :
                    "SELECT * FROM DrugTable WHERE DrugID = '" + DrugID + "'";

                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "DrugTable");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching stock: " + ex);
            }
            return ds;
        }

        [WebMethod]
        public DataSet getPharmacyName()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand cmdDrug = new SqlCommand("Select Name from PharmacyTable",
                    sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmdDrug);

                da.Fill(ds, "PharmacyTable");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Pharmacy Name" + ex);
            }
            return ds;
        }

        [WebMethod]
        public string getPharmacyId(string Name)
        {
            string PharmacyID = "";
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand
                ("Select PharmacyID from  PharmacyTable where Name  ='" +
                Name + "'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();

                Boolean records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        PharmacyID = dr[0].ToString();
                    }
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Pharmacy Name" + ex);
            }
            return PharmacyID;
        }


        [WebMethod]
        public DataSet GetAllOrder()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();

                string query = "SELECT * FROM OderTable";

                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "OderTable");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error retrieving all Orders: " + ex);
            }
            return ds;
        }
    }

}
