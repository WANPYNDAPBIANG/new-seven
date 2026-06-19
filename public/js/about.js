document.getElementById("about").innerHTML = `
<div class="page-hero" style="background:linear-gradient(135deg,rgba(0,0,0,.5),rgba(30,61,26,.65)),url('https://images.unsplash.com/photo-1625654325562-762dcec9e6f2?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') center/cover no-repeat">
  <div class="container" style="text-align:center">
    <p class="section-label" style="color:rgba(255,255,255,.75)">Our Story</p>
    <h1 style="color:#fff">About Seven Sisters Travel</h1>
    <p style="color:rgba(255,255,255,.82);max-width:520px;margin:.75rem auto 0">Passionate locals sharing the magic of Northeast India since 2018.</p>
  </div>
</div>

<section class="section">
  <div class="container">
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:4rem;align-items:center;margin-bottom:5rem">
      <div>
        <p class="section-label">Who We Are</p>
        <h2>Born in the Northeast, Built for Explorers</h2>
        <p style="margin:.75rem 0 1rem;line-height:1.8">Seven Sisters Travel was founded by a group of Northeast Indian travel enthusiasts who wanted the world to experience the extraordinary culture, cuisine, and landscapes of their home region.</p>
        <p style="line-height:1.8">We work directly with local guides, community homestays, and tribal artisans — ensuring your travel dollars support the communities you visit.</p>
        <div style="display:flex;gap:2rem;margin-top:2rem">
          <div><div style="font-size:2rem;font-weight:700;color:var(--primary);font-family:Georgia,serif">5000+</div><div style="font-size:.85rem;color:var(--text-muted)">Happy Travelers</div></div>
          <div><div style="font-size:2rem;font-weight:700;color:var(--primary);font-family:Georgia,serif">8</div><div style="font-size:.85rem;color:var(--text-muted)">States Covered</div></div>
          <div><div style="font-size:2rem;font-weight:700;color:var(--primary);font-family:Georgia,serif">4.8★</div><div style="font-size:.85rem;color:var(--text-muted)">Avg. Rating</div></div>
        </div>
      </div>
      <div style="border-radius:var(--radius);overflow:hidden;box-shadow:var(--shadow-lg)">
        <img src="https://images.unsplash.com/photo-1552978534-9d01e1f91517?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Northeast India" style="width:100%;height:380px;object-fit:cover">
      </div>
    </div>

    <div style="margin-bottom:5rem">
      <div class="section-header centered">
        <p class="section-label">Our Values</p>
        <h2 class="section-title">Why Choose Us</h2>
      </div>
      <div class="grid-3">
        ${[
    { icon: "🌿", title: "Sustainable Tourism", desc: "We prioritize eco-friendly travel practices and partner only with responsible operators." },
    { icon: "🤝", title: "Community First", desc: "A portion of every booking goes directly to local communities and conservation projects." },
    { icon: "🏔", title: "Authentic Experiences", desc: "No touristy shortcuts — we curate genuine encounters with local culture and nature." },
    { icon: "🛡", title: "Safe & Reliable", desc: "Fully licensed, insured, and with 24/7 emergency support throughout your journey." },
    { icon: "💰", title: "Best Price Guarantee", desc: "We match any comparable package. Transparent pricing, no hidden fees." },
    { icon: "⭐", title: "Expert Local Guides", desc: "All our guides are certified locals with deep knowledge of their regions." },
  ].map(v => `
          <div class="card card-body" style="text-align:center">
            <div style="font-size:2.5rem;margin-bottom:1rem">${v.icon}</div>
            <h3>${v.title}</h3>
            <p style="font-size:.88rem;margin-top:.5rem">${v.desc}</p>
          </div>`).join("")}
      </div>
    </div>

    <div style="background:var(--primary);border-radius:var(--radius);padding:3rem;text-align:center;color:#fff">
      <h2 style="color:#fff;margin-bottom:.75rem">Ready to Explore?</h2>
      <p style="color:rgba(255,255,255,.82);margin-bottom:2rem;max-width:480px;margin:0 auto 2rem">Join thousands of satisfied travelers who've discovered the magic of Northeast India with us.</p>
      <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap">
        <a href="packages.html" class="btn btn-accent btn-lg">Browse Packages</a>
        <a href="contact.html" class="btn btn-outline-white btn-lg">Get in Touch</a>
      </div>
    </div>
  </div>
</section>`;