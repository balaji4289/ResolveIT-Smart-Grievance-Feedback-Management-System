# ResolveIT – Smart Grievance & Feedback Management System

## 📌 Project Overview
ResolveIT is a full-stack web application designed to manage grievances and feedback efficiently.  
It allows users to submit complaints with attachments and track their status, while administrators can view, manage, and resolve complaints through a centralized dashboard.

This project was developed as part of an internship program and follows real-world best practices such as role-based access control, secure authentication, and modular architecture.

---

## 🛠️ Tech Stack

### Frontend
- React.js
- Axios
- Bootstrap
- React Router

### Backend
- Java
- Spring Boot
- Spring Security
- JWT Authentication
- JPA / Hibernate

### Database
- MySQL

---

## 👥 User Roles & Features

### 👤 User
- Register and login
- Submit complaints with optional file attachments
- View own complaints and their status
- Personal dashboard with complaint statistics

### 🛡️ Admin
- Login with admin role
- View all complaints submitted by users
- Update complaint status (Open, In Progress, Resolved, Escalated)
- System-wide dashboard with overall statistics

--

---

---

## ⚙️ How to Run the Project

### 1️⃣ Database Setup
1. Install MySQL
2. Create a database:

CREATE DATABASE resolveit;
4. Import the SQL file:
database/resolveitdb.sql


---

### 2️⃣ Backend Setup
1. Navigate to backend folder:


cd resolveit-backend

2. Update database credentials in:


src/main/resources/application.properties

3. Run the backend:


mvn clean install
mvn spring-boot:run

4. Backend runs at:


http://localhost:8080


---

### 3️⃣ Frontend Setup
1. Navigate to frontend folder:


cd resolveit-frontend

2. Install dependencies:


npm install

3. Start the frontend:


npm start

4. Frontend runs at:


http://localhost:3000


---

## 🔐 Security & Authentication
- JWT-based authentication
- Role-based authorization (ROLE_USER, ROLE_ADMIN)
- Protected routes for admin and user actions
- Secure REST APIs

---

## 📧 Additional Features
- File attachment support for complaints
- Email notification integration (SMTP)
- Complaint status tracking
- SLA-based complaint handling (priority-driven)

---

## 📄 License
This project is licensed under the **MIT License**.  
See the `LICENSE` file for more details.

---

## 👨‍💻 Author
**Balaji Pechetti**  
Internship Project – 2026
