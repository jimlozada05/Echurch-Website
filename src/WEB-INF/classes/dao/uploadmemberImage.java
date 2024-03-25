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

@WebServlet("/uploadmemberImage")
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadmemberImage extends HttpServlet {
	
	PrintWriter out;
	
    public uploadmemberImage() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		members m=new members();
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("m_image");
        if (part != null) {
            try {
                Connection con = dbconnect.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into member(occupation,m_image,login_id,f_name,m_name,l_name,bdate,contact,age,gender,maritalstatus,email,cityaddress,provinceaddress) values(?,?,(SELECT id FROM logined),?,?,?,?,?,?,?,?,?,?,?)");
                String occupation=request.getParameter("occupation");
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
                m.setOccupation(occupation);
                InputStream is = part.getInputStream();
                m.setF_name(f_name);
            	m.setM_name(m_name);
            	m.setL_name(l_name);
            	m.setBdate(bdate);
            	m.setContact(contact);
            	m.setAge(age);
            	m.setGender(gender);
            	m.setMaritalstatus(maritalstatus);
            	m.setEmail(email);
            	m.setCityaddress(cityaddress);
            	m.setProvinceaddress(provinceaddress);
                ps.setString(1, m.getOccupation());
                ps.setBlob(2, is);
                ps.setString(3, m.getF_name());
    			ps.setString(4, m.getM_name());
    			ps.setString(5, m.getL_name());
    			ps.setString(6, m.getBdate());
    			ps.setString(7, m.getContact());
    			ps.setInt(8, m.getAge());
    			ps.setString(9, m.getGender());
    			ps.setString(10, m.getMaritalstatus());
    			ps.setString(11, m.getEmail());
    			ps.setString(12, m.getCityaddress());
    			ps.setString(13, m.getProvinceaddress());
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("webpages/members/membertable.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}