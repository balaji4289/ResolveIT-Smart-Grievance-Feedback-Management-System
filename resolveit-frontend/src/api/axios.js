import axios from "axios";

// Create Axios instance
const api = axios.create({
  baseURL: "http://localhost:8080",
});

// Attach JWT automatically to every request
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token");

    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }

    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// File upload helper (used in complaint creation)
export const uploadAttachments = (complaintId, files) => {
  const formData = new FormData();

  files.forEach((file) => {
    formData.append("files", file);
  });

  return api.post(`/complaints/${complaintId}/attachments`, formData, {
    headers: {
      "Content-Type": "multipart/form-data",
    },
  });
};

// 🔴 THIS LINE IS CRITICAL (WAS MISSING)
export default api;
