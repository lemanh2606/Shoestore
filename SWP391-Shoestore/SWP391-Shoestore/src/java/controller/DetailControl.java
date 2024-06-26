/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.FeedbackDAO;
import DBContext.ProductDAO;
import DBContext.ProductDetailDAO;
import entity.Feedback;
import entity.ProductDetail;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {
    
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
        int id = Integer.parseInt(request.getParameter("pid"));
        ProductDetailDAO pDAO = new ProductDetailDAO();
        FeedbackDAO fDAO = new FeedbackDAO();
        ProductDetail productDetail = pDAO.getProductDetail(id);
        request.setAttribute("detail", productDetail);
        request.setAttribute("images", productDetail.getImages());
        request.setAttribute("feedbacks", fDAO.getFeedbacksByProductId(id));
        request.getRequestDispatcher("Detail.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String review = request.getParameter("review");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int productID = Integer.parseInt(request.getParameter("pid"));

        // Tạo đối tượng Feedback
        Feedback feedback = new Feedback();
        feedback.setProductID(productID);
        feedback.setStar(rating);
        feedback.setFeedbackDetail(review);

        // Lưu feedback vào database
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.addFeedback(feedback);

        // Redirect về trang chi tiết sản phẩm
        response.sendRedirect("detail?pid=" + productID);
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
