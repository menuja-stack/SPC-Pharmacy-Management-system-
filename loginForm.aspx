<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginForm.aspx.cs" Inherits="Client.loginForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 1.5rem;
        }

        h3 {
            font-size: 1rem;
            color: #555555;
            margin-bottom: 0.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 0.5rem 0;
        }

        asp\:TextBox {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
            color: #333333;
            box-sizing: border-box;
        }

        asp\:TextBox:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 5px rgba(37, 99, 235, 0.3);
        }

        asp\:Button {
            width: 100%;
            padding: 0.7rem;
            font-size: 1rem;
            font-weight: bold;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.2s;
        }

        asp\:Button:hover {
            background-color: #1e40af;
        }

        asp\:Button:active {
            transform: scale(0.98);
        }

        .label-text {
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
        <div>
            <h2>Login</h2>
            <table>
                <tr>
                    <td><h3>Enter the Username</h3></td>
                    <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><h3>Enter the Password</h3></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblText" runat="server" CssClass="label-text"></asp:Label>
        </div>
    </form>
</body>
</html>