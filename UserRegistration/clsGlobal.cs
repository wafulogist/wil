using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace UserRegistration
{
    class clsGlobal
    {
        public static MySqlConnection cnn = new MySqlConnection(Properties.Settings.Default.conString);
        public static MySqlCommand cmd;
        public static MySqlDataAdapter da;
        public static MySqlDataReader rdr;
    }
}
