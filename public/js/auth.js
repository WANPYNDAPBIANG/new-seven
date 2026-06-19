/* ============================================================
   Auth Utilities — JWT token & user session via localStorage
   ============================================================ */

function getToken() { return localStorage.getItem("token"); }
function getUser() {
  try { return JSON.parse(localStorage.getItem("user") || "null"); } catch { return null; }
}
function isLoggedIn() { return !!getToken(); }
function isAdmin() { return getUser()?.role === "admin"; }

function saveSession(token, user) {
  localStorage.setItem("token", token);
  localStorage.setItem("user", JSON.stringify(user));
}
function clearSession() {
  localStorage.removeItem("token");
  localStorage.removeItem("user");
}

function requireAuth(redirectTo = "/login.html") {
  if (!isLoggedIn()) { window.location.href = redirectTo; return false; }
  return true;
}
function requireAdmin(redirectTo = "/login.html") {
  if (!isLoggedIn() || !isAdmin()) { window.location.href = redirectTo; return false; }
  return true;
}
function redirectIfLoggedIn(to = "/dashboard.html") {
  if (isLoggedIn()) { window.location.href = to; }
}
