package service.impl;

import bean.customer.Customer;
import repositories.CustomerRepository;
import repositories.impl.CustomerRepositoryImpl;
import service.CustomerService;

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
    public Customer selectCustomerById(int customerId) {
        return customerRepository.selectCustomerById(customerId);
    }

    @Override
    public void editCustomer(Customer customer) {
        customerRepository.editCustomer(customer);
    }

    @Override
    public void deleteCustomer(int customerId) {
        customerRepository.deleteCustomer(customerId);
    }

    @Override
    public List<Customer> searchCustomerByName(String customerName) {
        return customerRepository.searchCustomerByName(customerName);
    }
}
