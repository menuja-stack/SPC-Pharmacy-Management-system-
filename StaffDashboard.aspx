<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDashboard.aspx.cs" Inherits="Client.StaffDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f4f6;
        }

        .navbar {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #3b82f6;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
        }

        .navbar li {
            display: inline-block;
        }

        .navbar li a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .navbar li a:hover {
            background-color: #2563eb;
            border-radius: 6px;
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

        .content {
            text-align: center;
            margin-top: 2rem;
            padding: 1rem;
        }

        .content h1 {
            font-size: 2rem;
            color: #333;
        }

        .quick-links {
            display: flex;
            justify-content: center;
            gap: 1rem;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        .quick-links a {
            text-decoration: none;
            background-color: #3b82f6;
            color: white;
            padding: 1rem 2rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .quick-links a:hover {
            background-color: #2563eb;
        }

        .quick-links a:active {
            transform: scale(0.98);
        }

        footer {
            background-color: #3b82f6;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .quick-links {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Navbar -->
            <ul class="navbar">
                <li><a href="StaffDashboard.aspx">Home</a></li>
                <li><a href="StockUpdate.aspx">Update Stock</a></li>
                <li><a href="Drug.aspx">Insert Drug Details</a></li>
                <li><a href="Order.aspx">View Orders</a></li>
                <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="btn-logout" PostBackUrl="~/Dashboard.aspx" />
            </ul>

            <!-- Content -->
            <div class="content">
                <h1>Welcome to the Staff Dashboard</h1>
                <p>Manage operations with ease.</p>
            </div>

            <!-- Quick Links -->
            <div class="quick-links">
                <a href="StockUpdate.aspx">Update Stock</a>
                <a href="Drug.aspx">Insert Drug Details</a>
                <a href="Order.aspx">View Orders</a>
            </div>

            <!-- Footer -->
            <footer>
                <p>&copy; 2025 Your Company Name. All rights reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>
