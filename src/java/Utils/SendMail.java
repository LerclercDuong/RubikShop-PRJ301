/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Config.MailConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author doant
 */
public class SendMail {

    public static void sendTo(String receiver, String orderID, String amount) {
        final String user = MailConfig.APP_EMAIL;
        final String pass = MailConfig.APP_PASSWORD;
        String to = receiver;
        String subject = "Don hang " + orderID + " tai RubikShop";
        String message = "Order thành công";

        Properties props = new Properties();
        props.put("mail.smtp.host", MailConfig.HOST_NAME);
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        };
        Session session = Session.getInstance(props, auth);
        try {
            Message msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            // sender
            msg.setFrom(new InternetAddress(user));
            // receiver
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            // tiêu đề
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(message);
            MimeMultipart multipart = new MimeMultipart();

            // Create a plain text part
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText("OrderID: " + orderID + " Tong tien: " + amount + " VND");
            multipart.addBodyPart(textPart);

            // Create an HTML part
            MimeBodyPart htmlPart = new MimeBodyPart();
            htmlPart.setContent("<html><body>Mua hang thanh cong</body></html>", "text/html");
            multipart.addBodyPart(htmlPart);

            // Set the content of the message
            msg.setContent(multipart);
            // gui
            Transport.send(msg);
            System.out.println("Message sent successfully");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
