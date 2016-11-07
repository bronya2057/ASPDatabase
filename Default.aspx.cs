using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    
    public SqlConnection GetConnection()
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-K0J6SB5;Initial Catalog=hospital;Integrated Security=True");
        return con;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
            //BindDropDownList();
    }

    protected void Button1_Click(object sender, EventArgs e)    //INSERT WITH NAME JERK
    {


        string date_priyom = "'" + TextBox4.Text + "'";
        string time_priyom = "'" + TextBox2.Text + "'";
        string cost = "'" + TextBox3.Text + "'";
        string vrach_id = Convert.ToString(DropDownList1.SelectedValue);
        string patient_id = Convert.ToString(GridView3.SelectedDataKey.Value);

        string fields = "date_priyom, time_priyom, cost, vrach_id";
        string value = date_priyom + ", " + time_priyom + ", " + cost + ", " + vrach_id;
        add_record("priyom", fields, value);

        string sql_str = "SELECT MAX(id_priyom) FROM priyom ";
        DataTable dt = new DataTable();

        dt = get_query_to_grid(sql_str);
        string val = dt.Rows[0][0].ToString();

        string update_str = "UPDATE patient set priyom_id=" + val + " where id_patient=" + patient_id;

       update_record(update_str);
        GridView6.DataBind();

        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandType = System.Data.CommandType.Text;
        //cmd.CommandText = "INSERT INTO " + "priyom" + " (" + fields + ") VALUES (" + value + ")";
        //string str = "INSERT INTO " + "priyom" + " (" + fields + ") VALUES (" + value + ")";
        //cmd.Connection = con;
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

        //string sql_str = "SELECT MAX(id_priyom) FROM priyom ";
        //DataTable dt = new DataTable();

        /*   dt = rgz.get_query_to_grid(sql_str);
           string val = dt.Rows[0][0].ToString();

           string update_str = "UPDATE patient set priyom_id=" + val + " where id_patient=" + patient_id;

           rgz.update_record(update_str);
           this.priyomTableAdapter.Fill(this.hospitalDataSet.priyom);
           this.patientTableAdapter.Fill(this.hospitalDataSet.patient);


           string update_str = "UPDATE patient set priyom_id="+ val+ " where id_patient=" + patient_id;
           SqlConnection con = GetConnection();
            con.Open();

           SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
           cmd.CommandText = "INSERT INTO " + "priyom" + " (" + fields + ") VALUES (" + value + ")";
           cmd.ExecuteNonQuery();
            GridView1.DataBind();

           con.Close();*/
    }

    protected void Button2_Click(object sender, EventArgs e)    // delete where id > 8 
    {
        SqlConnection con = GetConnection();
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "delete from specialize_vrach where id_specialize>8";
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        con.Close();
    }

    protected void Button3_OnClick(object sender, EventArgs e)  // Search and insert to datagrid 2
    {
        TextBox2.Text = Convert.ToString(DropDownList1.SelectedValue); //TODO PRIMARY KEY TROUGH DATASOURCE
        //TextBox1.Text = Convert.ToString(DropDownList1.SelectedIndex);
        string search = TextBox1.Text;
        string str = "SELECT patient.id_patient, " +
" patient.priyom_id, " +
"patient.fio, " +
"patient.number_patient, " +
"patient.address, " +
"patient.district, " +
"patient.policynumber, " +
"patient.year, " +
"case when patient.sign > 0 then 'yes' else 'no' end sign, " +
"patient.department, " +
"privileges.name_privileges, " +
"privileges.cost_privileges " +
"FROM dbo.patient " +
"left join privileges on patient.privileges_id = privileges.id_privileges " +
"where patient.fio like '%" + search + "%'";
        SqlConnection con = GetConnection();
        SqlCommand xp = new SqlCommand(str, con);
        xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = TextBox1.Text;
        con.Open();
        xp.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = xp;
        DataSet ds = new DataSet();
        da.Fill(ds, "fio");
        GridView4.DataSource = ds;
        GridView4.DataBind();
        con.Close();
        
    }




    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    //private void BindDropDownList()
    //{
    //    //TextBox1.Text = DropDownList1.SelectedValue;

    //    DropDownList1.Items.Clear();
    //    DataTable dt = new DataTable();
    //    string surname = string.Empty;
    //    string name = string.Empty;
    //    string newName;
    //    SqlConnection connection =GetConnection();
    //    try
    //    {
    //        connection.Open();
    //        string sqlStatement = "SELECT * FROM vrach";
    //        SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
    //        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);

    //        sqlDa.Fill(dt);
    //        if (dt.Rows.Count > 0)
    //        {
    //            for (int i = 0; i < dt.Rows.Count; i++)
    //            {
    //                surname = dt.Rows[i]["surname_vrach"].ToString();
    //                name = dt.Rows[i]["name_vrach"].ToString();
    //                newName = surname + " ---- " + name;
    //                DropDownList1.Items.Add(new ListItem(newName));
    //            }
    //        }
    //    }
    //    catch (System.Data.SqlClient.SqlException ex)
    //    {
    //        string msg = "Fetch Error:";
    //        msg += ex.Message;
    //        throw new Exception(msg);
    //    }
    //    finally
    //    {
    //        connection.Close();
    //    }
    //}
    

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
      string id_patient = Convert.ToString(GridView3.SelectedDataKey.Values[0]);
        string id_priyom = Convert.ToString(GridView3.SelectedDataKey.Values[1]);
        if(id_priyom=="")
        {
            id_priyom = "1";
        }

        string str = " select id_priyom,"+
                "date_priyom," +
                  "time_priyom," +
                  "cost," +
                  "name_vrach," +
                  "surname_vrach " +
                  "FROM priyom "+
            "left join vrach on priyom.vrach_id = vrach.id_vrach left join patient on id_patient = id_priyom " +
            "where id_priyom = "+ id_priyom +"";
        SqlConnection con = GetConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = str;
        cmd.Connection = con;

        SqlCommand xp = new SqlCommand(str, con);
        xp.Parameters.Add("@id", SqlDbType.NVarChar).Value = id_priyom;
        con.Open();
        xp.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = xp;
        DataSet ds = new DataSet();
        da.Fill(ds, "id");
        GridView6.DataSource = ds;
        GridView6.DataBind();
        con.Close();
        /* con.Open();
         cmd.ExecuteNonQuery();
         DataSet ds = new DataSet();
        // da.Fill(ds, "fio");
         GridView6.DataSource = ds;
         con.Close();

         SqlDataAdapter da = new SqlDataAdapter();
         da.SelectCommand = xp;
         DataSet ds = new DataSet();
         da.Fill(ds, "fio");
         GridView4.DataSource = ds;
         GridView4.DataBind();
         con.Close();*/

    }

    public DataTable get_query_to_grid(string str)
    {
        SqlConnection rgz_connection =GetConnection();
        rgz_connection.Open();
        SqlCommand command = new SqlCommand();
        command.Connection = rgz_connection;
        command.CommandText = str;
        SqlDataReader reader = command.ExecuteReader();


        DataTable data = new DataTable();
        data.Load(reader);


        return data;

    }

    public void add_record(string table_name, string fields, string values)
    {
        SqlConnection sqlConnection1 = GetConnection();

        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
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

    public void update_record(string str)
    {
        SqlConnection sqlConnection1 =GetConnection();

        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.CommandText = str;
        //string str = "INSERT INTO " + table_name + " (" + fields + ") VALUES (" + values + ")";
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