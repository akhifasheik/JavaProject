package com.servlet;

import com.dao.HospitalDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int patientID = Integer.parseInt(request.getParameter("id"));
            hospitalDAO.deletePatient(patientID);
        } catch (Exception e) {
            e.printStackTrace();
            // You can also redirect to an error page if needed
            response.sendRedirect("error.jsp");
        }
        response.sendRedirect("DisplayPatientsServlet");
    }
}
