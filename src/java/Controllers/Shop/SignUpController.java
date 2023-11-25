/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Shop;

import DAO.UserDAO;
import Models.User;
import Models.UserError;
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
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    private final static String ERROR = "shop.jsp";
    private final static String SUCCESS = "MainController?action=HomePage";

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
        UserError userError = new UserError();
        boolean checkValidation = true;
        UserDAO dao = new UserDAO();
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String status = request.getParameter("status");
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                checkValidation = false;
                userError.setUserIDError("Duplicate userID");
            }
            if (fullName.length() > 20 || fullName.length() < 5) {
                checkValidation = false;
                userError.setFullNameError("fullName must be in 5 - 20");
            }
            if (!password.equals(confirm)) {
                checkValidation = false;
                userError.setConfirmError("Password confirm not match");

            }
            if (checkValidation) {
                User user = new User(userID, fullName, roleID, password);
                user.setEmail(email);
                user.setAddress(address);
                user.setPhone(phone);
                user.setStatus(status);
                System.out.println(user.toString());
                boolean checkInsert = dao.insert(user);
                if (checkInsert == true) {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", user);
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Loi khi them user");
                }
            } else {
                System.out.println("LOI TUM LUM");
                request.setAttribute("INSERT_ERROR", userError);
            }
        } catch (Exception err) {

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
