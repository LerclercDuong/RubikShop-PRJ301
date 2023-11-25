/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Order;

import DAO.OrderDAO;
import Models.Cart;
import Models.User;
import Utils.SendMail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author doant
 */
@WebServlet(name = "CreateOrderController", urlPatterns = {"/CreateOrderController"})
public class CreateOrderController extends HttpServlet {

    private static final String ERROR = "shop.jsp";
    private static final String SUCCESS = "MainController?action=ViewOrder";

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
        String url = ERROR;
        //get parameter from method check out
        String orderID = request.getParameter("apptransid");
        String amount = request.getParameter("amount");
        String email = request.getParameter("email");
        String status = request.getParameter("status");
        String paymentMethod = request.getParameter("paymentMethod");
        try {

            if (Integer.parseInt(status) == 1) {
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("LOGIN_USER");
                Cart cart = (Cart) session.getAttribute("CART");
                //save order 
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.insertOrder(orderID, user.getUserID(), cart, paymentMethod);
                url = SUCCESS;
                
            }
        } catch (Exception e) {
        } finally {       
            HttpSession session = request.getSession();
            session.removeAttribute("CART");           
            response.sendRedirect("http://localhost:8084/UserManagement/MainController?action=ViewOrder"); 
            SendMail.sendTo(email, orderID, amount);
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
