/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.CheckOut;

import Utils.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author doant
 */
@WebServlet(name = "CODController", urlPatterns = {"/CODController"})
public class CODController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String completeURL = null;
        String codUrl = "http://localhost:8084/UserManagement/MainController?action=CreateOrder&paymentMethod=COD";
        try {
            //create random order id
            int leftLimit = 48; // letter '0'
            int rightLimit = 57; // letter '9'
            int targetStringLength = 10;
            Random random = new Random();
            //generate random number string
            String generatedString = random.ints(leftLimit, rightLimit + 1)
                    .limit(targetStringLength)
                    .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                    .toString();
            Date currentDate = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");

            // Format the date
            String formattedDate = dateFormat.format(currentDate);

            // Create the order ID
            String orderID = formattedDate + "_" + generatedString + "_COD";
            int status = 1;

            double totalCost
                    = Double.parseDouble(request.getParameter("totalCost"));
            String email
                    = request.getParameter("email");
            String method
                    = request.getParameter("method");
            if (totalCost == 0 || email.equals("") || method.equals("")) {
                throw new Exception("Lỗi");
            }
            completeURL = codUrl + "&apptransid=" + orderID + "&status=" + status + "&email=" + email +"&amount=" + totalCost;
            // Process the API response as needed
            // You can write the response to the servlet's output or perform other actions here
            // response.getWriter().write(apiResponse);
        } catch (Exception e) {
            // Handle exceptions (e.g., network errors)
            e.printStackTrace();
        } finally {
            response.sendRedirect(completeURL);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
