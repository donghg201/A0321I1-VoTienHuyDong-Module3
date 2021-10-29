package bean.serivce;

public class Room_Service extends Service {
    private String attach_service_bonus;

    public Room_Service() {

    }

    public Room_Service(String service_name, int service_area, double service_cost, int service_max_people, int rent_type_id, String free_service_bonus) {
        super(service_name, service_area, service_cost, service_max_people, rent_type_id);
        this.attach_service_bonus = free_service_bonus;
    }

    public Room_Service(String free_service_bonus) {
        this.attach_service_bonus = free_service_bonus;
    }

    public String getFree_service_bonus() {
        return attach_service_bonus;
    }

    public void setFree_service_bonus(String free_service_bonus) {
        this.attach_service_bonus = free_service_bonus;
    }
}
