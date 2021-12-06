<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="my212_Project_32973934.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center;">

            <asp:LinkButton ID="LinkButton_logout" runat="server" ForeColor ="Blue" Font-Underline ="true" OnClick="LinkButton_logout_Click">Log Out</asp:LinkButton>

            <br /><br />

            Insert new Lecturer: <br />

            Fullname: <asp:TextBox ID="tb_fullname" runat="server"></asp:TextBox><br />
            Username: <asp:TextBox ID="tb_usernameLec" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="tb_passLec" runat="server"></asp:TextBox><br />
            Notes: <asp:TextBox ID="tb_notes" runat="server"></asp:TextBox><br />
            
            <asp:Label ID="lb_msg" runat="server" Text="" ForeColor ="Red"></asp:Label><br />
            <asp:Button ID="btn_InsertLec" runat="server" Text="Insert New Lecturer" OnClick="btn_InsertLec_Click" />
            
            <hr />

            Insert new Material: <br />

            Material Name: <asp:TextBox ID="tb_MName" runat="server"></asp:TextBox>
            <br />

            Lecturer Name: <asp:DropDownList ID="ddl_Lec" runat="server" DataSourceID="SqlDataSource_Lecturers" DataTextField="fullname" DataValueField="Id"></asp:DropDownList><br />
            
            Material Notes: <asp:TextBox ID="tb_MNotes" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_msgM" runat="server" Text="" ForeColor ="Red"></asp:Label><br />
            <asp:Button ID="btn_insertM" runat="server" Text="Insert New Material Information" OnClick="btn_insertM_Click" />
            
            <hr />

                        <div style="text-align:center;"><asp:Label ID="Label2" runat ="server" Text="Table of Students" Font-Size="X-Large"></asp:Label></div>

            <asp:GridView ID="GridView_Students" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource_Students" style="margin:0 auto; text-align:center;">
                <HeaderStyle BackColor ="Teal" ForeColor ="White" />
                <EmptyDataTemplate>

                    <asp:Label ID="Label1" runat ="server" Text="There are no Students" ForeColor="Red"></asp:Label>


                </EmptyDataTemplate>

                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="username" HeaderText="User Name" SortExpression="username" />
                    <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                    <asp:BoundField DataField="fullname" HeaderText="Full Name" SortExpression="fullname" />
                    <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
                    <asp:BoundField DataField="active" HeaderText="Activation State" SortExpression="active" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource_Students" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Students]" DeleteCommand="DELETE FROM [Students] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Students] ([username], [pass], [fullname], [notes], [active]) VALUES (@username, @pass, @fullname, @notes, @active)" UpdateCommand="UPDATE [Students] SET [username] = @username, [pass] = @pass, [fullname] = @fullname, [notes] = @notes, [active] = @active WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                    <asp:Parameter Name="Id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>

                        <br />

            <div style="text-align:center;"><asp:Label ID="Label1" runat ="server" Text="Table of Lecturers" Font-Size="X-Large"></asp:Label></div>
            <asp:GridView ID="GridView_Lecturers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource_Lecturers" style="margin:0 auto; text-align:center;" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">

                <HeaderStyle BackColor ="Teal" ForeColor ="White" />

                 <EmptyDataTemplate>

                    <asp:Label ID="Label1" runat ="server" Text="There are no Lecturers" ForeColor="Red"></asp:Label>


                </EmptyDataTemplate>

                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="username" HeaderText="Lecturer User Name" SortExpression="username" />
                    <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                    <asp:BoundField DataField="fullname" HeaderText="Full Name" SortExpression="fullname" />
                    <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
                    <asp:BoundField DataField="active" HeaderText="Activation State" SortExpression="active" />
                </Columns>
                 <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                 <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                 <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                 <RowStyle BackColor="White" ForeColor="#330099" />
                 <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                 <SortedAscendingCellStyle BackColor="#FEFCEB" />
                 <SortedAscendingHeaderStyle BackColor="#AF0101" />
                 <SortedDescendingCellStyle BackColor="#F6F0C0" />
                 <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource_Lecturers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Lecturers]" DeleteCommand="DELETE FROM [Lecturers] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Lecturers] ([username], [pass], [fullname], [notes], [active]) VALUES (@username, @pass, @fullname, @notes, @active)" UpdateCommand="UPDATE [Lecturers] SET [username] = @username, [pass] = @pass, [fullname] = @fullname, [notes] = @notes, [active] = @active WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                    <asp:Parameter Name="Id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />

            <div style="text-align:center;"><asp:Label ID="Label3" runat ="server" Text="Table of Materials" Font-Size="X-Large"></asp:Label></div>
            <asp:GridView ID="GridView_Materials" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_Material" style="margin:0 auto; text-align:center;">
                

                <HeaderStyle BackColor ="Teal" ForeColor ="White" />

                 <EmptyDataTemplate>

                    <asp:Label ID="Label1" runat ="server" Text="There are no Materials" ForeColor="Red"></asp:Label>


                </EmptyDataTemplate>

                <Columns>
                    <asp:BoundField DataField="MName" HeaderText="Material Name" SortExpression="MName" />
                    <asp:BoundField DataField="notes" HeaderText="Material Notes" SortExpression="notes" />
                    <asp:BoundField DataField="fullname" HeaderText="Lecturer Name" SortExpression="fullname" />
                    <asp:BoundField DataField="Expr1" HeaderText="Lecturer Notes" SortExpression="Expr1" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource_Material" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT Materials.MName, Materials.notes, Lecturers.fullname, Lecturers.notes AS Expr1 FROM Materials INNER JOIN Lecturers ON Materials.LID = Lecturers.Id" DeleteCommand="DELETE FROM [Materials] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Materials] ([MName], [LID], [notes]) VALUES (@MName, @LID, @notes)" UpdateCommand="UPDATE [Materials] SET [MName] = @MName, [LID] = @LID, [notes] = @notes WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MName" Type="String" />
                    <asp:Parameter Name="LID" Type="Int64" />
                    <asp:Parameter Name="notes" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MName" Type="String" />
                    <asp:Parameter Name="LID" Type="Int64" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
