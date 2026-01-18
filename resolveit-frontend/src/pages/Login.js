import { useState, useEffect } from "react";
import { useNavigate, Link } from "react-router-dom";
import api from "../api/axios";
import { useAuth } from "../auth/AuthContext";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

  const { login } = useAuth();
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
      const res = await api.post("/auth/login", {
        email,
        password,
      });

      const jwt = res.data.token;
      if (!jwt) {
        throw new Error("Token not received");
      }

      login(jwt);
      setSuccess("Login successful. Redirecting to dashboard...");
      setTimeout(() => navigate("/"), 1200);
    } catch (err) {
      console.error(err);
      setError("Invalid email or password. Please try again.");
    }
  };

  return (
    <div className="container mt-5 col-md-4">
      <h3 className="mb-3 text-center">Login</h3>

      {error && <div className="alert alert-danger">{error}</div>}
      {success && <div className="alert alert-success">{success}</div>}

      <form onSubmit={submit}>
        <input
          type="email"
          className="form-control mb-2"
          placeholder="Email"
          required
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />

        <input
          type="password"
          className="form-control mb-3"
          placeholder="Password"
          required
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />

        <button className="btn btn-primary w-100">
          Login
        </button>
      </form>

      <div className="text-center mt-3">
        <span>Don’t have an account? </span>
        <Link to="/register">Register here</Link>
      </div>
    </div>
  );
}
