<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Crud_App.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Index</title>
    <style>
        .PageSize{
            max-width: 1200px;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
            text-align: left;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Button styling */
        button {
            background-color: #007BFF;
            border: none; /* Remove borders */
            color: white; /* White text */
            padding: 8px 16px; /* Some padding */
            text-align: center; /* Center the text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make button inline */
            font-size: 14px; /* Font size */
            margin: 4px 2px; /* Add some margin */
            cursor: pointer; /* Pointer cursor on hover */
            border-radius: 4px; /* Rounded corners */
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .PanelOne{
            float: left;
            width: 50%;
        }
        .PanelTwo{
            float: right;
            width: 40%;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="PageSize">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="PanelOne">
                    <table>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Name") %></td>
                                    <td><%# Eval("Age") %></td>
                                    <td><%# Eval("Gender") %></td>
<%--                                    <td><%# Eval("City") %></td>
                                    <td><%# Eval("Country") %></td>
                                    <td><%# Eval("Occupation") %></td>
                                    <td><%# Eval("Salary") %></td>
                                    <td><%# Eval("Department") %></td>
                                    <td><%# Eval("Experience") %></td>
                                    <td><%# Eval("Status") %></td>--%>
                                    <td><asp:Button ID="btnViewDetails" runat="server" Text="View Details" CommandName="ViewDetails" CommandArgument='<%# Eval("Name") %>' /></td>
                                </tr>
                            <div style="color:aqua;">
                    
                                
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                        </table>
                    </div>

                    <div class="PanelTwo">
                    <asp:Panel ID="PanelEdit" runat="server" Visible="False">
                        <h2>Edit Details</h2>
                        <div>
                            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                            <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblAge" runat="server" Text="Age:"></asp:Label>
                            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                            <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
                            <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblOccupation" runat="server" Text="Occupation:"></asp:Label>
                            <asp:TextBox ID="txtOccupation" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblSalary" runat="server" Text="Salary:"></asp:Label>
                            <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label>
                            <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblExperience" runat="server" Text="Experience:"></asp:Label>
                            <asp:TextBox ID="txtExperience" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lblStatus" runat="server" Text="Status:"></asp:Label>
                            <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </asp:Panel>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>
</body>
</html>
