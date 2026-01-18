import { useState, useEffect } from "react";
import { useNavigate, Link } from "react-router-dom";
import api from "../api/axios";

export default function Register() {
  const [form, setForm] = useState({
    username: "",
    fullName: "",
    email: "",
    password: ""
  });

  const [success, setSuccess] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  // Auto-clear alerts
  useEffect(() => {
    if (error || success) {
      const t = setTimeout(() => {
        setError("");
        setSuccess("");
      }, 3000);
      return () => clearTimeout(t);
    }
  }, [error, success]);

  const submit = async (e) => {
    e.preventDefault();
    setError("");
    setSuccess("");

    try {
      await api.post("/auth/register", form);
      setSuccess("Registration successful. Redirecting to login...");
      setTimeout(() => navigate("/login"), 1500);
    } catch (err) {
      console.error(err);
      setError("Registration failed. Email may already be registered.");
    }
  };

  return (
    <div className="container mt-5 col-md-4">
      <h3 className="mb-3 text-center">Register</h3>

      {error && <div className="alert alert-danger">{error}</div>}
      {success && <div className="alert alert-success">{success}</div>}

      <form onSubmit={submit}>
        <input
          className="form-control mb-2"
          placeholder="Username"
          required
          value={form.username}
          onChange={(e) =>
            setForm({ ...form, username: e.target.value })
          }
        />

        <input
          className="form-control mb-2"
          placeholder="Full Name"
          required
          value={form.fullName}
          onChange={(e) =>
            setForm({ ...form, fullName: e.target.value })
          }
        />

        <input
          type="email"
          className="form-control mb-2"
          placeholder="Email"
          required
          value={form.email}
          onChange={(e) =>
            setForm({ ...form, email: e.target.value })
          }
        />

        <input
          type="password"
          className="form-control mb-3"
          placeholder="Password"
          required
          value={form.password}
          onChange={(e) =>
            setForm({ ...form, password: e.target.value })
          }
        />

        <button className="btn btn-success w-100">
          Register
        </button>
      </form>

      <div className="text-center mt-3">
        <span>Already have an account? </span>
        <Link to="/login">Login here</Link>
      </div>
    </div>
  );
}
