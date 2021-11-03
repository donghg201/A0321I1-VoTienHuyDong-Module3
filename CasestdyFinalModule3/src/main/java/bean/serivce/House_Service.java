package bean.serivce;

public class House_Service extends Service {
    private String standard_room;
    private String description_other_convinience;
    private int number_of_floors;

    public House_Service(String standard_room, String description_other_convinience, int number_of_floors) {
        this.standard_room = standard_room;
        this.description_other_convinience = description_other_convinience;
        this.number_of_floors = number_of_floors;
    }

    public House_Service(String service_name, int service_area, double service_cost, int service_max_people, int rent_type_id, int service_type_id, String standard_room, String description_other_convinience, int number_of_floors) {
        super(service_name, service_area, service_cost, service_max_people, rent_type_id, service_type_id);
        this.standard_room = standard_room;
        this.description_other_convinience = description_other_convinience;
        this.number_of_floors = number_of_floors;
    }

    public House_Service() {
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

    public int getNumber_of_floors() {
        return number_of_floors;
    }

    public void setNumber_of_floors(int number_of_floors) {
        this.number_of_floors = number_of_floors;
    }
}
