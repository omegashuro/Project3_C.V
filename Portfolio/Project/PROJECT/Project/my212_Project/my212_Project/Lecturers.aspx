<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecturers.aspx.cs" Inherits="my212_Project_32973934.Lecturers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="text-align:center;"><asp:Label ID="Label2" runat ="server" Text="Table of Students" Font-Size="X-Large"></asp:Label></div>

            <asp:GridView ID="GridView_Students" runat="server" AutoGenerateColumns="False" OnRowDataBound="GV_OnRowDataBound" DataSourceID="SqlDataSource_Materials" style="margin:0 auto; text-align:center;" Width="450px">
                <HeaderStyle BackColor ="Teal" ForeColor ="White" />
                <EmptyDataTemplate>

                    <asp:Label ID="Label1" runat ="server" Text="There are no Materials" ForeColor="Red"></asp:Label>


                </EmptyDataTemplate>
                 <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="200px" /> 

                        

                        <HeaderTemplate>

                            Material Name

                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:HiddenField ID="hf_id" runat="server" Value='<%# Eval("Id")%>' />
                            <asp:HyperLink ID="Hyperlink_" runat="server"><%# Eval("MName") %></asp:HyperLink>

                        </ItemTemplate>
                    </asp:TemplateField>
               </Columns>
                <Columns>
                    
                    
                    <asp:TemplateField>
                        <HeaderStyle Width="200px" /> 
                    <HeaderTemplate>Material Notes</HeaderTemplate>
                        <ItemTemplate>

                            <asp:Label ID="lb_notes" runat="server" Text ='<%# Eval("notes")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
               </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource_Materials" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT [Id], [MName], [notes] FROM [Materials] WHERE ([LID] = @LID)">
                <SelectParameters>
                    <asp:SessionParameter Name="LID" SessionField="LID" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
