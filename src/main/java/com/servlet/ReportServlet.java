package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        List<Patient> patients = null;

        try {
            switch (reportType) {
                case "dateRange":
                    Date startDate = Date.valueOf(request.getParameter("startDate"));
                    Date endDate = Date.valueOf(request.getParameter("endDate"));
                    patients = hospitalDAO.getPatientsByDateRange(startDate, endDate);
                    break;
                case "ailment":
                    String ailment = request.getParameter("ailment");
                    patients = hospitalDAO.getPatientsByAilment(ailment);
                    break;
                case "doctor":
                    String doctor = request.getParameter("doctor");
                    patients = hospitalDAO.getPatientsByDoctor(doctor);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listPatient", patients);
        request.setAttribute("reportType", reportType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
        dispatcher.forward(request, response);
    }
}