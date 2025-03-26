using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SPC
{
    /// <summary>
    /// Summary description for LoginWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class LoginWebService : System.Web.Services.WebService
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
        public string AutoPharmacyID()
        {
            string PharmacyID = null;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select PharmacyID from PharmacyTable", sqlCon);
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
                        PharmacyID = "P00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        PharmacyID = "P0" + CTR;
                    }
                    else if (CTR > 99)
                    {
                        CTR = CTR + 1;
                        PharmacyID = "P" + CTR;
                    }
                }
                else
                {
                    PharmacyID = "P001";
                }
                dr.Close();
            }
            catch (Exception e1)
            {
                PharmacyID = e1.ToString();
            }
            return PharmacyID;
        }

        [WebMethod]
        public string insertPharmacy(string PharmacyID, string Name, string Location, string ContactNumber, string Username, string Password)
        {
            int NoRows = 0;
            string UserID = AutoUserId();
            try
            {
                getConnection();


                SqlCommand cmd1 = new SqlCommand("INSERT INTO PharmacyTable (PharmacyID, Name, Location, ContactNumber) VALUES ('" +
                    PharmacyID + "', '" + Name + "', '" + Location + "', '" + ContactNumber + "');", sqlCon);
                NoRows = cmd1.ExecuteNonQuery();


                SqlCommand cmd2 = new SqlCommand("INSERT INTO UserTable (UserID, Username, Password, Role, PharmacyID) VALUES ('" +
                    UserID + "', '" + Username + "', '" + Password + "', 'Pharmacy', '" + PharmacyID + "');", sqlCon);
                NoRows += cmd2.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
            return NoRows.ToString();
        }

        [WebMethod]
        public string AutoUserId()
        {
            string UserID = null;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Select UserID from UserTable", sqlCon);
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
                        UserID = "US00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        UserID = "US0" + CTR;
                    }
                    else if (CTR > 99)
                    {
                        CTR = CTR + 1;
                        UserID = "US" + CTR;
                    }
                }
                else
                {
                    UserID = "US001";
                }
                dr.Close();
            }
            catch (Exception e1)
            {
                UserID = e1.ToString();
            }
            return UserID;
        }

        [WebMethod]
        public string login(string Username, string Password)
        {
            string result = "Invalid Credentials";
            try
            {
                getConnection();

                string query = "SELECT UserID, Role, Password FROM UserTable WHERE Username = '" + Username + "' AND Password = '" + Password + "'";

                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        string userRole = dr["Role"].ToString();
                        result = userRole + " Login Successful";
                    }
                }
                else
                {
                    result = "Invalid Credentials";
                }
            }
            catch (Exception ex)
            {
                result = "Error: " + ex.ToString();
            }
            return result;
        }

    }
}
