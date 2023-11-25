/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Shop;

import DAO.ProductDAO;
import Models.Category;
import Models.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author doant
 */
@WebServlet(value = "/ProductController")
public class ProductController extends HttpServlet {

    private static final String ERROR = "shop.jsp";
    private static final String SUCCESS = "shop.jsp";

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
            ProductDAO productDAO = new ProductDAO();
            String category = request.getParameter("category");
            
            String search = request.getParameter("search");
            String page = request.getParameter("page");
            
            if (search == null) {
                search = "";
            }

            if (category == null) {
                category = "";
            }
            int categoryID = productDAO.getCategoryID(category);
 
            request.setAttribute("SEARCH", search);
            request.setAttribute("CATEGORY", category);

            ProductDAO dao = new ProductDAO();
            List<Product> listProduct = dao.getListProduct(search, categoryID);
            if (listProduct.size() > 0) {
                request.setAttribute("LIST_PRODUCT", listProduct);
            }
            //GET PRODUCT CATEGORY 
            List<Category> categoryList = productDAO.getListCategory();

            System.out.println("hello" + categoryList);
            request.setAttribute("CATEGORY", categoryList);
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
