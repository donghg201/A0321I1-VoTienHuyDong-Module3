package controller;

import bean.customer.Customer;
import service.CustomerService;
import service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormAddCustomer(request, response);
                break;
            case "update":
                showFormUpdateCustomer(request, response);
                break;
            case "delete":
//                deleteCustomer(request,response);
                break;
            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void showFormAddCustomer(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/customer/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        Customer customer = customerService.selectCustomerById(customer_id);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("/customer/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewCustomer(request, response);
                break;
            case "update":
                updateCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            default:

                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        customerService.deleteCustomer(customer_id);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        int customer_gender = Integer.parseInt(request.getParameter("customer_gender"));
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = new Customer(customer_id, customer_type_id, customer_name,
                customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address);
        customer.setCustomer_id(customer_id);
        customer.setCustomer_type_id(customer_type_id);
        customer.setCustomer_name(customer_name);
        customer.setCustomer_birthday(customer_birthday);
        customer.setCustomer_gender(customer_gender);
        customer.setCustomer_id_card(customer_id_card);
        customer.setCustomer_phone(customer_phone);
        customer.setCustomer_email(customer_email);
        customer.setCustomer_address(customer_address);
        customerService.editCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        int customer_gender = Integer.parseInt(request.getParameter("customer_gender"));
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = new Customer(customer_id, customer_type_id, customer_name,
                customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address);
        customerService.createNewCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}