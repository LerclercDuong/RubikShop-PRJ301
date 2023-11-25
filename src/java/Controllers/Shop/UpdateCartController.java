/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Shop;

import DAO.ProductDAO;
import Models.Cart;
import Models.CartDetail;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(value = "/UpdateCartController")
public class UpdateCartController extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String SUCCESS = "MainController?action=ViewCart";

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
        try {
            //get product by id
            String productID = request.getParameter("productID");
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductByID(productID);
            //get quantity 
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                CartDetail newCartDetail = new CartDetail(product, quantity);
                if (cart.getCart().containsKey(Integer.parseInt(productID))) {
                    boolean checkEdit = cart.edit(Integer.parseInt(productID), newCartDetail);
                    if (checkEdit) {
                        url = SUCCESS;
                        session.setAttribute("CART", cart);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at EditController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
