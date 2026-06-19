// ==========================================
// 1. STATE VARIABLES (Simulated for study)
// ==========================================
const loggedIn = false; // Change to true to test logged-in look
const admin = false;    // Change to true to test admin link
const user = { name: "Guest User" };

// ==========================================
// 2. RENDER THE NAVBAR
// ==========================================
const navbarContainer = document.getElementById('navbar');

if (navbarContainer) {
    navbarContainer.innerHTML = `
    <div class="container nav-inner">
      <a class="nav-brand" href="index.html">🏔 Seven Sisters</a>
      <div class="nav-links" id="navLinks">
        <a href="explore.html">Explore States</a>
        <a href="package.html">Tour Packages</a>
        <a href="about.html">About Us</a>
        <a href="contact.html">Contact</a>
        ${admin ? '<a href="/admin/index.html">Admin</a>' : ""}
      </div>
      <div class="nav-actions">
        ${loggedIn
            ? `<span style="font-size:.85rem;color:var(--text-muted)">Hi, ${user.name.split(" ")[0]}</span>
             <a href="${admin ? "/admin/index.html" : "/dashboard.html"}" class="btn btn-outline btn-sm">Dashboard</a>
             <button class="btn btn-ghost btn-sm" id="logoutBtn">Log out</button>`
            : `<a href="login.html" class="btn btn-ghost btn-sm">Log in</a>
             <a href="register.html" class="btn btn-primary btn-sm">Sign up</a>`
        }
      </div>
      <button class="nav-mobile-toggle" id="mobileToggle">☰</button>
    </div>
  `;

    // Attach event listeners immediately after injecting the HTML strings
    document.getElementById("mobileToggle")?.addEventListener("click", () => {
        document.getElementById("navLinks")?.classList.toggle("open");
    });

    document.getElementById("logoutBtn")?.addEventListener("click", () => {
        alert("Logging out...");
        window.location.href = "index.html";
    });
}
