package tea.items;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.nocrala.tools.texttablefmt.BorderStyle;
import org.nocrala.tools.texttablefmt.CellStyle;
import org.nocrala.tools.texttablefmt.ShownBorders;
import org.nocrala.tools.texttablefmt.Table;
import tea.product.ProductDTO;

public class SendEmail {

    //send email to the user email
    public boolean sendEmail(String name, String email, String phone, String address, String created, String payment, Cart cart) {
        boolean test = false;

        String toEmail = email;
        String fromEmail = "nguyenhuy1323614@gmail.com";
        String password = "fietzjgakqrcslcy";

        try {
            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            //set email message details
            MimeMessage mess = new MimeMessage(session);
            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            //set email subject
            mess.setSubject("Product Bill");
            String text = "Hello " + name + " - " + phone + " - " + address + " - " + "Day: " + created + "\n"
                    + "Thank you for payment and buy product in Bubble Milk Tea. \n"
                    + "This is your bill: \n";
            double total = 0;
            CellStyle numberStyle = new CellStyle(CellStyle.HorizontalAlign.right);

            Table t = new Table(3, BorderStyle.DESIGN_FORMAL,
                    ShownBorders.SURROUND_HEADER_FOOTER_AND_COLUMNS);
            t.setColumnWidth(0, 20, 150);
            t.setColumnWidth(1, 20, 150);
            t.setColumnWidth(2, 20, 150);
            t.addCell("Product");
            t.addCell("Quantity", numberStyle);
            t.addCell("Price", numberStyle);

            for (ItemDTO item : cart.getCart().values()) {
                ProductDTO p = item.getProduct();
                double price = item.getPrice();
                double discount = item.getProduct().getProductDiscount();
                discount /= 100;
                price = price * item.getQuantity() * (1 - discount);
                total += price;
                t.addCell(p.getProductName());
                t.addCell(item.getQuantity() + "", numberStyle);
                t.addCell(price + "", numberStyle);
            }
            t.addCell("Total", numberStyle, 2);
            t.addCell(((int) total)+" VND", numberStyle);
            text += t.render();
            text += "\nThank you for buying our Product!!!";
            //set message text
            mess.setText(text, "UTF-8");
            //send the message
            Transport.send(mess);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public static void main(String[] args) {
        System.out.println("Xin chào các bạn");
    }
}
