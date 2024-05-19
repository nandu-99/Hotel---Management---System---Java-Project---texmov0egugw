package hotelManagement;

import java.time.LocalDate;

public class Booking {
    private String bookingId;
    private LocalDate startDate;
    private LocalDate endDate;
    private Customer customer;
    private Room room;
    private Service service;

    public Booking(String bookingId, LocalDate startDate, LocalDate endDate, Customer customer, Room room, Service service) {
        this.bookingId = bookingId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.customer = customer;
        this.room = room;
        this.service = service;
        if (room != null) {
            room.setStatus("Booked");
        }
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
