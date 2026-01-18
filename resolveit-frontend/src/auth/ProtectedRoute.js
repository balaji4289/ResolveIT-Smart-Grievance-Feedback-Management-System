import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "./AuthContext";

/**
 * Usage:
 * <Route element={<ProtectedRoute />}>               // any logged-in user
 * <Route element={<ProtectedRoute role="ADMIN" />}>  // admin only
 */
export default function ProtectedRoute({ role }) {
  const { isAuthenticated, isAdmin } = useAuth();

  // Not logged in
  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  // Admin-only route protection
  if (role === "ADMIN" && !isAdmin) {
    return <Navigate to="/unauthorized" replace />;
  }

  return <Outlet />;
}
