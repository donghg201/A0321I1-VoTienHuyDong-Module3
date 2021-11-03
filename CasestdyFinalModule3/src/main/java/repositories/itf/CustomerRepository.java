package repositories.itf;

import bean.customer.Customer;
import bean.employee.Employee;

import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();
    void createNewCustomer(Customer customer);
    Customer selectCustomerById(int customer_id);
    void editCustomer(Customer customer);
    void deleteCustomer(int customer_id);
    List<Customer> searchCustomerByName(String customerSearch);
    Customer findByName(String customerName);
}
