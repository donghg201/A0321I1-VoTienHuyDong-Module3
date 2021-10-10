package model;

public class Product {
    private int product_id;
    private String product_name;
    private int product_amount;
    private String product_description;

    public Product() {

    }

    public Product(int product_id, String product_name, int product_amount, String product_description) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_amount = product_amount;
        this.product_description = product_description;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getProduct_amount() {
        return product_amount;
    }

    public void setProduct_amount(int product_amount) {
        this.product_amount = product_amount;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }
}
