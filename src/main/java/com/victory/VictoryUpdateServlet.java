package com.victory;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateKoboServlet
 */
@WebServlet("/VictoryUpdateServlet")
public class VictoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String vlid = request.getParameter("vlid");
		String cname = request.getParameter("cname");
		String program = request.getParameter("program");
		String city = request.getParameter("city");
		String location = request.getParameter("location");
		String date = request.getParameter("date");
		String budget = request.getParameter("budget");
		
		boolean isTrue;
		
		isTrue = VictoryDBUtil.victoryUpdate(vlid,cname,program,city,location,date,budget);
		
		if(isTrue == true) {
			
		
			
			RequestDispatcher dis = request.getRequestDispatcher("VictoryViewAll.jsp");
			dis.forward(request, response);
		}
		else {
			List<Victory> koboDetails = VictoryDBUtil.koboDetails(vlid);
			request.setAttribute("koboDetails", koboDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("VictoryViewAll.jsp");
			dis.forward(request, response);
		}
	}

}
