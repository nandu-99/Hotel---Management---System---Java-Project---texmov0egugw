package hotelManagement;

public class Customer {
    private String customerId;
    private String name;
    private ContactInfo contactInfo;

    public Customer(String customerId, String name, ContactInfo contactInfo) {
        this.customerId = customerId;
        this.name = name;
        this.contactInfo = contactInfo;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ContactInfo getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(ContactInfo contactInfo) {
        this.contactInfo = contactInfo;
    }

    public static class ContactInfo {
        private String phone;
        private String email;

        public ContactInfo(String phone, String email) {
            this.phone = phone;
            this.email = email;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }
    }
}
