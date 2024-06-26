/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.OrderDAO;
import DBContext.ShipDAO;
import DBContext.UserDAO;
import entity.Order;
import entity.Ship;
import entity.ShipInfo;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DeliveryDetail extends HttpServlet {

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
            out.println("<title>Servlet DeliveryDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeliveryDetail at " + request.getContextPath() + "</h1>");
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
        OrderDAO odao = new OrderDAO();
        UserDAO udao = new UserDAO();
        ShipDAO sdao = new ShipDAO();
        HttpSession ss = request.getSession();

        try {

            Users u = (Users) ss.getAttribute("user");
            String role = udao.getRoleByUserName(u.getUserName());
            if (role.equalsIgnoreCase("shipper")) {
                int oid = Integer.parseInt(request.getParameter("oid"));
                ArrayList<Order> list = odao.getOrderPackaging();
                boolean checkExist = odao.CheckOrderExist(oid, list);
                if (checkExist) {
                    ShipInfo ship = sdao.getShipInfoByOdID(oid);
                    Order order = odao.getOrderByOrderID(oid);
                    ArrayList<Ship> listShip = sdao.getShip();
                    request.setAttribute("ship", ship);
                    request.setAttribute("order", order);
                    request.setAttribute("listShip", listShip);

                    request.getRequestDispatcher("DeliveryDetail.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("home");
            }
        } catch (Exception e) {

        }
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
