package bean.employee;



public class Employee {
    private String employee_name;
    private String employee_birthday;
    private int employee_id_card;
    private int employee_phone;
    private String employee_mail;
    private int education_degree_id;
    private int position_id;
    private int employee_salary;

    public Employee(){

    }

    public Employee(String employee_name, String employee_birthday, int employee_id_card, int employee_phone, String employee_mail, int education_degree_id, int position_id, int employee_salary) {
        this.employee_name = employee_name;
        this.employee_birthday = employee_birthday;
        this.employee_id_card = employee_id_card;
        this.employee_phone = employee_phone;
        this.employee_mail = employee_mail;
        this.education_degree_id = education_degree_id;
        this.position_id = position_id;
        this.employee_salary = employee_salary;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getEmployee_birthday() {
        return employee_birthday;
    }

    public void setEmployee_birthday(String employee_birthday) {
        this.employee_birthday = employee_birthday;
    }

    public int getEmployee_id_card() {
        return employee_id_card;
    }

    public void setEmployee_id_card(int employee_id_card) {
        this.employee_id_card = employee_id_card;
    }

    public int getEmployee_phone() {
        return employee_phone;
    }

    public void setEmployee_phone(int employee_phone) {
        this.employee_phone = employee_phone;
    }

    public String getEmployee_mail() {
        return employee_mail;
    }

    public void setEmployee_mail(String employee_mail) {
        this.employee_mail = employee_mail;
    }

    public int getEducation_degree_id() {
        return education_degree_id;
    }

    public void setEducation_degree_id(int education_degree_id) {
        this.education_degree_id = education_degree_id;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public int getEmployee_salary() {
        return employee_salary;
    }

    public void setEmployee_salary(int employee_salary) {
        this.employee_salary = employee_salary;
    }
}
