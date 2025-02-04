using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using WsApp.Classes;

namespace WsApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Navigation.ActiveFrame = MainFrame;
            Navigation.ActiveFrame.Navigate(new Pages.ListPage());
        }
    }
}