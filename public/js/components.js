/* { isLoggedIn, isAdmin, getUser, clearSession } from "./auth.js"; */



/* ---------- Toast Notifications ---------- */
let toastContainer;
function getToastContainer() {
  if (!toastContainer) {
    toastContainer = document.createElement("div");
    toastContainer.id = "toast-container";
    document.body.appendChild(toastContainer);
  }
  return toastContainer;
}

function toast(message, type = "default") {
  const el = document.createElement("div");
  el.className = `toast${type !== "default" ? " " + type : ""}`;
  el.textContent = message;
  getToastContainer().appendChild(el);
  setTimeout(() => {
    el.style.opacity = "0";
    el.style.transform = "translateY(10px)";
    el.style.transition = "0.3s";
    setTimeout(() => el.remove(), 300);
  }, 3200);
}

/* ---------- Spinner ---------- */
function spinner() {
  return `<div class="page-loader"><div class="spinner"></div></div>`;
}

/* ---------- Navbar ---------- */
function renderNavbar() {
  const loggedIn = isLoggedIn();
  const admin = isAdmin();
  const user = getUser();

  const nav = document.createElement("nav");
  nav.id = "navbar";
  nav.innerHTML = `
    <div class="container nav-inner">
      <a class="nav-brand" href="/index.html">🏔 Seven Sisters</a>
      <div class="nav-links" id="navLinks">
        <a href="/explore.html">Explore States</a>
        <a href="/packages.html">Tour Packages</a>
        <a href="/about.html">About Us</a>
        <a href="/contact.html">Contact</a>
        ${admin ? '<a href="/admin/index.html">Admin</a>' : ""}
      </div>
      <div class="nav-actions">
        ${loggedIn
      ? `<span style="font-size:.85rem;color:var(--text-muted)">Hi, ${user?.name?.split(" ")[0] || "User"}</span>
             <a href="${admin ? "/admin/index.html" : "/dashboard.html"}" class="btn btn-outline btn-sm">Dashboard</a>
             <button class="btn btn-ghost btn-sm" id="logoutBtn">Log out</button>`
      : `<a href="/login.html" class="btn btn-ghost btn-sm">Log in</a>
             <a href="/register.html" class="btn btn-primary btn-sm">Sign up</a>`
    }
      </div>
      <button class="nav-mobile-toggle" id="mobileToggle">☰</button>
    </div>
  `;
  document.body.insertBefore(nav, document.body.firstChild);

  document.getElementById("mobileToggle")?.addEventListener("click", () => {
    document.getElementById("navLinks")?.classList.toggle("open");
  });
  document.getElementById("logoutBtn")?.addEventListener("click", () => {
    clearSession();
    window.location.href = "/index.html";
  });
}

/* ---------- Footer ---------- */
function renderFooter() {
  const footer = document.createElement("footer");
  footer.innerHTML = `
    <div class="container">
      <div class="footer-grid">
        <div>
          <div class="footer-brand">🏔 Seven Sisters Travel</div>
          <p class="footer-desc">Northeast India's premier travel company. Connecting the world to the eight extraordinary states of India's northeast since 2018.</p>
        </div>
        <div class="footer-col">
          <h4>Explore</h4>
          <ul>
            <li><a href="/explore.html">All States</a></li>
            <li><a href="/packages.html">Tour Packages</a></li>
            <li><a href="/about.html">Our Story</a></li>
            <li><a href="/contact.html">Contact</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>States</h4>
          <ul>
            <li><a href="/state.html?slug=assam">Assam</a></li>
            <li><a href="/state.html?slug=meghalaya">Meghalaya</a></li>
            <li><a href="/state.html?slug=nagaland">Nagaland</a></li>
            <li><a href="/state.html?slug=manipur">Manipur</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Account</h4>
          <ul>
            <li><a href="/login.html">Login</a></li>
            <li><a href="/register.html">Sign Up</a></li>
            <li><a href="/dashboard.html">Dashboard</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p>© ${new Date().getFullYear()} Seven Sisters Travel. All rights reserved.</p>
      </div>
    </div>
  `;
  document.body.appendChild(footer);
}

/* ---------- Admin Sidebar ---------- */
function renderAdminSidebar(activeHref) {
  const links = [
    { href: "/admin/index.html", label: "Overview", icon: "📊" },
    { href: "/admin/packages.html", label: "Packages", icon: "🗺️" },
    { href: "/admin/bookings.html", label: "Bookings", icon: "📋" },
    { href: "/admin/users.html", label: "Users", icon: "👥" },
    { href: "/admin/messages.html", label: "Messages", icon: "✉️" },
    { href: "/admin/notifications.html", label: "Notifications", icon: "🔔" },
    { href: "/admin/analytics.html", label: "Analytics", icon: "📈" },
    { href: "/admin/activity.html", label: "Activity Log", icon: "⚡" },
  ];
  return `<nav class="admin-sidebar">
    ${links.map(l => `<a href="${l.href}" class="${l.href === activeHref ? "active" : ""}"><span class="sidebar-icon">${l.icon}</span>${l.label}</a>`).join("")}
  </nav>`;
}

/* ---------- Stars ---------- */
function renderStars(rating) {
  const full = Math.round(rating);
  return "★".repeat(full) + "☆".repeat(5 - full);
}

/* ---------- Format Date ---------- */
function formatDate(d) {
  return new Date(d).toLocaleDateString("en-IN", { year: "numeric", month: "short", day: "numeric" });
}

/* ---------- Format Currency ---------- */
function formatPrice(n) {
  return "₹" + Number(n).toLocaleString("en-IN");
}
