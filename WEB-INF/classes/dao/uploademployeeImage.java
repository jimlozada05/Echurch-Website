package dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connect.*;
import table.*;
import dao.*;

@WebServlet("/uploademployeeImage")
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploademployeeImage extends HttpServlet {
	
	PrintWriter out;   
   
    public uploademployeeImage() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		employees ee=new employees();
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("ee_image");
        if (part != null) {
            try {
                Connection con = dbconnect.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into employee(position,ee_image,login_id,f_name,m_name,l_name,bdate,contact,age,gender,maritalstatus,email,cityaddress,provinceaddress) values(?,?,(SELECT id FROM logined),?,?,?,?,?,?,?,?,?,?,?)");
                String position=request.getParameter("position");
                String f_name=request.getParameter("f_name");
            	String m_name=request.getParameter("m_name");
            	String l_name=request.getParameter("l_name");
            	String bdate=request.getParameter("bdate");
            	String contact=request.getParameter("contact");
            	int age=Integer.parseInt(request.getParameter("age"));
            	String gender=request.getParameter("gender");
            	String maritalstatus=request.getParameter("maritalstatus");
            	String email=request.getParameter("email");
            	String cityaddress=request.getParameter("cityaddress");
            	String provinceaddress=request.getParameter("provinceaddress");
                ee.setPosition(position);
                InputStream is = part.getInputStream();
                ee.setF_name(f_name);
            	ee.setM_name(m_name);
            	ee.setL_name(l_name);
            	ee.setBdate(bdate);
            	ee.setContact(contact);
            	ee.setAge(age);
            	ee.setGender(gender);
            	ee.setMaritalstatus(maritalstatus);
            	ee.setEmail(email);
            	ee.setCityaddress(cityaddress);
            	ee.setProvinceaddress(provinceaddress);
                ps.setString(1, ee.getPosition());
                ps.setBlob(2, is);
                ps.setString(3, ee.getF_name());
    			ps.setString(4, ee.getM_name());
    			ps.setString(5, ee.getL_name());
    			ps.setString(6, ee.getBdate());
    			ps.setString(7, ee.getContact());
    			ps.setInt(8, ee.getAge());
    			ps.setString(9, ee.getGender());
    			ps.setString(10, ee.getMaritalstatus());
    			ps.setString(11, ee.getEmail());
    			ps.setString(12, ee.getCityaddress());
    			ps.setString(13, ee.getProvinceaddress());
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("webpages/employee/employeetable.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}