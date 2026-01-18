import api from "./axios";

export const getComplaintById = (id) =>
  api.get(`/complaints/${id}`);

export const getComplaintComments = (id) =>
  api.get(`/complaints/${id}/comments`);
