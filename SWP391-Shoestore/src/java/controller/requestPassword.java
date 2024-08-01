/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOTokenForget;
import DBContext.UserDAO;
import entity.TokenForgetPassword;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 *
 * @author HP
 */
@WebServlet(name = "requestPassword", urlPatterns = {"/forgot"})
public class requestPassword extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet requestPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet requestPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("forgot.jsp").forward(request, response);
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
        UserDAO daoUser = new UserDAO();
        String captcha = request.getParameter("captcha");
        //Kết nối vs DB
        HashMap<String, String> parameter = getParameter(request, response);
        String email = request.getParameter("email");
        //email co ton tai trong db
        Users user = daoUser.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("error", "email not exist");
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
            return;
        } else if (!isTrueCaptcha(request, response, parameter)) {
            request.setAttribute("error", "Captcha is not correct! Try again!");
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
            return;
        }
        resetService service = new resetService();
        String token = service.generateToken();
        int charactor = 8;
        String newPassword = daoUser.RandomPassword(charactor);
                // TO UPDATE PASSWORD
          daoUser.updatePassword(user.getUserID(), newPassword);
           String message = ("This is your new password: " + newPassword);
    

        TokenForgetPassword newTokenForget = new TokenForgetPassword( user.getUserID(), false, token, service.expireDateTime());

        //send link to this email
        DAOTokenForget daoToken = new DAOTokenForget();
        boolean isInsert = daoToken.insertTokenForget(newTokenForget);
        if (!isInsert) {
            request.setAttribute("error", "have error in server");
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
            return;
        }
        boolean isSend = service.sendEmail(email, message , user.getUserName());
        if (!isSend) {
            request.setAttribute("error", "can not send request");
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
            return;
        }
        request.setAttribute("mess", "send request success");
        request.getRequestDispatcher("forgot.jsp").forward(request, response);
//        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
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
        String captcha = req.getParameter("captcha");
        map.put("username", username);
        map.put("password", password);
        map.put("remember", remember);
        map.put("captcha", captcha);
        return map;
    }
}
