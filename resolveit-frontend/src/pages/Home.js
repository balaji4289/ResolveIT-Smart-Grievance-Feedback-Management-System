import { useEffect, useState } from "react";
import api from "../api/axios";
import { useAuth } from "../auth/AuthContext";

export default function Home() {
  const { isAdmin } = useAuth();

  const [stats, setStats] = useState({
    total: 0,
    pending: 0,
    resolved: 0,
  });

  const [error, setError] = useState("");

  useEffect(() => {
    loadStats();
    // eslint-disable-next-line
  }, [isAdmin]);

  const loadStats = async () => {
    try {
      let complaints = [];

      if (isAdmin) {
        // ✅ ADMIN → ALL complaints
        const res = await api.get("/complaints/admin/all");
        complaints = res.data;
      } else {
        // ✅ USER → ONLY own complaints
        const res = await api.get("/complaints/my");
        complaints = res.data;
      }

      const getStatusCode = (c) =>
        typeof c.status === "string" ? c.status : c.status.code;

      const total = complaints.length;
      const resolved = complaints.filter(
        (c) => getStatusCode(c) === "RESOLVED"
      ).length;
      const pending = complaints.filter(
        (c) => getStatusCode(c) !== "RESOLVED"
      ).length;

      setStats({ total, pending, resolved });
      setError("");
    } catch (err) {
      console.error(err);
      setError("Unable to load dashboard data");
    }
  };

  return (
    <div className="container mt-5">
      <h3 className="mb-4">
        {isAdmin ? "System Dashboard" : "My Dashboard"}
      </h3>

      {error && <div className="alert alert-danger">{error}</div>}

      <div className="row">
        <div className="col-md-4">
          <div className="card shadow text-center p-4">
            <h6>Total Complaints</h6>
            <h2 className="text-primary">{stats.total}</h2>
          </div>
        </div>

        <div className="col-md-4">
          <div className="card shadow text-center p-4">
            <h6>Pending</h6>
            <h2 className="text-warning">{stats.pending}</h2>
          </div>
        </div>

        <div className="col-md-4">
          <div className="card shadow text-center p-4">
            <h6>Resolved</h6>
            <h2 className="text-success">{stats.resolved}</h2>
          </div>
        </div>
      </div>
    </div>
  );
}
