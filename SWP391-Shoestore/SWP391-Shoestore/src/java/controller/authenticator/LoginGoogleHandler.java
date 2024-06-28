package controller.authenticator;

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
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDTO userGoogleDTO = getUserInfo(accessToken);

        UserDAO userDAO = new UserDAO();

        if (userDAO.checkExistEmail(userGoogleDTO.getEmail()) == false) {
            Users userDTO = new Users();
            userDTO.setUserName(userGoogleDTO.getName());
            userDTO.setEmail(userGoogleDTO.getEmail());
            userDTO.setRoleID(3);

            userDTO.setIsSigninWithGoogle(true);
            userDAO.updateUser(userDTO);
            request.getSession().setAttribute("username", userDTO.getUserName());
            request.getRequestDispatcher("Homepage.jsp").forward(request, response);

        } else {
            Users user = userDAO.getUserByEmail(userGoogleDTO.getEmail());
            String username = user.getUserName();
            boolean isLoginWithGoogle = user.getIsSigninWithGoogle();
            if (isLoginWithGoogle) {
                request.setAttribute("user", user);
                request.getSession().setAttribute("username", username);
                request.getRequestDispatcher("Homepage.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "This email is already used for signing up with Username!");
                request.getRequestDispatcher("signin.jsp").forward(request, response);
            }

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
