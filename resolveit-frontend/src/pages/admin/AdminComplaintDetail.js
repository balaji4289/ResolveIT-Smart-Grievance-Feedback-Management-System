import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import api from "../../api/axios";

export default function AdminComplaintDetail() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [complaint, setComplaint] = useState(null);
  const [statusCode, setStatusCode] = useState("");
  const [success, setSuccess] = useState("");
  const [error, setError] = useState("");

  useEffect(() => {
    loadComplaint();
    // eslint-disable-next-line
  }, []);

  const loadComplaint = async () => {
    try {
      const res = await api.get(`/complaints/admin/${id}`);
      setComplaint(res.data);
      setStatusCode(res.data.status?.code);
    } catch (err) {
      console.error(err);
      setError("Failed to load complaint details");
    }
  };

  const updateStatus = async () => {
    setError("");
    setSuccess("");

    try {
      await api.patch(`/complaints/admin/${id}/status`, {
        statusCode: statusCode,
      });

      setSuccess("Status updated successfully");
      loadComplaint(); // refresh data
    } catch (err) {
      console.error(err);
      setError("Failed to update complaint status");
    }
  };

  if (!complaint) {
    return <div className="container mt-4">Loading...</div>;
  }

  return (
    <div className="container mt-4">
      <button
        className="btn btn-secondary mb-3"
        onClick={() => navigate("/admin/complaints")}
      >
        ← Back
      </button>

      <h3 className="mb-4">Complaint Details (Admin)</h3>

      {error && <div className="alert alert-danger">{error}</div>}
      {success && <div className="alert alert-success">{success}</div>}

      <div className="card shadow p-4 mb-4">
        <p><strong>ID:</strong> {complaint.id}</p>
        <p><strong>Title:</strong> {complaint.title}</p>
        <p><strong>Description:</strong> {complaint.description}</p>
        <p><strong>Category:</strong> {complaint.category}</p>
        <p><strong>Priority:</strong> {complaint.priority}</p>
        <p><strong>Status:</strong> {complaint.status?.display}</p>
        <p>
          <strong>Created At:</strong>{" "}
          {new Date(complaint.createdAt).toLocaleString()}
        </p>
      </div>

      {/* ===== STATUS UPDATE ===== */}
      <div className="card shadow p-4">
        <h5 className="mb-3">Update Status</h5>

        <select
          className="form-select mb-3"
          value={statusCode}
          onChange={(e) => setStatusCode(e.target.value)}
        >
          <option value="OPEN">Open</option>
          <option value="UNDER_REVIEW">Under Review</option>
          <option value="IN_PROGRESS">In Progress</option>
          <option value="RESOLVED">Resolved</option>
          <option value="ESCALATED">Escalated</option>
        </select>

        <button className="btn btn-primary" onClick={updateStatus}>
          Update Status
        </button>
      </div>
    </div>
  );
}
