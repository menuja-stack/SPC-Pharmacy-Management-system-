<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Drug.aspx.cs" Inherits="Client.Drug" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insert Drug Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        nav {
            background-color: #3b82f6;
            padding: 1rem 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .navbar {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            justify-content: space-between;
            align-items: center;
        }

        .navbar li {
            margin: 0 0.5rem;
        }

        .navbar li a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            font-weight: bold;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .navbar li a:hover {
            background-color: #2563eb;
        }

        .btn-logout {
            background-color: #ef4444;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .btn-logout:hover {
            background-color: #dc2626;
        }

        .btn-logout:active {
            transform: scale(0.98);
        }

        form {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #3b82f6;
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
        }

        h3 {
            font-size: 1rem;
            color: #555;
            margin-bottom: 0.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 0.5rem 0;
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
            border-color: #3b82f6;
            box-shadow: 0 0 5px rgba(59, 130, 246, 0.3);
        }

        asp\:Button {
            width: 100%;
            padding: 0.7rem;
            font-size: 1rem;
            font-weight: bold;
            background-color: #3b82f6;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.2s;
        }

        asp\:Button:hover {
            background-color: #2563eb;
        }

        asp\:Button:active {
            transform: scale(0.98);
        }

        asp\:Label {
            display: block;
            margin-top: 1rem;
            text-align: center;
            font-size: 0.9rem;
            color: #d97706;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
            <ul class="navbar">
                <li><a href="StaffDashboard.aspx">Home</a></li>
                <li><a href="StockUpdate.aspx">Update Stock</a></li>
                <li><a href="Drug.aspx">Insert Drug Details</a></li>
                <li><a href="Order.aspx">View Orders</a></li>
                <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="btn-logout" PostBackUrl="~/Dashboard.aspx" />
            </ul>
        </nav>
        <h2>Insert Drug Information</h2>
        <table>
            <tr>
                <td><h3>Drug ID</h3></td>
                <td><asp:TextBox ID="txtDrugID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><h3>Drug Name</h3></td>
                <td><asp:TextBox ID="txtDrugName" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Drug can't be blank" ControlToValidate="txtDrugName" ForeColor="Red"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                <td><h3>Category</h3></td>
                <td><asp:TextBox ID="txtCategory" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category can't be blank" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                <td><h3>UnitPrice</h3></td>
                <td><asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Unit Price can't be blank" ControlToValidate="txtUnitPrice" ForeColor="Red"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                <td><h3>Stock Quantity</h3></td>
                <td><asp:TextBox ID="txtStockQuantity" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Quantity can't be blank" ControlToValidate="txtStockQuantity" ForeColor="Red"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                <td><h3>Source</h3></td>
                <td>
                    <asp:DropDownList ID="dlSourceType" runat="server">
                        <asp:ListItem>External</asp:ListItem>
                        <asp:ListItem>Manufactured</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblText" runat="server"></asp:Label>
    </form>
</body>
</html>
