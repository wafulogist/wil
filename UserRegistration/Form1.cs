using MetroFramework.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
namespace UserRegistration
{
    public partial class picStudent : MetroForm
    {
        public picStudent()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void metroTextBox3_Click(object sender, EventArgs e)
        {

        }

        private void metroButton1_Click(object sender, EventArgs e)
        {

       
            clsGlobal.cnn.Open();
            clsGlobal.cmd = new MySqlCommand("spAddPerson", clsGlobal.cnn);
            clsGlobal.cmd.CommandType = CommandType.StoredProcedure; 
            clsGlobal.cmd.Parameters.Clear();
            clsGlobal.cmd.Parameters.AddWithValue("fname", txtFname.Text.ToString());
            clsGlobal.cmd.Parameters.AddWithValue("mname", txtMname.Text.ToString());
            clsGlobal.cmd.Parameters.AddWithValue("lname", txtLname.Text.ToString());
            clsGlobal.cmd.Parameters.AddWithValue("suf", txtSuffix.Text.ToString());
            clsGlobal.cmd.Parameters.AddWithValue("bd", birthdate.Value.ToString("yyyy-MM-dd"));
            clsGlobal.cmd.Parameters.AddWithValue("sex", cboGender.SelectedItem.ToString());
            clsGlobal.cmd.ExecuteNonQuery();
            clsGlobal.cnn.Close();
            MessageBox.Show("succes");


        }
    }
}
