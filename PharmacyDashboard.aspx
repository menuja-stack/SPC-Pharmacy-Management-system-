<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PharmacyDashboard.aspx.cs" Inherits="Client.PharmacyDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacy Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }

        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 1.5rem;
        }

        h2 {
            color: #4f46e5;
            margin-bottom: 1rem;
        }

        h3 {
            font-size: 1rem;
            color: #555555;
            margin-bottom: 0.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        td {
            padding: 0.5rem 0.5rem;
            vertical-align: top;
        }

        asp\:TextBox, asp\:DropDownList {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
            color: #333333;
            box-sizing: border-box;
        }

        asp\:TextBox:focus, asp\:DropDownList:focus {
            outline: none;
            border-color: #4f46e5;
            box-shadow: 0 0 5px rgba(79, 70, 229, 0.3);
        }

        asp\:Button {
            padding: 0.7rem 1.5rem;
            font-size: 1rem;
            font-weight: bold;
            background-color: #4f46e5;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.2s;
        }

        asp\:Button:hover {
            background-color: #3730a3;
        }

        asp\:Button:active {
            transform: scale(0.98);
        }

        asp\:GridView {
            width: 100%;
            margin-top: 1rem;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            overflow: hidden;
        }

        asp\:GridView table {
            width: 100%;
            border-collapse: collapse;
        }

        asp\:GridView th, asp\:GridView td {
            padding: 0.5rem;
            text-align: left;
            border-bottom: 1px solid #d1d5db;
        }

        asp\:GridView th {
            background-color: #4f46e5;
            color: #ffffff;
        }

        asp\:Label {
            display: block;
            margin-top: 1rem;
            text-align: center;
            font-size: 0.9rem;
            color: #d97706;
        }

                .btn-logout {
            background-color: #ef4444;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .btn-logout:hover {
            background-color: #dc2626;
        }

        .btn-logout:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="btn-logout" PostBackUrl="~/Dashboard.aspx" />
            <h1>Pharmacy Dashboard</h1>

            <h2>Search Stock</h2>
            <table>
                <tr>
                    <td><h3>Drug ID</h3></td>
                    <td><asp:TextBox ID="txtDrugID" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="Btn_Search" runat="server" Text="Search Drugs" OnClick="Btn_Search_Click" />
                    </td>
                </tr>

                <tr>
                    <td colspan="3"><h2>Order Stock</h2></td>
                </tr>

                <tr>
                    <td><h3>Order ID</h3></td>
                    <td><asp:TextBox ID="txtOrderID" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><h3>Enter the Quantity</h3></td>
                    <td><asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><h3>Pharmacy Name</h3></td>
                    <td><asp:DropDownList ID="dlpharmacy" runat="server"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td colspan="3">
                        <asp:Button ID="btnOrderStock" runat="server" Text="Order Stock" OnClick="btnOrderStock_Click" />
                    </td>
                </tr>
            </table>

            <asp:GridView ID="StockGridView" runat="server"></asp:GridView>

            <asp:Label ID="lblText" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
