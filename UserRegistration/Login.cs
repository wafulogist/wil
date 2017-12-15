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
    public partial class Login : MetroForm
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
           
        }

        private void timer1_Tick_1(object sender, EventArgs e)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToString("hh: mm: ss tt");
           
            label2.Text = time;
            label1.Text = date;
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            
            
            #region Retrieval
            clsGlobal.cnn.Open();
            clsGlobal.cmd = new MySqlCommand("spStatus", clsGlobal.cnn);
            clsGlobal.cmd.CommandType = CommandType.StoredProcedure;
            clsGlobal.cmd.Parameters.Clear();
            clsGlobal.cmd.Parameters.AddWithValue("petsa", label1.Text);
            clsGlobal.cmd.Parameters.AddWithValue("id", int.Parse(txtId.Text));
            clsGlobal.rdr = clsGlobal.cmd.ExecuteReader();
            clsGlobal.rdr.Read();
            int stat = int.Parse(clsGlobal.rdr[0].ToString());
            string name = clsGlobal.rdr[1].ToString();
            lblName.Text = clsGlobal.rdr[1].ToString();
            clsGlobal.cnn.Close();
            lblStatus.Text = (stat % 2 == 0) ? "Time In" : "Time Out";
            lblTime.Text = label2.Text;
            #endregion

            #region savingLogs
            clsGlobal.cnn.Open();
            clsGlobal.cmd = new MySqlCommand("spAddLog", clsGlobal.cnn);
            clsGlobal.cmd.CommandType = CommandType.StoredProcedure;
            clsGlobal.cmd.Parameters.Clear();
            clsGlobal.cmd.Parameters.AddWithValue("id", int.Parse(txtId.Text));
            clsGlobal.cmd.Parameters.AddWithValue("araw", label1.Text);
            clsGlobal.cmd.Parameters.AddWithValue("oras", label2.Text);
            clsGlobal.cmd.Parameters.AddWithValue("stats", stat);
            clsGlobal.cmd.ExecuteNonQuery();
            clsGlobal.cnn.Close();
            MessageBox.Show("added");
            #endregion




        }
    }
}
