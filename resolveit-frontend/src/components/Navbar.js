import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../auth/AuthContext";

export default function Navbar() {
  const navigate = useNavigate();
  const { logout, isAdmin } = useAuth();

  const handleLogout = () => {
    logout();
    navigate("/login");
  };

  return (
    <nav className="navbar navbar-dark bg-dark px-4">
      <span className="navbar-brand fw-bold">
        ResolveIT
      </span>

      <div className="d-flex align-items-center gap-2">

        {/* HOME (ALL USERS) */}
        <Link to="/" className="btn btn-outline-light">
          Home
        </Link>

        {/* USER-ONLY ACTIONS */}
        {!isAdmin && (
          <>
            <Link to="/complaints/my" className="btn btn-outline-light">
              My Complaints
            </Link>

            <Link to="/complaints/new" className="btn btn-outline-light">
              New Complaint
            </Link>
          </>
        )}

        {/* ADMIN-ONLY ACTION */}
        {isAdmin && (
          <Link to="/admin/complaints" className="btn btn-warning">
            All Complaints
          </Link>
        )}

        <button onClick={handleLogout} className="btn btn-danger">
          Logout
        </button>

      </div>
    </nav>
  );
}
