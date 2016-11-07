<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Vrachi.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="surname_vrach" HeaderText="Фамилия" SortExpression="surname_vrach" />
            <asp:BoundField DataField="name_vrach" HeaderText="Имя" SortExpression="name_vrach" />
            <asp:BoundField DataField="lastname_vrach" HeaderText="Отчество" SortExpression="lastname_vrach" />
            <asp:BoundField DataField="number_kabinet" HeaderText="Номер Кабинета" SortExpression="number_kabinet" />
            <asp:BoundField DataField="study_vrach" HeaderText="Вуз" SortExpression="study_vrach" />
            <asp:BoundField DataField="experience" HeaderText="Опыт" SortExpression="experience" />
            <asp:BoundField DataField="phone_vrach" HeaderText="Телефон" SortExpression="phone_vrach" />
            <asp:BoundField DataField="born_vrach" HeaderText="Год рождения" SortExpression="born_vrach" />
            <asp:BoundField DataField="type_vrach_id" HeaderText="type_vrach_id" SortExpression="type_vrach_id" Visible="False" />
        </Columns>
    </asp:GridView>
    
    <asp:Label runat="server" Text="Фамилия"> </asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Имся"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Отчество"></asp:Label><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Номер Кабинета"></asp:Label><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Вуз"></asp:Label><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Специализация"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name_specialize" DataValueField="name_specialize" Height="30px" Width="134px"></asp:DropDownList> 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" SelectCommand="SELECT [name_specialize] FROM [specialize_vrach]"></asp:SqlDataSource>
    <br />
    <asp:Label runat="server" Text="Стаж"></asp:Label><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Номер телефона"></asp:Label><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Год рождения"></asp:Label><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox><br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" SelectCommand="SELECT [surname_vrach], [name_vrach], [lastname_vrach], [number_kabinet], [study_vrach], [experience], [phone_vrach], [born_vrach], [type_vrach_id] FROM [vrach]"></asp:SqlDataSource>
    
    <asp:Button ID="Button1" runat="server" Text="Add Record" OnClick="Button1_Click" />
    
</asp:Content>
