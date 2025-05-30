package com.dao;

import com.model.Patient;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HospitalDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/hospitaldb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";
    
    private static final String INSERT_PATIENT_SQL = "INSERT INTO patients (PatientName, Age, Gender, AdmissionDate, Ailment, AssignedDoctor) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PATIENT_BY_ID = "SELECT * FROM patients WHERE PatientID=?";
    private static final String SELECT_ALL_PATIENTS = "SELECT * FROM patients";
    private static final String DELETE_PATIENT_SQL = "DELETE FROM patients WHERE PatientID=?";
    private static final String UPDATE_PATIENT_SQL = "UPDATE patients SET PatientName=?, Age=?, Gender=?, AdmissionDate=?, Ailment=?, AssignedDoctor=? WHERE PatientID=?";
    private static final String SELECT_PATIENTS_BY_DATE_RANGE = "SELECT * FROM patients WHERE AdmissionDate BETWEEN ? AND ?";
    private static final String SELECT_PATIENTS_BY_AILMENT = "SELECT * FROM patients WHERE Ailment LIKE ?";
    private static final String SELECT_PATIENTS_BY_DOCTOR = "SELECT * FROM patients WHERE AssignedDoctor=?";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL 8+ driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL Driver not found.", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Add Patient
    public void addPatient(Patient patient) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PATIENT_SQL)) {
            preparedStatement.setString(1, patient.getPatientName());
            preparedStatement.setInt(2, patient.getAge());
            preparedStatement.setString(3, patient.getGender());
            preparedStatement.setDate(4, new java.sql.Date(patient.getAdmissionDate().getTime()));
            preparedStatement.setString(5, patient.getAilment());
            preparedStatement.setString(6, patient.getAssignedDoctor());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Update Patient
    public boolean updatePatient(Patient patient) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PATIENT_SQL)) {
            statement.setString(1, patient.getPatientName());
            statement.setInt(2, patient.getAge());
            statement.setString(3, patient.getGender());
            statement.setDate(4, new java.sql.Date(patient.getAdmissionDate().getTime()));
            statement.setString(5, patient.getAilment());
            statement.setString(6, patient.getAssignedDoctor());
            statement.setInt(7, patient.getPatientID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Select Patient by ID
    public Patient selectPatient(int patientID) {
        Patient patient = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PATIENT_BY_ID)) {
            preparedStatement.setInt(1, patientID);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String patientName = rs.getString("PatientName");
                int age = rs.getInt("Age");
                String gender = rs.getString("Gender");
                Date admissionDate = rs.getDate("AdmissionDate");
                String ailment = rs.getString("Ailment");
                String assignedDoctor = rs.getString("AssignedDoctor");
                patient = new Patient(patientName, age, gender, admissionDate, ailment, assignedDoctor);
                patient.setPatientID(patientID);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return patient;
    }

    // Select All Patients
    public List<Patient> selectAllPatients() {
        List<Patient> patients = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PATIENTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int patientID = rs.getInt("PatientID");
                String patientName = rs.getString("PatientName");
                int age = rs.getInt("Age");
                String gender = rs.getString("Gender");
                Date admissionDate = rs.getDate("AdmissionDate");
                String ailment = rs.getString("Ailment");
                String assignedDoctor = rs.getString("AssignedDoctor");
                Patient patient = new Patient(patientName, age, gender, admissionDate, ailment, assignedDoctor);
                patient.setPatientID(patientID);
                patients.add(patient);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return patients;
    }

    // Delete Patient
    public boolean deletePatient(int patientID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PATIENT_SQL)) {
            statement.setInt(1, patientID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Report: Patients by Date Range
    public List<Patient> getPatientsByDateRange(Date startDate, Date endDate) {
        List<Patient> patients = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PATIENTS_BY_DATE_RANGE)) {
            preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
            preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int patientID = rs.getInt("PatientID");
                String patientName = rs.getString("PatientName");
                int age = rs.getInt("Age");
                String gender = rs.getString("Gender");
                Date admissionDate = rs.getDate("AdmissionDate");
                String ailment = rs.getString("Ailment");
                String assignedDoctor = rs.getString("AssignedDoctor");
                Patient patient = new Patient(patientName, age, gender, admissionDate, ailment, assignedDoctor);
                patient.setPatientID(patientID);
                patients.add(patient);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return patients;
    }

    // Report: Patients by Ailment
    public List<Patient> getPatientsByAilment(String ailmentKeyword) {
        List<Patient> patients = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PATIENTS_BY_AILMENT)) {
            preparedStatement.setString(1, "%" + ailmentKeyword + "%");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int patientID = rs.getInt("PatientID");
                String patientName = rs.getString("PatientName");
                int age = rs.getInt("Age");
                String gender = rs.getString("Gender");
                Date admissionDate = rs.getDate("AdmissionDate");
                String ailment = rs.getString("Ailment");
                String assignedDoctor = rs.getString("AssignedDoctor");
                Patient patient = new Patient(patientName, age, gender, admissionDate, ailment, assignedDoctor);
                patient.setPatientID(patientID);
                patients.add(patient);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return patients;
    }

    // Report: Patients by Doctor
    public List<Patient> getPatientsByDoctor(String doctorName) {
        List<Patient> patients = new ArrayList<>();
        // Prepend "Dr. " to the input doctorName
        String fullDoctorName = "Dr. " + doctorName;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PATIENTS_BY_DOCTOR)) {
            
            preparedStatement.setString(1, fullDoctorName);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int patientID = rs.getInt("PatientID");
                String patientName = rs.getString("PatientName");
                int age = rs.getInt("Age");
                String gender = rs.getString("Gender");
                Date admissionDate = rs.getDate("AdmissionDate");
                String ailment = rs.getString("Ailment");
                String assignedDoctor = rs.getString("AssignedDoctor");

                Patient patient = new Patient(patientName, age, gender, admissionDate, ailment, assignedDoctor);
                patient.setPatientID(patientID);
                patients.add(patient);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return patients;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}