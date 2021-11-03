package service.itf;

import bean.employee.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();
    void createNewEmployee(Employee employee);
    Employee selectEmployeeById(int employee_id);
    void editEmployee(Employee employee);
    void deleteEmployee(int employee_id);
    List<Employee> searchEmployeeByName(String employeeName);
}
