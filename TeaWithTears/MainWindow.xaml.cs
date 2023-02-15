using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace TeaWithTears
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : System.Windows.Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        Context db = Context.GetContext();
        private void GetCode_Click(object sender, RoutedEventArgs e)
        {
            CodeWin win = new CodeWin();
            win.ShowDialog();
            Enter.IsEnabled = true;
            codeTb.IsEnabled = true;
            codeTb.Focus();
            timer = new DispatcherTimer();
            timer.Interval = new TimeSpan(0, 0, 10);
            timer.Tick += new EventHandler(timer_Tick);
            timer.Start();
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Enter_Click(object sender, RoutedEventArgs e)
        {
            if (Data.code == codeTb.Text)
            {
                timer.Stop();
                Data.IsLoginSuccessful = true;
                var find = from p in db.Login
                           where p.Number == number.Text
                           select p.Id;
                Data.UserId = find.First();
                Close();
            }
            else if (codeTb.Text.Length != 0) MessageBox.Show("Код неверен");
        }

        private void number_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                var find = from p in db.Login
                           where p.Number == number.Text
                           select p;
                if (find.Any())
                {
                    pw.IsEnabled = true;
                    pw.Focus();
                }
                else MessageBox.Show("Номер не найден");
            }
        }

        DispatcherTimer timer;
        private void timer_Tick(object sender, EventArgs e)
        {
            MessageBox.Show("Получите новый код");
            GetCode.IsEnabled = true;
            img.Visibility = Visibility.Visible;
            Data.code = "";
        }

        private void pw_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                var find = from p in db.Login
                           where p.Number == number.Text
                           select p.Password;
                if (find.First() == pw.Password)
                {
                    CodeWin win = new CodeWin();
                    win.ShowDialog();
                    Enter.IsEnabled = true;
                    codeTb.IsEnabled = true;
                    codeTb.Focus();
                    timer = new DispatcherTimer();
                    timer.Interval = new TimeSpan(0, 0, 10);
                    timer.Tick += new EventHandler(timer_Tick);
                    timer.Start();
                }
                else MessageBox.Show("Пароль неверен");
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            number.Focus();
        }
    }
}
