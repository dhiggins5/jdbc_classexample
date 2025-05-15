import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Scanner;
import java.io.*;

public class Main {
    public static void main(String[] args) throws SQLException, IOException {
        String url = "jdbc:postgresql://localhost:5432/foodtruck";
        Properties prop = new Properties();
        prop.setProperty("user", "postgres");
        prop.setProperty("password", "School1725");

        try (Connection conn = DriverManager.getConnection(url, prop); Scanner scan = new Scanner(System.in)) {
            int choice;
            do {
                printMenu();
                choice = Integer.parseInt(scan.nextLine());
                switch (choice) {
                    case 1 -> viewInventory(conn);
                    case 2 -> topCustomers(conn);
                    case 3 -> revenueReport(conn);
                    case 4 -> exportInventoryToCSV(conn);
                    case 5 -> searchRecipesByWord(conn, scan);
                    case 6 -> ingredientUsage(conn);
                    case 7 -> recipeIngredientDetail(conn);
                    case 8 -> customerOrderSummary(conn);
                    case 9 -> System.out.println("Exiting...");
                    default -> System.out.println("Invalid choice.");
                }
            } while (choice != 9);
        }
    }

    private static void printMenu() {
        System.out.println("\n1. View Inventory");
        System.out.println("2. View Top 5 Customers by Points");
        System.out.println("3. Daily Revenue Report");
        System.out.println("4. Export Inventory to CSV");
        System.out.println("5. Search Recipes by Word (Regex)");
        System.out.println("6. Ingredient Usage Summary");
        System.out.println("7. Recipe + Ingredient Details");
        System.out.println("8. Customer Order Summary");
        System.out.println("9. Exit");
        System.out.print("Select an option: ");
    }

    // ------------------------
    // Section 2: Inventory View
    // ------------------------
    private static void viewInventory(Connection conn) throws SQLException {
        String sql = "SELECT name, type, num_instock, reorder FROM ingredients ORDER BY name";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            System.out.println("\nInventory:");
            while (rs.next()) {
                System.out.printf("%s | %s | %d in stock | Reorder: %s\n",
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getInt("num_instock"),
                        rs.getBoolean("reorder"));
            }
        }
    }

    // ------------------------
    // Section 3: Top Customers
    // ------------------------
    private static void topCustomers(Connection conn) throws SQLException {
        String sql = "SELECT first_name, last_name, reward_points FROM customer ORDER BY reward_points DESC LIMIT 5";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            System.out.println("\nTop 5 Customers:");
            while (rs.next()) {
                System.out.printf("%s %s - %d points\n",
                        rs.getString("first_name"), rs.getString("last_name"), rs.getInt("reward_points"));
            }
        }
    }

    // ------------------------
    // Section 4: Revenue Report
    // ------------------------
    private static void revenueReport(Connection conn) throws SQLException {
        String sql = "SELECT date, SUM(total) AS revenue FROM transactions GROUP BY date ORDER BY date DESC LIMIT 5";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            System.out.println("\nRevenue by Date:");
            while (rs.next()) {
                System.out.printf("%s - $%.2f\n", rs.getDate("date"), rs.getDouble("revenue"));
            }
        }
    }

    // ------------------------
    // Section 5: Export Inventory to CSV
    // ------------------------
    private static void exportInventoryToCSV(Connection conn) throws SQLException, IOException {
        String sql = "SELECT name, type, num_instock, reorder, last_updated FROM ingredients ORDER BY name";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery();
             BufferedWriter writer = new BufferedWriter(new FileWriter("inventory_export.csv"))) {

            writer.write("Name,Type,InStock,Reorder,LastUpdated\n");
            while (rs.next()) {
                writer.write(String.format("\"%s\",\"%s\",%d,%s,%s\n",
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getInt("num_instock"),
                        rs.getBoolean("reorder"),
                        rs.getTimestamp("last_updated")));
            }
            System.out.println("CSV export complete.");
        }
    }

    // ------------------------
    // Section 6: Regex Recipe Word Match
    // ------------------------
    private static void searchRecipesByWord(Connection conn, Scanner scan) throws SQLException {
        System.out.print("Enter word (regex): ");
        String input = scan.nextLine();

        String sql = "SELECT recipe_name, word FROM recipe_words_view WHERE word ~* ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "^" + input);  // Match words starting with user input
            try (ResultSet rs = stmt.executeQuery()) {
                System.out.println("\nMatching Recipes by Word:");
                while (rs.next()) {
                    String recipeName = rs.getString("recipe_name");
                    String word = rs.getString("word");
                    System.out.printf("Recipe: %-25s | Match: %s%n", recipeName, word);
                }
            }
        }
    }

    // ------------------------
    // Section 7: Ingredient Usage Summary
    // ------------------------
    private static void ingredientUsage(Connection conn) throws SQLException {
        String sql = "SELECT i.name, COUNT(r.recipe_id) AS usage_count FROM ingredients i JOIN recipe r ON i.ingredient_id = r.ingredient_id GROUP BY i.name ORDER BY usage_count DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            System.out.println("\nIngredient Usage:");
            while (rs.next()) {
                System.out.printf("%s used in %d recipes\n", rs.getString("name"), rs.getInt("usage_count"));
            }
        }
    }

    // ------------------------
    // Section 8: Recipe + Ingredient Join
    // ------------------------
    private static void recipeIngredientDetail(Connection conn) throws SQLException {
        String sql = "SELECT r.name AS recipe_name, i.name AS ingredient_name, i.type FROM recipe r JOIN ingredients i ON r.ingredient_id = i.ingredient_id ORDER BY r.name";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            System.out.println("\nRecipes and Their Ingredients:");
            while (rs.next()) {
                System.out.printf("%-25s | %-20s | %s\n", rs.getString("recipe_name"), rs.getString("ingredient_name"), rs.getString("type"));
            }
        }
    }

    // ------------------------
    // Section 9: Customer Order Summary
    // ------------------------
    private static void customerOrderSummary(Connection conn) throws SQLException {
        String sql = "SELECT c.first_name, c.last_name, r.name AS recipe, t.total, t.date FROM transactions t JOIN customer c ON t.customer_id = c.customer_id JOIN recipe r ON t.recipe_id = r.recipe_id ORDER BY t.date DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            System.out.println("\nCustomer Order Summary:");
            while (rs.next()) {
                System.out.printf("%s %s ordered %s for $%.2f on %s\n",
                        rs.getString("first_name"), rs.getString("last_name"), rs.getString("recipe"), rs.getDouble("total"), rs.getDate("date"));
            }
        }
    }
}

