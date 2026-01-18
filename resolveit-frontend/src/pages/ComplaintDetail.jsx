import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import {
  getComplaintById,
  getComplaintComments,
} from "../api/complaintApi";

// Status color mapping
const statusColor = {
  NEW: "gray",
  UNDER_REVIEW: "orange",
  IN_PROGRESS: "blue",
  RESOLVED: "green",
  ESCALATED: "red",
};

const ComplaintDetail = () => {
  const { id } = useParams();

  const [complaint, setComplaint] = useState(null);
  const [comments, setComments] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
    // eslint-disable-next-line
  }, []);

  const fetchData = async () => {
    try {
      const complaintRes = await getComplaintById(id);
      const commentsRes = await getComplaintComments(id);

      setComplaint(complaintRes.data);

      // show only public comments to users
      setComments(commentsRes.data.filter((c) => !c.isPrivate));
    } catch (error) {
      console.error("Error loading complaint", error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <p>Loading complaint...</p>;
  if (!complaint) return <p>Complaint not found.</p>;

  return (
    <div className="complaint-detail-container">
      {/* Complaint Header */}
      <h2>{complaint.title}</h2>

      <span className={`badge ${statusColor[complaint.status]}`}>
        {complaint.status.replace("_", " ")}
      </span>

      <p>
        <strong>Category:</strong> {complaint.category}
      </p>

      <p>
        <strong>Priority:</strong> {complaint.priority}
      </p>

      <p>
        <strong>Description:</strong>
      </p>
      <p>{complaint.description}</p>

      <p>
        <strong>Created At:</strong>{" "}
        {new Date(complaint.createdAt).toLocaleString()}
      </p>

      <hr />

      {/* Timeline */}
      <h4>Timeline</h4>

      {comments.length === 0 && <p>No updates yet.</p>}

      <ul className="timeline">
        {comments.map((c) => (
          <li key={c.id}>
            <p>{c.message}</p>
            <small>{new Date(c.createdAt).toLocaleString()}</small>
          </li>
        ))}
      </ul>

      <hr />

      {/* Attachments */}
      <h4>Attachments</h4>

      {(!complaint.attachments ||
        complaint.attachments.length === 0) && <p>No attachments</p>}

      <ul>
        {complaint.attachments?.map((a) => (
          <li key={a.id}>
            <a
              href={`http://localhost:8080/${a.filePath}`}
              target="_blank"
              rel="noreferrer"
            >
              {a.filename}
            </a>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ComplaintDetail;
