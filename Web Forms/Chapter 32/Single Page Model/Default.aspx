<%@ Page Language="C#" %>
<%@ Import Namespace = "AutoLotConnectedLayer" %>
<%@ Assembly Name="AutoLotDAL" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Single Page Model</title>    
    <script runat="server">
        protected void ButtonFillDataClick(Object sender, EventArgs args)
        {
            var dal = new InventoryDAL();

            dal.OpenConnection(@"Data Source=(local)\SQLEXPRESS;" + 
                "Initial Catalog=AutoLot;Integrated Security=True");
            GridViewTable.DataSource = dal.GetAllInventoryAsList();
            GridViewTable.DataBind();

            dal.CloseConnection();
        }   
    </script>
</head>
<body>
    <form id="formGridView" runat="server">
        <asp:Label ID="LabelTop" runat="server" 
            Text="Click on the Button to Fill the Grid"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridViewTable" runat="server"></asp:GridView>
        <br />
        <asp:Button ID="ButtonFillGrid" runat="server" Text="Fill Grid" OnClick="ButtonFillDataClick" />
    </form>
</body>
</html>
