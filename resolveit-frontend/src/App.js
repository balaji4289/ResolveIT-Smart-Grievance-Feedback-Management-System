import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./auth/AuthContext";
import ProtectedRoute from "./auth/ProtectedRoute";

import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import MyComplaints from "./pages/MyComplaints";
import CreateComplaint from "./pages/CreateComplaint";
import ComplaintDetail from "./pages/ComplaintDetail";
import Unauthorized from "./pages/Unauthorized";

import AdminComplaints from "./pages/admin/AdminComplaints";
import AdminComplaintDetail from "./pages/admin/AdminComplaintDetail";

import MainLayout from "./layouts/MainLayout";

function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          {/* ===== PUBLIC ROUTES ===== */}
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />

          {/* ===== USER ROUTES ===== */}
          <Route element={<ProtectedRoute />}>
            <Route element={<MainLayout />}>
              <Route path="/" element={<Home />} />
              <Route path="/complaints" element={<MyComplaints />} />
              <Route path="/complaints/my" element={<MyComplaints />} />
              <Route path="/complaints/new" element={<CreateComplaint />} />
              <Route path="/complaints/:id" element={<ComplaintDetail />} />
              <Route path="/unauthorized" element={<Unauthorized />} />

              {/* ===== ADMIN ROUTES ===== */}
              <Route path="/admin/complaints" element={<AdminComplaints />} />
              <Route
                path="/admin/complaints/:id"
                element={<AdminComplaintDetail />}
              />
            </Route>
          </Route>
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
}

export default App;
