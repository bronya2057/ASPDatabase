using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{

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
        string surname = "'" +TextBox1.Text + "'";
        string name = "'" + TextBox2.Text + "'";
        string lastname = "'" + TextBox3.Text + "'";
        string number_kabinet = TextBox4.Text;
        string study = "'" + TextBox5.Text + "'";
        string name_specialize = Convert.ToString(DropDownList1.SelectedIndex);
        string experience = "'" + TextBox7.Text + "'";
        string phone = TextBox8.Text;
        string born = TextBox9.Text;


        string fields = "surname_vrach, name_vrach, lastname_vrach, number_kabinet, study_vrach, type_vrach_id, experience, phone_vrach, born_vrach";
        string value = surname + ", " + name + ", " + lastname + ", " + number_kabinet + ", " + study + ", " + name_specialize + ", " + experience + ", " + phone + ", " + born;
        add_record("vrach", fields, value);
        GridView1.DataBind();
        //this.vrachTableAdapter.Fill(this.hospitalDataSet.vrach);
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
}