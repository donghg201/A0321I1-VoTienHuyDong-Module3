package repositories.impl;

import bean.employee.Employee;
import repositories.DBConnection;
import repositories.itf.EmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.employee;");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int employee_id = resultSet.getInt("employee_id");
                    String employee_name = resultSet.getString("employee_name");
                    String employee_birthday = resultSet.getString("employee_birthday");
                    String employee_id_card = resultSet.getString("employee_id_card");
                    double employee_salary = resultSet.getDouble("employee_salary");
                    String employee_phone = resultSet.getString("employee_phone");
                    String employee_email = resultSet.getString("employee_email");
                    String employee_address = resultSet.getString("employee_address");
                    int position_id = resultSet.getInt("position_id");
                    int education_degree_id = resultSet.getInt("education_degree_id");
                    int division_id = resultSet.getInt("division_id");
                    String username = resultSet.getString("username");
                    employeeList.add(new Employee(employee_id, employee_name, employee_birthday, employee_id_card,
                            employee_salary, employee_phone, employee_email, employee_address, position_id,
                            education_degree_id, division_id, username));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return employeeList;
    }

    @Override
    public void createNewEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("insert into casestudyFinalMd3.employee value(?,?,?,?,?,?,?,?,?,?,?,?)");
                preparedStatement.setInt(1, employee.getEmployee_id());
                preparedStatement.setString(2, employee.getEmployee_name());
                preparedStatement.setString(3, employee.getEmployee_birthday());
                preparedStatement.setString(4, employee.getEmployee_id_card());
                preparedStatement.setDouble(5, employee.getSalary());
                preparedStatement.setString(6, employee.getEmployee_phone());
                preparedStatement.setString(7, employee.getEmployee_email());
                preparedStatement.setString(8, employee.getEmployee_address());
                preparedStatement.setInt(9, employee.getPosition_id());
                preparedStatement.setInt(10, employee.getEducation_degree_id());
                preparedStatement.setInt(11, employee.getDivision_id());
                preparedStatement.setString(12, employee.getUsername());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public Employee selectEmployeeById(int employee_id) {
        Connection connection = DBConnection.getConnection();
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.employee where employee_id = ?");
                preparedStatement.setInt(1, employee_id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    employee = new Employee();
                    employee.setEmployee_id(resultSet.getInt("employee_id"));
                    employee.setEmployee_name(resultSet.getString("employee_name"));
                    employee.setEmployee_birthday(resultSet.getString("employee_birthday"));
                    employee.setEmployee_id_card(resultSet.getString("employee_id_card"));
                    employee.setSalary(resultSet.getDouble("employee_salary"));
                    employee.setEmployee_phone(resultSet.getString("employee_phone"));
                    employee.setEmployee_email(resultSet.getString("employee_email"));
                    employee.setEmployee_address(resultSet.getString("employee_address"));
                    employee.setPosition_id(resultSet.getInt("position_id"));
                    employee.setEducation_degree_id(resultSet.getInt("education_degree_id"));
                    employee.setDivision_id(resultSet.getInt("division_id"));
                    employee.setUsername(resultSet.getString("username"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("update casestudyFinalMd3.customer set " +
                        "employee_name = ?, + employee_birthday = ?, + employee_id_card = ?, employee_salary = ?, " +
                        "employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ? , " +
                        "education_degree_id = ?, division_id = ?, username = ? where employee_id = ?;");
                preparedStatement.setInt(1, employee.getEmployee_id());
                preparedStatement.setString(2, employee.getEmployee_name());
                preparedStatement.setString(3, employee.getEmployee_birthday());
                preparedStatement.setString(4, employee.getEmployee_id_card());
                preparedStatement.setDouble(5, employee.getSalary());
                preparedStatement.setString(6, employee.getEmployee_phone());
                preparedStatement.setString(7, employee.getEmployee_email());
                preparedStatement.setString(8, employee.getEmployee_address());
                preparedStatement.setInt(9, employee.getPosition_id());
                preparedStatement.setInt(10, employee.getEducation_degree_id());
                preparedStatement.setInt(11, employee.getDivision_id());
                preparedStatement.setString(12, employee.getUsername());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void deleteEmployee(int employee_id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("delete from casestudyFinalMd3.employee where employee_id = ?");
            preparedStatement.setInt(1, employee_id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Employee> searchEmployeeByName(String employeeName) {
        Connection connection = DBConnection.getConnection();
        List<Employee> employeeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.employee where employee_name like ?");
                preparedStatement.setString(1,employeeName);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int employee_id = resultSet.getInt("employee_id");
                    String employee_name = resultSet.getString("employee_name");
                    String employee_birthday = resultSet.getString("employee_birthday");
                    String employee_id_card = resultSet.getString("employee_id_card");
                    double employee_salary = resultSet.getDouble("employee_salary");
                    String employee_phone = resultSet.getString("employee_phone");
                    String employee_email = resultSet.getString("employee_email");
                    String employee_address = resultSet.getString("employee_address");
                    int position_id = resultSet.getInt("position_id");
                    int education_degree_id = resultSet.getInt("education_degree_id");
                    int division_id = resultSet.getInt("division_id");
                    String username = resultSet.getString("username");
                    employeeList.add(new Employee(employee_id, employee_name, employee_birthday, employee_id_card,
                            employee_salary, employee_phone, employee_email, employee_address, position_id,
                            education_degree_id, division_id, username));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return employeeList;
    }
}
