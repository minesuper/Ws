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

namespace WsApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditWindow.xaml
    /// </summary>
    public partial class AddEditWindow : Window
    {
        private int EditEnabled { get; set; }
        private bool IsAdding { get; set; }
        private Model.Employees NewEmployee { get; set; }
        public AddEditWindow(Model.Employees Employee)
        {
            InitializeComponent();
            OnStart(Employee);
        }
        private void OnStart(Model.Employees Employee)
        {
            EditEnabled = 0;
            Update();
            //DepComboBox filling HELP
            RoleComboBox.ItemsSource = Model.WSDBEntities.GetContext().Roles.ToList();
            ManagerComboBox.ItemsSource = Model.WSDBEntities.GetContext().Employees.ToList(); //Department????
            SupportComboBox.ItemsSource = Model.WSDBEntities.GetContext().Employees.ToList(); //Department????
            if (Employee != null)
            {
                IsAdding = false;
                NewEmployee = Employee;
                DataContext = NewEmployee;
                FIOTextBox.Text = $"{Employee.Surname} {Employee.Name} {Employee.Patronym}";
                PhoneTextBox.Text = Employee.WorkPhone;
                BirthdateDatePicker.SelectedDate = Employee.Birthdate;
                RoleComboBox.SelectedItem = Employee.Roles;
                ManagerComboBox.SelectedItem = Model.WSDBEntities.GetContext().Employees.ToList()
                    .Where(d => d.Id == Employee.ManagerId).FirstOrDefault();
                SupportComboBox.SelectedItem = Model.WSDBEntities.GetContext().Employees.ToList()
                    .Where(d => d.Id == Employee.AssistantId).FirstOrDefault();
                WorkPhoneTextBox.Text = Employee.WorkPhone;
                MailTextBox.Text = Employee.WorkEmail;
                RoomTextBox.Text = Employee.Room;
                DescTextBox.Text = Employee.Info;
            }
            else
            {
                IsAdding = true;
                NewEmployee = new Model.Employees();
            }
        }
        private void Update()
        {
            if (EditEnabled == 1)
            {
                FIOTextBox.IsReadOnly = false;
                PhoneTextBox.IsReadOnly = false;
                BirthdateDatePicker.IsEnabled = true;
                DepComboBox.IsEnabled = true;
                RoleComboBox.IsEnabled = true;
                ManagerComboBox.IsEnabled = true;
                SupportComboBox.IsEnabled = true;
                WorkPhoneTextBox.IsReadOnly = false;
                MailTextBox.IsReadOnly = false;
                RoomTextBox.IsReadOnly = false;
                DescTextBox.IsReadOnly = false;
            }
            else
            {
                FIOTextBox.IsReadOnly = true;
                PhoneTextBox.IsReadOnly = true;
                BirthdateDatePicker.IsEnabled = false;
                DepComboBox.IsEnabled = false;
                RoleComboBox.IsEnabled = false;
                ManagerComboBox.IsEnabled = false;
                SupportComboBox.IsEnabled = false;
                WorkPhoneTextBox.IsReadOnly = true;
                MailTextBox.IsReadOnly = true;
                RoomTextBox.IsReadOnly = true;
                DescTextBox.IsReadOnly = true;
            }
        }

        private void EnableEditButton_Click(object sender, RoutedEventArgs e)
        {
            EditEnabled = Math.Abs(EditEnabled - 1);
            Update();
        }

        private void SaveChangesButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //Errors check
                NewEmployee.Surname = FIOTextBox.Text.Split(' ')[0];
                NewEmployee.Name = FIOTextBox.Text.Split(' ')[1];
                NewEmployee.Patronym = FIOTextBox.Text.Split(' ')[2];
                NewEmployee.WorkPhone = WorkPhoneTextBox.Text;
                NewEmployee.Birthdate = (DateTime)BirthdateDatePicker.SelectedDate;
                //FILL DEPARTMENTS ????
                NewEmployee.RoleId = (RoleComboBox.SelectedItem as Model.Roles).Id;
                NewEmployee.ManagerId = (ManagerComboBox.SelectedItem as Model.Employees).Id;
                NewEmployee.AssistantId = (SupportComboBox.SelectedItem as Model.Employees).Id;
                NewEmployee.WorkEmail = MailTextBox.Text;
                NewEmployee.Room = RoomTextBox.Text;
                NewEmployee.Info = DescTextBox.Text;
                NewEmployee.OrganisationId = 1;
                NewEmployee.DepartmentLevel1Id = 1;
                NewEmployee.DepartmentLevel2Id = 1;
                NewEmployee.DepartmentLevel3Id = 1;
                if (IsAdding)
                {
                    Model.WSDBEntities.GetContext().Employees.Add(NewEmployee);
                }
                Model.WSDBEntities.GetContext().SaveChanges();
                MessageBox.Show("Успешно сохранено", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                Close(); //Update listview???

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
