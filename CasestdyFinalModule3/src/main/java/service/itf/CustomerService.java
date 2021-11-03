package service.itf;

import bean.customer.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    void createNewCustomer(Customer customer);
    Customer selectCustomerById(int customer_id);
    void editCustomer(Customer customer);
    void deleteCustomer(int customer_id);
    List<Customer> searchCustomerByName(String customerSearch);
}
