import { useState } from "react";
import api from "../api/axios";

export default function CreateComplaint() {
  const [form, setForm] = useState({
    title: "",
    description: "",
    category: "",
    priority: "LOW",      // ✅ valid default
    anonymous: false      // ✅ backend expects this
  });

  const [files, setFiles] = useState([]);
  const [success, setSuccess] = useState("");
  const [error, setError] = useState("");

  const handleFileChange = (e) => {
    setFiles([...e.target.files]);
  };

  const submit = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    try {
      // 1️⃣ Create complaint (backend-aligned payload)
      const res = await api.post("/complaints", {
        title: form.title,
        description: form.description,
        category: form.category,
        priority: form.priority,
        anonymous: form.anonymous
      });

      const complaintId = res.data.id;

      // 2️⃣ Upload attachments (if any)
      if (files.length > 0) {
        const formData = new FormData();
        files.forEach((file) => {
          formData.append("files", file);
        });

        await api.post(
          `/complaints/${complaintId}/attachments`,
          formData,
          { headers: { "Content-Type": "multipart/form-data" } }
        );
      }

      setSuccess("Complaint submitted successfully");

      // 3️⃣ Reset form
      setForm({
        title: "",
        description: "",
        category: "",
        priority: "LOW",
        anonymous: false
      });
      setFiles([]);

    } catch (err) {
      console.error(err);
      setError("Failed to submit complaint");
    }
  };

  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-md-6">
          <div className="card shadow p-4">
            <h4 className="text-center mb-4">Create a Grievance</h4>

            {error && <div className="alert alert-danger">{error}</div>}
            {success && <div className="alert alert-success">{success}</div>}

            <form onSubmit={submit}>

              {/* Complaint Type */}
              <div className="mb-3">
                <label className="form-label fw-bold">Complaint Type</label>
                <div>
                  <input
                    type="radio"
                    name="type"
                    className="form-check-input me-1"
                    checked={form.anonymous}
                    onChange={() =>
                      setForm({ ...form, anonymous: true })
                    }
                  />
                  <label className="me-3">Anonymous</label>

                  <input
                    type="radio"
                    name="type"
                    className="form-check-input me-1"
                    checked={!form.anonymous}
                    onChange={() =>
                      setForm({ ...form, anonymous: false })
                    }
                  />
                  <label>Public</label>
                </div>
              </div>

              {/* Title */}
              <div className="mb-3">
                <label className="form-label fw-bold">Complaint Title</label>
                <input
                  type="text"
                  className="form-control"
                  required
                  value={form.title}
                  onChange={(e) =>
                    setForm({ ...form, title: e.target.value })
                  }
                />
              </div>

              {/* Category */}
              <div className="mb-3">
                <label className="form-label fw-bold">Category</label>
                <select
                  className="form-select"
                  required
                  value={form.category}
                  onChange={(e) =>
                    setForm({ ...form, category: e.target.value })
                  }
                >
                  <option value="">Select Category</option>
                  <option value="Academic">Academic</option>
                  <option value="Infrastructure">Infrastructure</option>
                  <option value="Hostel">Hostel</option>
                  <option value="Examination">Examination</option>
                  <option value="Administration">Administration</option>
                  <option value="Other">Other</option>
                </select>
              </div>

              {/* Description */}
              <div className="mb-3">
                <label className="form-label fw-bold">Description</label>
                <textarea
                  className="form-control"
                  rows="4"
                  required
                  value={form.description}
                  onChange={(e) =>
                    setForm({ ...form, description: e.target.value })
                  }
                />
              </div>

              {/* Priority */}
              <div className="mb-3">
                <label className="form-label fw-bold">Priority</label>
                <select
                  className="form-select"
                  value={form.priority}
                  onChange={(e) =>
                    setForm({ ...form, priority: e.target.value })
                  }
                >
                  <option value="LOW">Low</option>
                  <option value="MEDIUM">Medium</option>
                  <option value="HIGH">High</option>
                </select>
              </div>

              {/* Attachments */}
              <div className="mb-4">
                <label className="form-label fw-bold">
                  Attach Evidence
                </label>
                <input
                  type="file"
                  className="form-control"
                  multiple
                  onChange={handleFileChange}
                />
              </div>

              {files.length > 0 && (
                <ul>
                  {files.map((f, i) => (
                    <li key={i}>{f.name}</li>
                  ))}
                </ul>
              )}

              <button className="btn btn-dark w-100">
                Submit Complaint
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
