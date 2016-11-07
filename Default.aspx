<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-fluid">
     <div class="row">
        <div class="col-sm-3 col-md-6" style="background-color:yellow;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_specialize" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id_specialize" HeaderText="id_specialize" InsertVisible="False" ReadOnly="True" SortExpression="id_specialize" />
                    <asp:BoundField DataField="name_specialize" HeaderText="name_specialize" SortExpression="name_specialize" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-sm-9 col-md-6" style="background-color:pink;">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="582px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" DataKeyNames="id_patient,priyom_id">
                <Columns>
                    
                    <asp:CommandField ShowSelectButton="True" />
                    
                    <asp:BoundField DataField="fio" HeaderText="fio" SortExpression="fio" />
                    <asp:BoundField DataField="number_patient" HeaderText="number_patient" SortExpression="number_patient" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
                    <asp:BoundField DataField="policynumber" HeaderText="policynumber" SortExpression="policynumber" />
                    <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                    <asp:BoundField DataField="sign" HeaderText="sign" SortExpression="sign" />
                   <%-- <asp:BoundField  DataField="id_patient" HeaderText="id_patient" InsertVisible="False" ReadOnly="True" SortExpression="id_patient" />--%>
                    <%--<asp:BoundField DataField="id_patient" HeaderText="id_patient" InsertVisible="False" ReadOnly="True" SortExpression="id_patient" />
                    <asp:BoundField DataField="priyom_id" HeaderText="priyom_id" SortExpression="priyom_id" />--%>
                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" SelectCommand="SELECT [fio], [number_patient], [address], [district], [policynumber], [year], [sign], [id_patient], [priyom_id] FROM [patient]"></asp:SqlDataSource>
            <asp:GridView ID="GridView4" runat="server">

            </asp:GridView>
        </div>
    </div>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="New Item" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [specialize_vrach]"></asp:SqlDataSource>
       <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_OnClick" />
    <asp:Button ID="Button2" runat="server" Text="Delete Item" OnClick="Button2_Click" />

    </div>
    
    <asp:Label ID="Label1" runat="server" Text="Time"></asp:Label>  <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="Cost"></asp:Label> <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label4" runat="server" Text="FIO vrach"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="whole" DataValueField="id_vrach"></asp:DropDownList>                 
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" SelectCommand="select surname_vrach+ ' ' + name_vrach as whole ,id_vrach from vrach "></asp:SqlDataSource>
<%--    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="465px">
        <Columns>
            <asp:BoundField DataField="date_priyom" HeaderText="date_priyom" SortExpression="date_priyom" />
            <asp:BoundField DataField="time_priyom" HeaderText="time_priyom" SortExpression="time_priyom" />
            <asp:BoundField DataField="cost" HeaderText="cost" SortExpression="cost" />
            <asp:BoundField DataField="surname_vrach" HeaderText="surname_vrach" SortExpression="surname_vrach" />
            <asp:BoundField DataField="name_vrach" HeaderText="name_vrach" SortExpression="name_vrach" />
        </Columns>
    </asp:GridView>--%>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:hospitalConnectionString %>" 
        SelectCommand="SELECT priyom.date_priyom, priyom.time_priyom, priyom.cost, vrach.surname_vrach, vrach.name_vrach FROM priyom INNER JOIN vrach ON priyom.vrach_id = vrach.id_vrach GROUP BY priyom.date_priyom, priyom.time_priyom, priyom.cost, vrach.surname_vrach, vrach.name_vrach"
        
        ></asp:SqlDataSource>
    <asp:GridView ID="GridView6" runat="server">
    </asp:GridView>
    <br />
</asp:Content>
