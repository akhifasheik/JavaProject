package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientName = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        Date admissionDate = Date.valueOf(request.getParameter("admissionDate"));
        String ailment = request.getParameter("ailment");
        String assignedDoctor = request.getParameter("doctor");

        Patient newPatient = new Patient(patientName, age, gender, admissionDate, ailment, assignedDoctor);
        try {
            hospitalDAO.addPatient(newPatient);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("DisplayPatientsServlet");
    }
}