package hotelManagement;

public class Room {
    private String roomNumber;
    private String type;
    private String status;

    public Room(String roomNumber, String type, String status) {
        this.roomNumber = roomNumber;
        this.type = type;
        this.status = status;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
