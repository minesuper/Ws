   M S B A M L   `   `   `  ����@  <WsApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:WsApp.PagesWsApp.Pages  5          WsApp.Pages.ListPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:WsApp.Pages     5        N� Title$  ListPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $��1* �6   6,   �� 5      $��1* �6   6,   .+�5   
   � $��0��6   $��10q�6   .+�5      �� 
�������.+�5      �� -   5        $��ListBoxRow1��5       �� DisplayMemberPath$
 Name��6]   �� 5      -   5        $��ListBoxRow2��5      $
 Name��6]   �� 5      -   5        $��ListBoxRow3��5      $
 Name��6]   �� 5      -   5        $��ListBoxRow4��5      $
 Name��6]   5      5      � 5   
   $��2��6   $��10q�6   
������� � RowDefinitions 5      �� 5      $��7* �6    6.   �� 5      $��1* �6    $	��120��6,   6>   .+�5      �� -   5         ��Name$ EmployeesListView��5      
�������
���������5       �� 5!      .R�5"      � ���#78B24B$	��540��64   .+�5#      ��  �� Orientation$ Vertical=�6)   $��10 20q�6@   .+�5$   "   �� $
��Wrap=�6,   �� 5%   &   $�HELPHELPHELP��6*    �� 5&   &   $�-��6*    �� 5'   &   �6*   �� *
Roles.Name+5(   #   �� 5)   "   �� 5*   &   �6*   �� *	Surname+ �� 5+   &   �6*   �� *Name+ �� 5,   &   �6*   �� *
Patronym+5-   #   �� 5.   "   �� 5/   &   �6*   �� *	WorkPhone+ �� 50   &   �6*   �� *	WorkEmail+51   #   �� 52   "   ��6,   �� *Room+6D   53      54      55      57      �� 58      -   5         ��Name$ AddEmployeeButton��58      $��1��59      $��10q�6"   $��60��6.   $��60��69   ���#78B24B$��+��5:   *   $��32(�66   $��Right=�5;      $��Center=�61   6N   5<      5=      5>      