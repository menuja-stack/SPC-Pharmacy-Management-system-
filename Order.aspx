<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Client.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .navbar {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #2196F3; /* Blue background */
        }

        .navbar li {
            float: left;
        }

        .navbar li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar li a:hover {
            background-color: #1976D2; /* Darker blue on hover */
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
    display: block; /* Make the button a block-level element */
    margin: 1rem auto; /* Automatically set left and right margins for centering */
}


        .btn-logout:hover {
            background-color: #dc2626;
        }

        .btn-logout:active {
            transform: scale(0.98);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .grid-view {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        .grid-view th, .grid-view td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .grid-view th {
            background-color: #2196F3; /* Blue background */
            color: white;
        }

        .grid-view tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="navbar">
                <li><a href="StaffDashboard.aspx">Home</a></li>
                <li><a href="StockUpdate.aspx">Update Stock</a></li>
                <li><a href="Drug.aspx">Insert Drug Details</a></li>
                <li><a href="Order.aspx">View Orders</a></li>
                <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="btn-logout" PostBackUrl="~/Dashboard.aspx" OnClick="Button1_Click" />
            </ul>

            <h1>Order Details</h1>

            <asp:GridView ID="gvOrder" runat="server" CssClass="grid-view" AutoGenerateColumns="true" OnSelectedIndexChanged="gvOrder_SelectedIndexChanged">
            </asp:GridView>
        </div>
    </form>
</body>
</html>