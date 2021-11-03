package repositories.impl;

import bean.customer.Customer;
import repositories.itf.CustomerRepository;
import repositories.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.customer;");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int customer_id = resultSet.getInt("customer_id");
                    int customer_type_id = resultSet.getInt("customer_type_id");
                    String customer_name = resultSet.getString("customer_name");
                    String customer_birthday = resultSet.getString("customer_birthday");
                    int customer_gender = resultSet.getInt("customer_gender");
                    String customer_id_card = resultSet.getString("customer_id_card");
                    String customer_phone = resultSet.getString("customer_phone");
                    String customer_email = resultSet.getString("customer_email");
                    String customer_address = resultSet.getString("customer_address");
                    customerList.add(new Customer(customer_id, customer_type_id, customer_name, customer_birthday,
                            customer_gender, customer_id_card, customer_phone, customer_email, customer_address));
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
        return customerList;
    }


    @Override
    public void createNewCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("insert into casestudyFinalMd3.customer value(?,?,?,?,?,?,?,?,?)");
                preparedStatement.setInt(1, customer.getCustomer_id());
                preparedStatement.setInt(2, customer.getCustomer_type_id());
                preparedStatement.setString(3, customer.getCustomer_name());
                preparedStatement.setString(4, customer.getCustomer_birthday());
                preparedStatement.setInt(5, customer.getCustomer_gender());
                preparedStatement.setString(6, customer.getCustomer_id_card());
                preparedStatement.setString(7, customer.getCustomer_phone());
                preparedStatement.setString(8, customer.getCustomer_email());
                preparedStatement.setString(9, customer.getCustomer_address());
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
    public Customer selectCustomerById(int customer_id) {
        Connection connection = DBConnection.getConnection();
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.customer where customer_id = ?");
                preparedStatement.setInt(1, customer_id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    customer = new Customer();
                    customer.setCustomer_id(resultSet.getInt("customer_id"));
                    customer.setCustomer_type_id(resultSet.getInt("customer_type_id"));
                    customer.setCustomer_name(resultSet.getString("customer_name"));
                    customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
                    customer.setCustomer_gender(resultSet.getInt("customer_gender"));
                    customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                    customer.setCustomer_phone(resultSet.getString("customer_phone"));
                    customer.setCustomer_email(resultSet.getString("customer_email"));
                    customer.setCustomer_address(resultSet.getString("customer_address"));
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
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("update casestudyFinalMd3.customer set customer_type_id = ?, customer_name = ?," +
                        "customer_birthday = ?, customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?;");
                preparedStatement.setInt(1, customer.getCustomer_type_id());
                preparedStatement.setString(2, customer.getCustomer_name());
                preparedStatement.setString(3, customer.getCustomer_birthday());
                preparedStatement.setInt(4, customer.getCustomer_gender());
                preparedStatement.setString(5, customer.getCustomer_id_card());
                preparedStatement.setString(6, customer.getCustomer_phone());
                preparedStatement.setString(7, customer.getCustomer_email());
                preparedStatement.setString(8, customer.getCustomer_address());
                preparedStatement.setInt(9, customer.getCustomer_id());
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
    public void deleteCustomer(int customer_id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("delete from casestudyFinalMd3.customer where customer_id = ?");
            preparedStatement.setInt(1, customer_id);
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
    public List<Customer> searchCustomerByName(String customerSearch) {
        Connection connection = DBConnection.getConnection();
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.customer where customer_name like ?");
                preparedStatement.setString(1,"%"+customerSearch+"%");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int customer_id = resultSet.getInt("customer_id");
                    int customer_type_id = resultSet.getInt("customer_type_id");
                    String customer_name = resultSet.getString("customer_name");
                    String customer_birthday = resultSet.getString("customer_birthday");
                    int customer_gender = resultSet.getInt("customer_gender");
                    String customer_id_card = resultSet.getString("customer_id_card");
                    String customer_phone = resultSet.getString("customer_phone");
                    String customer_email = resultSet.getString("customer_email");
                    String customer_address = resultSet.getString("customer_address");
                    customerList.add(new Customer(customer_id, customer_type_id, customer_name, customer_birthday,
                            customer_gender, customer_id_card, customer_phone, customer_email, customer_address));
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
        return customerList;
    }

    @Override
    public Customer findByName(String customerName) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Customer customer = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from casestudyFinalMd3.customer where customer_name = ?;");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int customer_id = resultSet.getInt("customer_id");
                    int customer_type_id = resultSet.getInt("customer_type_id");
                    String customer_name = resultSet.getString("customer_name");
                    String customer_birthday = resultSet.getString("customer_birthday");
                    int customer_gender = resultSet.getInt("customer_gender");
                    String customer_id_card = resultSet.getString("customer_id_card");
                    String customer_phone = resultSet.getString("customer_phone");
                    String customer_email = resultSet.getString("customer_email");
                    String customer_address = resultSet.getString("customer_address");
                    customer = new Customer(customer_id, customer_type_id, customer_name, customer_birthday,
                            customer_gender, customer_id_card, customer_phone, customer_email, customer_address);
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
        return customer;
    }
}
