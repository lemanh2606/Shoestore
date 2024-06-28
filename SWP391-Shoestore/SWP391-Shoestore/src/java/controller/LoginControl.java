/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.LoginDAO;
import entity.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class LoginControl extends HttpServlet {

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
        //Lấy dữ liệu từ jsp

        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String captcha = request.getParameter("captcha");
        //Kết nối vs DB
         HashMap<String, String> parameter = getParameter(request, response);
        //-----------------verify captcha-----------------
        
        LoginDAO dao = new LoginDAO();
        Users u = dao.login(username, password);
         if (u == null) {
            //login fail -> Đẩy về trang Login.jsp (nhập lại)
            //Message thông báo Login sai: thay đổi giá trị của biến mess
            request.setAttribute("error", "Your username or password is incorrect, please re-enter!");
            //ko thì quay trở lại trang login.jsp
            //Yêu cầu người dùng Login lại
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        } else if (!isTrueCaptcha(request, response, parameter)) {
            request.setAttribute("error", "Captcha is not correct! Try again!");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
            return;
            
        } else   
        //Kiểm tra
        {
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            response.sendRedirect(request.getContextPath() + "/home");
        }
       
        
        
       
      

        request.getRequestDispatcher("signin.jsp").forward(request, response);
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