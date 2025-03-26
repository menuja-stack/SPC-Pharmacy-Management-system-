<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supplier.aspx.cs" Inherits="Client.supplier" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
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
            margin-bottom: 1rem;
        }

        td {
            padding: 0.5rem;
            vertical-align: top;
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
            border-color: #3b82f6;
            box-shadow: 0 0 5px rgba(59, 130, 246, 0.3);
        }

        asp\:Button {
            padding: 0.7rem 1.5rem;
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
            color: #ef4444;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Supplier Registration</h2>
            <table>
                <tr>
                    <td><h3>Supplier ID</h3></td>
                    <td><asp:TextBox ID="txtSupplierId" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><h3>Supplier Name</h3></td>
                    <td><asp:TextBox ID="txtSuppliername" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Name can't be blank" ControlToValidate="txtSuppliername" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td><h3>Email</h3></td>
                    <td><asp:TextBox ID="txtSupplierEmail" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email can't be blank" ControlToValidate="txtSupplierEmail" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td><h3>Contact Number</h3></td>
                    <td><asp:TextBox ID="txtSupplierContact" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Contact Number can't be blank" ControlToValidate="txtSupplierContact" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>

            <asp:Label ID="lblText" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>