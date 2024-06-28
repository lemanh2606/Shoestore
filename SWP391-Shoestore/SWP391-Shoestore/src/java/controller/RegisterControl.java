/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.LoginDAO;
import DBContext.UserDAO;
import entity.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {

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
        String action = request.getParameter("action");
        if ("Register".equals(action)) {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String re_pass = request.getParameter("repass");
            String email = request.getParameter("email");
            String captcha = request.getParameter("captcha1");
            HashMap<String, String> parameter = getParameter(request, response);
//            UserDAO us =  new UserDAO();
         
            if (!pass.equals(re_pass)) {
                request.setAttribute("error", "password and repeat password must be same!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            } else if (!isTrueCaptcha(request, response, parameter)) {

                request.setAttribute("error", "Captcha is not correct! Try again!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            } else {
                LoginDAO dao = new LoginDAO();
                Users u = dao.checkUserExist(user);
                if (u == null) {
                    //dc register
                    dao.register(user, pass, email);
                    request.getRequestDispatcher("signin.jsp").forward(request, response);

                } else //day ve login
                {    request.setAttribute("error", "username already exists !"); 
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            }
        }
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

    private boolean isTrueCaptcha(HttpServletRequest req, HttpServletResponse resp, HashMap<String, String> map) {
        try {
            String enteredCaptcha = map.get("captcha");
            String captcha = (String) req.getSession().getAttribute("captcha");
            if (enteredCaptcha.equalsIgnoreCase(captcha)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    private HashMap<String, String> getParameter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, String> map = new HashMap<>();
        String username = req.getParameter("user");
        String password = req.getParameter("pass");
        String remember = req.getParameter("remember");
        String captcha = req.getParameter("captcha1");
        map.put("username", username);
        map.put("password", password);
        map.put("remember", remember);
        map.put("captcha", captcha);
        return map;
    }
}
