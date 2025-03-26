<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Client.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPC Pharmacy Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .sidebar {
            width: 250px;
            background-color: #343a40;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            color: white;
            padding-top: 20px;
        }

        .logo {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid #4f5962;
        }

        .nav-menu {
            padding: 20px 0;
        }

        .nav-item {
            padding: 15px 25px;
            color: #c2c7d0;
            text-decoration: none;
            display: block;
            transition: 0.3s;
        }

        .nav-item:hover {
            background-color: #494e53;
            color: white;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .header {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin-bottom: 10px;
            color: #343a40;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <div class="logo">
                <h2>SPC PHARMACY</h2>
            </div>
            <div class="nav-menu">
                <asp:HyperLink runat="server" CssClass="nav-item" NavigateUrl="~/Dashboard.aspx">
                    Dashboard
                </asp:HyperLink>
                <asp:HyperLink runat="server" CssClass="nav-item" NavigateUrl="~/Pharmacy.aspx">
                    Pharmacy Registration
                </asp:HyperLink>
                <asp:HyperLink runat="server" CssClass="nav-item" NavigateUrl="~/supplier.aspx">
                    Supplier Registration
                </asp:HyperLink>
               
                <asp:HyperLink runat="server" CssClass="nav-item" NavigateUrl="~/loginForm.aspx">
                    Login
                </asp:HyperLink>
            </div>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Dashboard</h1>
                <p>Welcome to SPC Pharmacy</p>
            </div>

            <div class="dashboard-cards">
                <div class="card">
                    <h3>Supplier Registration</h3>
                    <p>Manage supplier details and new registrations</p>
                </div>
                <div class="card">
                    <h3>Stock Management</h3>
                    <p>Monitor and manage medicine inventory</p>
                </div>
                <div class="card">
                    <h3>Order Management</h3>
                    <p>Track and process medicine orders</p>
                </div>
                <div class="card">
                    <h3>Medicine Inventory</h3>
                    <p>View available medicines and stock levels</p>
                </div>
                <div class="card">
                    <h3>Pharmacy Registration</h3>
                    <p>Manage Pharmacy Registrations</p>
                </div>
            </div>

        </div>
    </form>
</body>
</html>