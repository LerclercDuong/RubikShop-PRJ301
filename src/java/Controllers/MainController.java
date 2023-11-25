/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author doant
 */
@WebServlet(value = "")
public class MainController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String US = "US";
    private static final String AD = "AD";
    private static final String US_PAGE = "shop.jsp";
    private static final String AD_PAGE = "admin.jsp";

    private static final String WELCOME_PAGE = "MainController?action=HomePage";
    //USER MANAGEMENT
    private static final String ADMIN_LOGIN = "AdminLogin";
    private static final String USER_LOGIN = "UserLogin";
    private static final String ADMIN_LOGIN_CONTROLLER = "AdminLoginController";
    private static final String USER_LOGIN_CONTROLLER = "UserLoginController";
    private static final String LOGOUT = "Logout";

    private static final String ADMIN_PAGE = "Admin";
    private static final String HOME_PAGE = "HomePage";
    private static final String GOOGLE_LOGIN = "GoogleLogin";
    private static final String GOOGLE_LOGIN_CONTROLLER = "GoogleLoginController";

    private static final String SIGN_UP = "SignUp";
    private static final String USER_LOGOUT = "UserLogout";
    private static final String SIGN_UP_CONTROLLER = "SignUpController";
    private static final String ADMIN_CONTROLLER = "AdminMainController";
    private static final String HOME_PAGE_CONTROLLER = "HomePageController";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String USER_LOGOUT_CONTROLLER = "UserLogoutController";
    //USER ROUTES
    private static final String SEARCH_USER = "SearchUser";
    private static final String INSERT_USER = "InsertUser";
    private static final String DELETE_USER = "DeleteUser";
    private static final String UPDATE_USER = "UpdateUser";
    //USER CONTROLLER
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String INSERT_USER_CONTROLLER = "InsertUserController";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";

    //CART ROUTES
    private static final String VIEW_CART = "ViewCart";
    private static final String INSERT_CART = "AddCart";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String DELETE_CART = "DeleteCart";

    //CART CONTROLLER
    private static final String VIEW_CART_CONTROLLER = "ViewCartController";
    private static final String INSERT_CART_CONTROLLER = "InsertCartController";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String DELETE_CART_CONTROLLER = "DeleteCartController";

    //PRODUCT ROUTES
    private static final String PRODUCT = "Product";
    private static final String PRODUCT_CONTROLLER = "ProductController";

    //ORDER ROUTES
    private static final String CREATE_ORDER = "CreateOrder";
    private static final String CREATE_ORDER_CONTROLLER = "CreateOrderController";

    private static final String VIEW_ORDER = "ViewOrder";
    private static final String VIEW_ORDER_CONTROLLER = "ViewOrderController";

    private static final String CHECK_OUT = "CheckOut";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutController";

    private static final String SEND_MAIL = "SendMail";
    private static final String SEND_MAIL_CONTROLLER = "SendMailController";
    
    private static final String COUNT = "Count";
    private static final String COUNT_CONTROLLER = "CountController";

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
        String action = request.getParameter("action");

        String url = WELCOME_PAGE;

        try {
            if (action == null) {
                url = WELCOME_PAGE;
            } else if (ADMIN_PAGE.equals(action)) {
                url = ADMIN_CONTROLLER;
            } else if (HOME_PAGE.equals(action)) {
                url = HOME_PAGE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (USER_LOGOUT.equals(action)) {
                url = USER_LOGOUT_CONTROLLER;
            } else if (SIGN_UP.equals(action)) {
                url = SIGN_UP_CONTROLLER;

                //LOGIN ACTION
            } else if (ADMIN_LOGIN.equals(action)) {
                url = ADMIN_LOGIN_CONTROLLER;
            } else if (USER_LOGIN.equals(action)) {
                url = USER_LOGIN_CONTROLLER;
            } else if (GOOGLE_LOGIN.equals(action)) {
                url = GOOGLE_LOGIN_CONTROLLER;

                //USER MANAGEMENT ACTION
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            } else if (INSERT_USER.equals(action)) {
                url = INSERT_USER_CONTROLLER;
            } else if (UPDATE_USER.equals(action)) {
                url = UPDATE_USER_CONTROLLER;
            } else if (DELETE_USER.equals(action)) {
                url = DELETE_USER_CONTROLLER;

                //CART ACTION
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_CONTROLLER;
            } else if (INSERT_CART.equals(action)) {
                url = INSERT_CART_CONTROLLER;
            } else if (UPDATE_CART.equals(action)) {
                url = UPDATE_CART_CONTROLLER;
            } else if (DELETE_CART.equals(action)) {
                url = DELETE_CART_CONTROLLER;

                //PRODUCT ACTION
            } else if (PRODUCT.equals(action)) {
                url = PRODUCT_CONTROLLER;
                
                //CHECKOUT ACTION
            } else if (CHECK_OUT.equals(action)) {
                url = CHECK_OUT_CONTROLLER;

                //ORDER CREATE ACTION
            } else if (CREATE_ORDER.equals(action)) {
                url = CREATE_ORDER_CONTROLLER;
            } else if (VIEW_ORDER.equals(action)) {
                url = VIEW_ORDER_CONTROLLER;
            } else if (SEND_MAIL.equals(action)) {
                url = SEND_MAIL_CONTROLLER;
            }
            else if (COUNT.equals(action)) {
                url = COUNT_CONTROLLER;

                //ORDER CREATE ACTION
            }

        } catch (Exception e) {
            log("Error at MainController " + e.toString());
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
