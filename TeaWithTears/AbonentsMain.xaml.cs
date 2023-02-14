using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Window;

namespace TeaWithTears
{
    /// <summary>
    /// Логика взаимодействия для AbonentsMain.xaml
    /// </summary>
    public partial class AbonentsMain : Window
    {
        public AbonentsMain()
        {
            InitializeComponent();
        }

        Context db = Context.GetContext();
        private void Window_Initialized(object sender, EventArgs e)
        {
            MainWindow win = new MainWindow();
            win.ShowDialog();

            if (Data.IsLoginSuccessful == false) Close();

            Login usr = db.Login.Find(Data.UserId);
            var role = from p in db.Roles
                       where p.Id == usr.Role
                       select p.Role;
            MessageBox.Show(role.First());
        }

        private void ToggleButton_Checked(object sender, RoutedEventArgs e)
        {
        }
    }
}
