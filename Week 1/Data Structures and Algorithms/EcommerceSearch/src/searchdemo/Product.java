package searchdemo;

public class Product {
    int productId;
    String productName;
    String category;

    public Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    public void display() {
        System.out.println("Product ID: " + productId +
                           ", Product Name: " + productName +
                           ", Category: " + category);
    }
}