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
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace TeaWithTears
{
    /// <summary>
    /// Логика взаимодействия для CodeWin.xaml
    /// </summary>
    public partial class CodeWin : Window
    {
        public CodeWin()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            string masChar = "QWERTYUIOPASDFGHJKLZXCVBNM" +
            "qwertyuiopasdfghjklzxcvbnm" +
            "1234567890" +
            "!?\"'/\\()[]_-@#№$;%^:&*+={}";
            Random rnd = new Random();
            string code = "";
            for (int i = 1; i <= 8; i++)
                code += masChar[rnd.Next(0, masChar.Length)];
            Data.code = code;
            tb.Text = "Код: " + code;
        }
    }
}
