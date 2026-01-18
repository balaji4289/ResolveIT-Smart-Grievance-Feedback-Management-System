import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../../api/axios";

export default function AdminComplaints() {
  const [complaints, setComplaints] = useState([]);
  const [error, setError] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    loadComplaints();
  }, []);

  const loadComplaints = async () => {
    try {
      const res = await api.get("/complaints/admin/all");
      setComplaints(res.data);
    } catch (err) {
      console.error(err);
      setError("Failed to load complaints");
    }
  };

  return (
    <div className="container mt-4">
      <h3 className="mb-4">All Complaints (Admin)</h3>

      {error && <div className="alert alert-danger">{error}</div>}

      <table className="table table-bordered table-hover">
        <thead className="table-dark">
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Category</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Created</th>
            <th>Action</th>
          </tr>
        </thead>

        <tbody>
          {complaints.map((c) => (
            <tr key={c.id}>
              <td>{c.id}</td>
              <td>{c.title}</td>
              <td>{c.category}</td>
              <td>{c.priority}</td>
              <td>{c.status?.display}</td>
              <td>{new Date(c.createdAt).toLocaleString()}</td>
              <td>
                <button
                  className="btn btn-sm btn-primary"
                  onClick={() => navigate(`/admin/complaints/${c.id}`)}
                >
                  View
                </button>
              </td>
            </tr>
          ))}

          {complaints.length === 0 && (
            <tr>
              <td colSpan="7" className="text-center">
                No complaints found
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
}
