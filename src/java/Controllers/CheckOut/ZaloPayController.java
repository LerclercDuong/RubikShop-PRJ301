/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.CheckOut;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Appid	554
//Key1	8NdU5pG5R2spGHGhyO99HN1OhD8IQJBn
//Key2	uUfsWgfLkRLzq6W2uNXTCxrfxs51auny

/**
 *
 * @author doant
 */
@WebServlet(name = "ZaloPayController", urlPatterns = {"/ZaloPayController"})
public class ZaloPayController extends HttpServlet {
    
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
        String apiUrl = "http://14.225.206.30:8080/payment/zalopay"; // Replace with your API URL

        try {
            double totalCost
                    = Double.parseDouble(request.getParameter("totalCost"));
            String email
                    = request.getParameter("email");
            String method
                    = request.getParameter("method");
            // Create a JSON payload or another format that your API expects
            String postData = "{\"totalCost\":" + totalCost + ", \"email\":\"" + email + "\", \"method\":\"" + method + "\", \"otherData\":\"value\"}";
            String apiResponse = callApi(apiUrl, postData);
            response.sendRedirect(apiResponse);
            // Process the API response as needed
            // You can write the response to the servlet's output or perform other actions here
            // response.getWriter().write(apiResponse);
        } catch (IOException e) {
            // Handle exceptions (e.g., network errors)
            e.printStackTrace();
        }
    }

    protected String callApi(String apiUrl, String postData) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // Set the request method to POST
        conn.setRequestMethod("POST");

        // Optional: Set request headers (e.g., authorization headers, content type)
        // Enable input and output streams for the request
        conn.setDoOutput(true);

        // Write the data to the request body
        conn.getOutputStream().write(postData.getBytes("UTF-8"));

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            return response.toString();
        } else {
            // Handle the error case
            return "API call failed with response code: " + responseCode;
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
