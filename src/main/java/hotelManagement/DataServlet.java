package hotelManagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class DataServlet
 */
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Customer> allCustomersList = readCustomersFromJson(getServletContext());
		List<Room> rooms = readRoomsFromJson(getServletContext());
        request.setAttribute("rooms", rooms);
        request.setAttribute("customers", allCustomersList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookRoom.jsp");
	    dispatcher.forward(request, response);
	}

	private List<Room> readRoomsFromJson(ServletContext servletContext) {
        List<Room> rooms = new ArrayList<>();
        String fullPath = servletContext.getRealPath("/hms.json");
        try (BufferedReader reader = new BufferedReader(new FileReader(fullPath))) {
            JsonParser parser = new JsonParser();
            JsonObject jsonObject = parser.parse(reader).getAsJsonObject();
            
            JsonArray roomsArray = jsonObject.getAsJsonArray("rooms");
            for (int i = 0; i < roomsArray.size(); i++) {
                JsonObject roomObject = roomsArray.get(i).getAsJsonObject();
                String roomNumber = roomObject.get("roomNumber").getAsString();
                String type = roomObject.get("type").getAsString();
                String status = roomObject.get("status").getAsString();
                
                // Assume Room constructor accepts room number, type, and status
                Room room = new Room(roomNumber, type, status);
                rooms.add(room);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return rooms;
    }
	
	private List<Customer> readCustomersFromJson(ServletContext servletContext) {
	    List<Customer> customers = new ArrayList<>();
	    String fullPath = servletContext.getRealPath("/hms.json");
	    try (BufferedReader reader = new BufferedReader(new FileReader(fullPath))) {
	        JsonParser parser = new JsonParser();
	        JsonObject jsonObject = parser.parse(reader).getAsJsonObject();
	        
	        // Extract customers array from JSON object
	        JsonArray customersArray = jsonObject.getAsJsonArray("customers");
	        
	        // Parse each customer object in the array
	        for (int i = 0; i < customersArray.size(); i++) {
	            JsonObject customerObject = customersArray.get(i).getAsJsonObject();
	            String customerId = customerObject.get("customerId").getAsString();
	            String name = customerObject.get("name").getAsString();
	            
	            // Extract contact info object from customer object
	            JsonObject contactInfoObject = customerObject.getAsJsonObject("contactInfo");
	            String phone = contactInfoObject.get("phone").getAsString();
	            String email = contactInfoObject.get("email").getAsString();
	            
	            // Create Customer object and add to list
	            Customer customer = new Customer(customerId, name, new Customer.ContactInfo(phone, email));
	            customers.add(customer);
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return customers;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
