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
 * Servlet implementation class AllRoomServlet
 */
public class AllRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("I am here");
		List<Room> rooms = readRoomsFromJson(getServletContext());
        request.setAttribute("rooms", rooms);
        RequestDispatcher dispatcher = request.getRequestDispatcher("allRooms.jsp");
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
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
