<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pharmacy.aspx.cs" Inherits="Client.Pharmacy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacy Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        h3 {
            margin: 0;
            font-size: 16px;
            color: #555;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn-submit {
            width: 100%;
            background-color: #2196F3;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #1976D2;
        }

        .label-text {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form">
            <h2>Pharmacy Registration</h2>
            <table>
                <tr>
                    <td><h3>Pharmacy ID</h3></td>
                    <td><asp:TextBox ID="txtPharmacyId" runat="server" CssClass="input-field"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><h3>User ID</h3></td>
                    <td><asp:TextBox ID="txtUserId" runat="server" CssClass="input-field"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><h3>Enter Name</h3></td>
                    <td><asp:TextBox ID="txtPharmacyname" runat="server" CssClass="input-field"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Name can't be blank" ControlToValidate="txtPharmacyname" ForeColor="Red"></asp:RequiredFieldValidator></td>

                </tr>

                <tr>
                    <td><h3>Enter the Location</h3></td>
                    <td><asp:TextBox ID="txtLocation" runat="server" CssClass="input-field"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Location can't be blank" ControlToValidate="txtLocation" ForeColor="Red"></asp:RequiredFieldValidator></td>

                </tr>

                <tr>
                    <td><h3>Enter the Contact No</h3></td>
                    <td><asp:TextBox ID="txtContact" runat="server" CssClass="input-field"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Contact No can't be blank" ControlToValidate="txtContact" ForeColor="Red"></asp:RequiredFieldValidator></td>

                </tr>

                <tr>
                    <td><h3>Enter the Username</h3></td>
                    <td><asp:TextBox ID="txtUsername" runat="server" CssClass="input-field"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="UserName can't be blank" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator></td>

                </tr>

                <tr>
                    <td><h3>Enter the Password</h3></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password can't be blank" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn-submit" Text="Add Details" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblText" runat="server" CssClass="label-text"></asp:Label>
        </div>
    </form>
</body>
</html>