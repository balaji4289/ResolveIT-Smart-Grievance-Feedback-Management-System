import { useEffect, useState } from "react";
import api from "../api/axios";
import { useNavigate } from "react-router-dom";

export default function MyComplaints() {
  const [complaints, setComplaints] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    loadComplaints();
  }, []);

  const loadComplaints = async () => {
    try {
      const res = await api.get("/complaints/my");
      setComplaints(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  const getStatusCode = (c) =>
    typeof c.status === "string" ? c.status : c.status.code;

  return (
    <div className="container mt-5">
      <h3>My Complaints</h3>

      {complaints.length === 0 && <p>No complaints found.</p>}

      {complaints.length > 0 && (
        <table className="table table-bordered">
          <thead>
            <tr>
              <th>Title</th>
              <th>Status</th>
              <th>Priority</th>
            </tr>
          </thead>
          <tbody>
            {complaints.map((c) => (
              <tr
                key={c.id}
                style={{ cursor: "pointer" }}
                onClick={() => navigate(`/complaints/${c.id}`)}
              >
                <td>{c.title}</td>
                <td>{getStatusCode(c)}</td>
                <td>{c.priority}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
