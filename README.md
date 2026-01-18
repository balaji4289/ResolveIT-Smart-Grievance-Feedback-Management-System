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

---

## 📂 Project Structure

ResolveIT/
├── database/
│   └── resolveitdb.sql
├── resolveit-backend/
│   ├── src/main/java
│   ├── src/main/resources
│   └── pom.xml
├── resolveit-frontend/
│   ├── public
│   ├── src
│   ├── package.json
│   └── README.md
└── README.md

---

## ⚙️ How to Run the Project

### 1️⃣ Database Setup
- Install MySQL
- Create a database named `resolveit`
- Import the SQL file:
