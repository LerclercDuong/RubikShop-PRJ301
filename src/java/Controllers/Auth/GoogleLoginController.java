/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Auth;

import Config.OauthConfig;
import DAO.UserDAO;
import Models.User;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author doant
 */
@WebServlet(name = "GoogleAuthController", urlPatterns = {"/GoogleLoginController"})
public class GoogleLoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.json.JSONException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String authURL = OauthConfig.AUTH_URL;
        String clientID = OauthConfig.CLIENT_ID;
        String secretKey = OauthConfig.SECRET_KEY;
        String redirect_uri = OauthConfig.REDIRECT_URI;

        String code = request.getParameter("code");
        try {
            if (code == null || code.isEmpty()) {
                // Handle the case when the code is missing or empty
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            } else {
//                System.out.println(code);

                // Prepare the JSON data to be sent in the POST request
//            String postData = "{\"code\":\"" + code + "\", \"client_id\":\"" + clientID + "\", \"client_secret\":\"" + secretKey + "\", \"redirect_uri\":\"" + redirect_uri + "\", \"grant_type\":\"authorization_code\"}";
                String postData = "code=" + URLEncoder.encode(code, "UTF-8")
                        + "&client_id=" + URLEncoder.encode(clientID, "UTF-8")
                        + "&client_secret=" + URLEncoder.encode(secretKey, "UTF-8")
                        + "&redirect_uri=" + URLEncoder.encode(redirect_uri, "UTF-8")
                        + "&grant_type=" + URLEncoder.encode("authorization_code", "UTF-8");

//                System.out.println(postData);
                // Make the POST request using the callApi method
                String accessResponse = callApi(authURL, postData);
                JSONObject jsonObject = new JSONObject(accessResponse);

// Get each property from the JSON object
                String accessToken = jsonObject.getString("access_token");
                int expiresIn = jsonObject.getInt("expires_in");
                String refreshToken = jsonObject.getString("refresh_token");
                String scope = jsonObject.getString("scope");
                String tokenType = jsonObject.getString("token_type");
                String idToken = jsonObject.getString("id_token");

// Now, you can use these variables as needed
                System.out.println("Access Token:" + accessToken);
                String userInfo = callApi2(accessToken);
                JSONObject userJsonObject = new JSONObject(userInfo);
                boolean emailVerified = userJsonObject.getBoolean("verified_email");
                if (emailVerified) {
                    //Get user info from google API
                    System.out.println(emailVerified);
                    String id = userJsonObject.getString("id");
                    String email = userJsonObject.getString("email");
                    String name = "";
                    String picture = "";
                    if (!userJsonObject.isNull("name")) {
                        name = userJsonObject.getString("name");
                    } else {
                        name = "Nguoi dung google";
                    }

                    if (!userJsonObject.isNull("picture")) {
                        picture = userJsonObject.getString("picture");
                    }

                    //create login user and add to session
                    User loginUser = new User(email, name, "US", "***");
                    loginUser.setGoogleID(id);
                    loginUser.setEmail(email);
                    loginUser.setUserImg(picture);
                    loginUser.setStatus("1");
                    //add user to session
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", loginUser);
                    //check google user is exists in DB
                    UserDAO userDAO = new UserDAO();
                    userDAO.checkGoogleUser(loginUser);
                    //route url
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            response.sendRedirect("http://localhost:8084/UserManagement/MainController");
        }

    }

    protected String callApi(String apiUrl, String postData) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // Set the request method to POST
        conn.setRequestMethod("POST");

        // Set the request headers
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        // Enable input and output streams for the request
        conn.setDoOutput(true);

        // Write the data to the request body
        try (OutputStream os = conn.getOutputStream()) {
            os.write(postData.getBytes("UTF-8"));
        }

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

    protected String callApi2(String accessToken) throws IOException {
        String apiUrl = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken;
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // Set the request method to POST
        conn.setRequestMethod("GET");

        // Enable input and output streams for the request
        conn.setDoOutput(true);

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
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
