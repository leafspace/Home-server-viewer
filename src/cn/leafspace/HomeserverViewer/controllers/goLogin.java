package cn.leafspace.HomeserverViewer.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by 18852 on 2017/1/31.
 */
public class goLogin extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("username") == null | request.getParameter("username").trim().equals("") |
                request.getParameter("password") == null | request.getParameter("password").trim().equals("")){
            response.sendRedirect("login/index.html");
        }else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username.equals("leafspace") & password.equals("m967812")) {
                response.sendRedirect("show/showing.jsp?location=G:/AV");
            } else {
                response.sendRedirect("login/index.html");
            }
        }
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }
}
