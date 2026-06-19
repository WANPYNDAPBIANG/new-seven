/* ============================================================
   API Utility — thin wrapper around fetch()
   All API calls go to /api/* (Replit proxy routes to port 8080)
   ============================================================ */

const BASE = "/api";

async function apiFetch(path, opts = {}) {
  const token = localStorage.getItem("token");
  const headers = { "Content-Type": "application/json", ...(opts.headers || {}) };
  if (token) headers["Authorization"] = `Bearer ${token}`;

  const res = await fetch(BASE + path, { ...opts, headers });
  const data = await res.json().catch(() => ({}));

  if (!res.ok) {
    const err = new Error(data.error || `Request failed: ${res.status}`);
    err.status = res.status;
    err.data = data;
    throw err;
  }
  return data;
}

// Auth
const authApi = {
  login: (email, password) => apiFetch("/auth/login", { method: "POST", body: JSON.stringify({ email, password }) }),
  register: (name, email, password) => apiFetch("/auth/register", { method: "POST", body: JSON.stringify({ name, email, password }) }),
  me: () => apiFetch("/auth/me"),
  logout: () => apiFetch("/auth/logout", { method: "POST" }),
};

// Packages
const packagesApi = {
  list: (params = {}) => {
    const q = new URLSearchParams(params).toString();
    return apiFetch("/packages" + (q ? "?" + q : ""));
  },
  featured: () => apiFetch("/packages/featured"),
  get: (id) => apiFetch(`/packages/${id}`),
};

// States
const statesApi = {
  list: () => apiFetch("/states"),
  get: (slug) => apiFetch(`/states/${slug}`),
};

// Bookings
const bookingsApi = {
  list: () => apiFetch("/bookings"),
  create: (data) => apiFetch("/bookings", { method: "POST", body: JSON.stringify(data) }),
  updateStatus: (id, status) => apiFetch(`/bookings/${id}/status`, { method: "PATCH", body: JSON.stringify({ status }) }),
};

// Reviews
const reviewsApi = {
  list: (packageId) => apiFetch("/reviews" + (packageId ? `?packageId=${packageId}` : "")),
  create: (data) => apiFetch("/reviews", { method: "POST", body: JSON.stringify(data) }),
};

// Contact
const contactApi = {
  send: (data) => apiFetch("/contact", { method: "POST", body: JSON.stringify(data) }),
  list: () => apiFetch("/contact"),
};

// Admin
const adminApi = {
  stats: () => apiFetch("/admin/stats"),
  analytics: () => apiFetch("/admin/analytics"),
  bookings: () => apiFetch("/admin/bookings"),
  users: () => apiFetch("/admin/users"),
  notifications: () => apiFetch("/admin/notifications"),
  createNotification: (data) => apiFetch("/admin/notifications", { method: "POST", body: JSON.stringify(data) }),
  deleteNotification: (id) => apiFetch(`/admin/notifications/${id}`, { method: "DELETE" }),
  activity: () => apiFetch("/admin/activity"),
};

// Notifications (user)
const notificationsApi = {
  list: () => apiFetch("/notifications"),
  markRead: (id) => apiFetch(`/notifications/${id}/read`, { method: "PATCH" }),
  markAllRead: () => apiFetch("/notifications/read-all", { method: "PATCH" }),
};
