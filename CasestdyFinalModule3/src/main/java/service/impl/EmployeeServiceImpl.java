package service.impl;

import bean.employee.Employee;
import repositories.impl.EmployeeRepositoryImpl;
import repositories.itf.EmployeeRepository;
import service.itf.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public void createNewEmployee(Employee employee) {
        employeeRepository.createNewEmployee(employee);
    }

    @Override
    public Employee selectEmployeeById(int employee_id) {
        return employeeRepository.selectEmployeeById(employee_id);
    }

    @Override
    public void editEmployee(Employee employee) {
        employeeRepository.editEmployee(employee);
    }

    @Override
    public void deleteEmployee(int employee_id) {
        employeeRepository.deleteEmployee(employee_id);
    }

    @Override
    public List<Employee> searchEmployeeByName(String employeeName) {
        return employeeRepository.searchEmployeeByName(employeeName);
    }
}
