package hotelManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
/**
 * Servlet implementation class CustomerServlet
 */
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String customerId = request.getParameter("customerId");
	    String allCustomers = request.getParameter("allCustomers");

	    
	    
	    if (allCustomers != null && allCustomers.equals("true")) {
	        // If "allCustomers" parameter is present and set to true, retrieve all customers
	        List<Customer> allCustomersList = readCustomersFromJson(getServletContext());
	        request.setAttribute("allCustomers", allCustomersList);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("allCustomers.jsp");
		    dispatcher.forward(request, response);
	    } else {
	        // Otherwise, retrieve customer information by ID
	        // Your existing logic to retrieve customer by ID goes here
	    	// Read JSON file to retrieve customer information
		    List<Customer> customers = readCustomersFromJson(getServletContext());

		    // Search for the customer with the given ID
		    Customer foundCustomer = null;
		    for (Customer customer : customers) {
		        if (customer.getCustomerId().equals(customerId)) {
		            foundCustomer = customer;
		            break;
		        }
		    }
		    
		    // Set customer data as an attribute in the request
		    request.setAttribute("customer", foundCustomer);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
		    dispatcher.forward(request, response);
	    }
	    
	   
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

}
