﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Patients.aspx.cs" Inherits="Contact" %>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/script.js"></script>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames ="id_patient" DataSourceID="SqlDataSource1" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" Width="915px">
        <Columns>
            <asp:BoundField DataField="id_patient" HeaderText="id_patient" InsertVisible="False" ReadOnly="True" SortExpression="id_patient" />
            <asp:BoundField DataField="fio" HeaderText="fio" SortExpression="fio" />
            <asp:BoundField DataField="number_patient" HeaderText="number_patient" SortExpression="number_patient" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
            <asp:BoundField DataField="policynumber" HeaderText="policynumber" SortExpression="policynumber" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
            <asp:BoundField DataField="name_privileges" HeaderText="name_privileges" SortExpression="name_privileges" />
            <asp:BoundField DataField="cost_privileges" HeaderText="cost_privileges" SortExpression="cost_privileges" />
        </Columns>
    </asp:GridView>
    
    <asp:Label runat="server" Text="ФИО"> </asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Номер карточки"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Адрес"></asp:Label><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Район"></asp:Label><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Номер Полиса"></asp:Label><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
    <asp:Label runat="server" Text="Год рождения"></asp:Label><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><br />


    
    <%--<asp:CheckBox ID="CheckBox1" runat="server" Text="Работник Предприятия"/><br />--%>
   <%-- <input id="Checkbox1" type="checkbox" />Работник предприятия--%>
    <asp:checkbox ID="checkbox1" runat="server" text="работник предприятия" OnCheckedChanged="checkbox1_CheckedChanged" AutoPostBack="true"/><br />

    <asp:Panel ID="Panel1" Visible="False" runat="server">
            <asp:Label ID="label7"  runat="server"  Text="Отдел"></asp:Label><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><br />
            <asp:Label ID="dropdownLabel" runat="server"  Text="Название Льготы"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" DataTextField="name_privileges" DataValueField="name_privileges" Height="30px" Width="141px" DataSourceID="SqlDataSource2" ></asp:DropDownList> 
    </asp:Panel>
      
    
    <asp:Button ID="Button1" runat="server" Text="Add Record" OnClick="Button1_Click"/>  <asp:Button ID="Button2" runat="server" Text="Delete Record" OnClick="Button2_Click"/><br />
   

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" SelectCommand="SELECT [name_privileges] FROM [privileges]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" 
        
        
        SelectCommand="select id_patient,fio,
[number_patient],
[address],
[district],
[policynumber],
[year],
[department],
name_privileges ,
[cost_privileges]from dbo.patient
Inner Join dbo.privileges
on dbo.privileges.id_privileges = dbo.patient.privileges_id"
       DeleteCommand="DELETE FROM [patient] WHERE [id_patient] = @id_patient">
        <DeleteParameters>
            <asp:Parameter Name="id_patient" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_patient" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id_patient" HeaderText="id_patient" InsertVisible="False" ReadOnly="True" SortExpression="id_patient" />
            <asp:BoundField DataField="fio" HeaderText="fio" SortExpression="fio" />
            <asp:BoundField DataField="number_patient" HeaderText="number_patient" SortExpression="number_patient" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
            <asp:BoundField DataField="policynumber" HeaderText="policynumber" SortExpression="policynumber" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="sign" HeaderText="sign" SortExpression="sign" />
            <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
            <asp:BoundField DataField="privileges_id" HeaderText="privileges_id" SortExpression="privileges_id" />
            <asp:BoundField DataField="priyom_id" HeaderText="priyom_id" SortExpression="priyom_id" />
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" 
        DeleteCommand="DELETE FROM [patient] WHERE [id_patient] = @id_patient" 
         SelectCommand="SELECT * FROM [patient]"
        InsertCommand ="Insert to " >
        <DeleteParameters>
            <asp:Parameter Name="id_patient" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:GridView ID="GridView3" runat="server" Width="201px">
    </asp:GridView>
    
</asp:Content>



