using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
using WsApp.Model;

namespace WsApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ListPage.xaml
    /// </summary>
    public partial class ListPage : Page
    {
        private List<Model.Employees> Employees { get; set; }
        public ListPage()
        {
            InitializeComponent();
            OnStart();
        }
        private void OnStart()
        {
            ListBoxRow1.Visibility = Visibility.Visible;
            ListBoxRow2.Visibility = Visibility.Collapsed;
            ListBoxRow3.Visibility = Visibility.Collapsed;
            ListBoxRow4.Visibility = Visibility.Collapsed;
            LoadRow1Data();
        }
        private void GetEmployees()
        {
            Employees = Model.WSDBEntities.GetContext().Employees.ToList();
        }
        private void LoadRow1Data()
        {
            ListBoxRow1.ItemsSource = Model.WSDBEntities.GetContext().Organisation.ToList();
        }

        private void ListBoxRow1_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListBoxRow1.SelectedItem is Model.Organisation selectedItemRow1)
            {
                GetEmployees();
                int OrgId = (ListBoxRow1.SelectedItem as Model.Organisation).Id;
                ListBoxRow2.ItemsSource = Model.WSDBEntities.GetContext().DepartmentLevel1.ToList()
                    .Where(d => d.ParentId == OrgId).ToList();
                Employees = Employees
                    .Where(d => d.OrganisationId == OrgId)
                    .OrderBy(i => i.Surname)
                    .ThenBy(i => i.Name)
                    .ThenBy(i => i.Patronym)
                    .ToList();
                ListBoxRow2.Visibility = Visibility.Visible;
                ListBoxRow3.Visibility = Visibility.Collapsed;
                ListBoxRow4.Visibility = Visibility.Collapsed;
                EmployeesListView.ItemsSource = Employees;
            }
        }

        private void ListBoxRow2_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListBoxRow2.SelectedItem is Model.DepartmentLevel1 selectedItemRow2)
            {
                GetEmployees();
                int OrgId = (ListBoxRow1.SelectedItem as Model.Organisation).Id;
                int Dep1Id = (ListBoxRow2.SelectedItem as Model.DepartmentLevel1).Id;
                ListBoxRow3.ItemsSource = Model.WSDBEntities.GetContext().DepartmentLevel2.ToList()
                    .Where(d => d.ParentId == Dep1Id).ToList();
                Employees = Employees
                    .Where(d => d.OrganisationId == OrgId && d.DepartmentLevel1Id == Dep1Id)
                    .OrderBy(i => i.Surname)
                    .ThenBy(i => i.Name)
                    .ThenBy(i => i.Patronym)
                    .ToList();
                ListBoxRow3.Visibility = Visibility.Visible;
                ListBoxRow4.Visibility = Visibility.Collapsed;
                EmployeesListView.ItemsSource = Employees;
            }
        }

        private void ListBoxRow3_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListBoxRow3.SelectedItem is Model.DepartmentLevel2 selectedItemRow3)
            {
                GetEmployees();
                int OrgId = (ListBoxRow1.SelectedItem as Model.Organisation).Id;
                int Dep1Id = (ListBoxRow2.SelectedItem as Model.DepartmentLevel1).Id;
                int Dep2Id = (ListBoxRow3.SelectedItem as Model.DepartmentLevel2).Id;
                ListBoxRow4.ItemsSource = Model.WSDBEntities.GetContext().DepartmentLevel3.ToList()
                    .Where(d => d.ParentId == Dep2Id).ToList();
                Employees = Employees
                    .Where(d => d.OrganisationId == OrgId
                    && d.DepartmentLevel1Id == Dep1Id
                    && d.DepartmentLevel2Id == Dep2Id)
                    .OrderBy(i => i.Surname)
                    .ThenBy(i => i.Name)
                    .ThenBy(i => i.Patronym)
                    .ToList();
                ListBoxRow4.Visibility = Visibility.Visible;
                EmployeesListView.ItemsSource = Employees;
            }
        }
        private void ListBoxRow4_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListBoxRow4.SelectedItem is Model.DepartmentLevel3 selectedItemRow4)
            {
                GetEmployees();
                int OrgId = (ListBoxRow1.SelectedItem as Model.Organisation).Id;
                int Dep1Id = (ListBoxRow2.SelectedItem as Model.DepartmentLevel1).Id;
                int Dep2Id = (ListBoxRow3.SelectedItem as Model.DepartmentLevel2).Id;
                int Dep3Id = (ListBoxRow4.SelectedItem as Model.DepartmentLevel3).Id;
                Employees = Employees
                    .Where(d => d.OrganisationId == OrgId
                    && d.DepartmentLevel1Id == Dep1Id
                    && d.DepartmentLevel2Id == Dep2Id
                    && d.DepartmentLevel3Id == Dep3Id)
                    .OrderBy(i => i.Surname)
                    .ThenBy(i => i.Name)
                    .ThenBy(i => i.Patronym)
                    .ToList();
                EmployeesListView.ItemsSource = Employees;
            }
        }

        private void AddEmployeeButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void EmployeesListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var Window = new TestWindow()
            {
                WindowStartupLocation = WindowStartupLocation.CenterOwner,
            };
            Window.ShowDialog();
        }
    }
}
