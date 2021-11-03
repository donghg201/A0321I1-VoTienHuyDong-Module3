package service.common;

import repositories.impl.CustomerRepositoryImpl;
import repositories.itf.CustomerRepository;

public class validator {
    static CustomerRepository customerRepository = new CustomerRepositoryImpl();

    public static String validateName(String name) {
        String message = null;
        String regex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
        if (!name.matches(regex)) {
            message = "Name format is wrong";
        }
        return message;
    }

    public static String validateUnique(String name) {
        String message = null;
        if (customerRepository.findByName(name) != null){
            message = "Name is duplicated";
        }
        return message;
    }
}
