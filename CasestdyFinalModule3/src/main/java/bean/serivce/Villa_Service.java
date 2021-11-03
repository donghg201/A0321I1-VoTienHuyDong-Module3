package bean.serivce;

public class Villa_Service extends Service {
    private String standard_room;
    private String description_other_convinience;
    private double pool_area;
    private int number_of_floors;

    public Villa_Service(String standard_room, String description_other_convinience, double pool_area, int number_of_floors) {
        this.standard_room = standard_room;
        this.description_other_convinience = description_other_convinience;
        this.pool_area = pool_area;
        this.number_of_floors = number_of_floors;
    }

    public Villa_Service(String service_name, int service_area, double service_cost, int service_max_people, int rent_type_id, int service_type_id, String standard_room, String description_other_convinience, double pool_area, int number_of_floors) {
        super(service_name, service_area, service_cost, service_max_people, rent_type_id, service_type_id);
        this.standard_room = standard_room;
        this.description_other_convinience = description_other_convinience;
        this.pool_area = pool_area;
        this.number_of_floors = number_of_floors;
    }

    public Villa_Service() {
    }

    public String getStandard_room() {
        return standard_room;
    }

    public void setStandard_room(String standard_room) {
        this.standard_room = standard_room;
    }

    public String getDescription_other_convinience() {
        return description_other_convinience;
    }

    public void setDescription_other_convinience(String description_other_convinience) {
        this.description_other_convinience = description_other_convinience;
    }

    public double getPool_area() {
        return pool_area;
    }

    public void setPool_area(double pool_area) {
        this.pool_area = pool_area;
    }

    public int getNumber_of_floors() {
        return number_of_floors;
    }

    public void setNumber_of_floors(int number_of_floors) {
        this.number_of_floors = number_of_floors;
    }
}
