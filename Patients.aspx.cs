using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{

    public int sign = 0;
    public static SqlConnection GetConnection()
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K0J6SB5;Initial Catalog=hospital;Integrated Security=True");
        return con;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string fio = "'" + TextBox1.Text + "'";
        string number_patient = TextBox2.Text;
        string address = "'" + TextBox3.Text + "'";
        string district = "'" + TextBox4.Text + "'";
        string policynumber = TextBox5.Text;
        string year = TextBox6.Text;
        string sign_patient = Convert.ToString(sign);   //checkBox;
        string department = "'" + TextBox7.Text + "'";
        string privileges_id;
        if (DropDownList1.SelectedIndex<1) 
            privileges_id="1";
         else privileges_id= Convert.ToString(DropDownList1.SelectedIndex);

        string fields = "fio, number_patient,address, district, policynumber, year, sign, department, privileges_id   ";
        string value = fio + ", " + number_patient + ", " + address + ", " + district + ", " + policynumber + ", " + year + ", " + sign_patient + ", " + department + ", " + privileges_id;
        add_record("patient", fields, value);
        GridView1.DataBind();
        
    }

    public static void add_record(string table_name, string fields, string values)
    {
        SqlConnection sqlConnection1 = GetConnection();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.CommandText = "INSERT INTO " + table_name + " (" + fields + ") VALUES (" + values + ")";
        string str = "INSERT INTO " + table_name + " (" + fields + ") VALUES (" + values + ")";
        // "INSERT INTO table_name (column1,column2,column3,...) VALUES(value1, value2, value3,...); ";
        cmd.Connection = sqlConnection1;

        sqlConnection1.Open();
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (SqlException e) { }

        sqlConnection1.Close();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        if (checkbox1.Checked)
        {
            Panel1.Visible = true;
            sign = 1;
        }
        if (!checkbox1.Checked)
        {
            Panel1.Visible = false;
            sign = 0;
        }
    }
}