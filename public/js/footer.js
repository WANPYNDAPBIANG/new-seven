// ==========================================
// 3. RENDER THE FOOTER
// ==========================================
const footerContainer = document.getElementById('footer');

if (footerContainer) {
    footerContainer.innerHTML = `
    <div class="container">
      <div class="footer-grid">
        <div>
          <div class="footer-brand">🏔 Seven Sisters Travel</div>
          <p class="footer-desc">Northeast India's premier travel company. Connecting the world to the eight extraordinary states of India's northeast since 2018.</p>
        </div>
        <div class="footer-col">
          <h4>Explore</h4>
          <ul>
            <li><a href="explore.html">All States</a></li>
            <li><a href="packages.html">Tour Packages</a></li>
            <li><a href="about.html">Our Story</a></li>
            <li><a href="contact.html">Contact</a></li>
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
            <li><a href="login.html">Login</a></li>
            <li><a href="register.html">Sign Up</a></li>
            <li><a href="dashboard.html">Dashboard</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p>© ${new Date().getFullYear()} Seven Sisters Travel. All rights reserved.</p>
      </div>
    </div>
  `;
}
