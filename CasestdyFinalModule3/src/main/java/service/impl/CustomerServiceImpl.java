package service.impl;

import bean.customer.Customer;
import repositories.itf.CustomerRepository;
import repositories.impl.CustomerRepositoryImpl;
import service.itf.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void createNewCustomer(Customer customer) {
        customerRepository.createNewCustomer(customer);
    }

    @Override
    public Customer selectCustomerById(int customer_id) {
        return customerRepository.selectCustomerById(customer_id);
    }

    @Override
    public void editCustomer(Customer customer) {
        customerRepository.editCustomer(customer);
    }

    @Override
    public void deleteCustomer(int customer_id) {
        customerRepository.deleteCustomer(customer_id);
    }

    @Override
    public List<Customer> searchCustomerByName(String customerSearch) {
        return customerRepository.searchCustomerByName(customerSearch);
    }
}
