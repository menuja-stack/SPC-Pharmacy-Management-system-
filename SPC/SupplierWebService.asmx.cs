using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SPC
{
    /// <summary>
    /// Summary description for SupplierWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SupplierWebService : System.Web.Services.WebService
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
        public string AutoSupplierId()
        {
            string SupplierID = null;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select SupplierID from SupplierTable", sqlCon);
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
                        SupplierID = "S00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        SupplierID = "S0" + CTR;
                    }
                    else if (CTR > 99)
                    {
                        CTR = CTR + 1;
                        SupplierID = "S" + CTR;
                    }
                }
                else
                {
                    SupplierID = "S001";
                }
                dr.Close();
            }
            catch (Exception e1)
            {
                SupplierID = e1.ToString();
            }
            return SupplierID;
        }

        [WebMethod]
        public string insertSupplier(string SupplierID, string Name, string ContactNumber, string Email)
        {
            int NoRows = 0;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("INSERT INTO SupplierTable VALUES ('" +
                                                SupplierID + "','" + Name + "','" + ContactNumber + "','" + Email + "');", sqlCon);


                NoRows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            return NoRows.ToString();
        }
    }
}
