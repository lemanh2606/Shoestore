package controller.authenticator;

import DBContext.LoginDAO;
import DBContext.UserDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import entity.Constants;
import entity.UserGoogleDTO;
import entity.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         request.setCharacterEncoding("UTF-8");
//         response.setContentType("text/html; charset-UTF-8");
//         response.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDTO userGoogleDTO = getUserInfo(accessToken);

        UserDAO userDAO = new UserDAO();
        LoginDAO login = new LoginDAO();
        if (userDAO.checkExistEmail(userGoogleDTO.getEmail()) == false) {
            Users userDTO = new Users();
            String name = userGoogleDTO.getGiven_name();
            String email = userGoogleDTO.getEmail();
            String pass = userGoogleDTO.getEmail();
            login.register(name, pass, email);
            Users u1 = login.login(name, pass);
            request.getSession().setAttribute("user", u1);
            response.sendRedirect(request.getContextPath() + "/home");

        } else {
            Users user = userDAO.getUserByEmail(userGoogleDTO.getEmail());
            String username = user.getUserName();
            String pass = user.getPassword();
            Users u = login.login(username, pass);
            HttpSession session = request.getSession();
//            request.getSession().setAttribute("loginMessage", "success");
            session.setAttribute("user", u);
            request.setAttribute("mess", "login success");

            response.sendRedirect(request.getContextPath() + "/home");
//            setCookie(request, response);
//            login(request, response);
        }

    }

    public static String getToken(final String code) throws IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Constants.GOOGLE_CLIENT_ID)
                                .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
                                .build()
                ).execute().returnContent().toString();
        System.out.println("Response: " + response);
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    // send a request to google using access token to get user info
    // return a UserGoogleDto instance with user info
    public static UserGoogleDTO getUserInfo(final String accessToken) throws IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().toString();
        UserGoogleDTO user = new Gson().fromJson(response, UserGoogleDTO.class);
        return user;
    }
}
