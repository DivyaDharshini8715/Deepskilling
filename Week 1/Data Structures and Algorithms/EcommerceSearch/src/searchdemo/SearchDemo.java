package searchdemo;

public class SearchDemo {

    // Linear Search
    public static Product linearSearch(Product[] products, int targetId) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].productId == targetId) {
                return products[i];
            }
        }
        return null;
    }

    // Binary Search
    public static Product binarySearch(Product[] products, int targetId) {
        int low = 0;
        int high = products.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;

            if (products[mid].productId == targetId) {
                return products[mid];
            } else if (products[mid].productId < targetId) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return null;
    }

    public static void main(String[] args) {

        // Array for Linear Search
        Product[] productsLinear = {
            new Product(105, "Laptop", "Electronics"),
            new Product(101, "Shoes", "Fashion"),
            new Product(103, "Watch", "Accessories"),
            new Product(102, "Phone", "Electronics"),
            new Product(104, "Bag", "Fashion")
        };

        // Sorted Array for Binary Search (sorted by productId)
        Product[] productsBinary = {
            new Product(101, "Shoes", "Fashion"),
            new Product(102, "Phone", "Electronics"),
            new Product(103, "Watch", "Accessories"),
            new Product(104, "Bag", "Fashion"),
            new Product(105, "Laptop", "Electronics")
        };

        int searchId = 104;

        // Linear Search
        System.out.println("=== Linear Search ===");
        Product result1 = linearSearch(productsLinear, searchId);

        if (result1 != null) {
            result1.display();
        } else {
            System.out.println("Product not found");
        }

        // Binary Search
        System.out.println("\n=== Binary Search ===");
        Product result2 = binarySearch(productsBinary, searchId);

        if (result2 != null) {
            result2.display();
        } else {
            System.out.println("Product not found");
        }
    }
}