# Novamira Design & Anti-AI-Slop Website Creation Workflow

Aligned with **Novamira Design** (`novamira.ai/docs/`, Novamira 1.10.0+). Use this reference whenever designing a brand-new WordPress website or redesigning pages on Bricks + ACSS so the output looks deliberately art-directed rather than generic "AI slop".

## 1. What Novamira Design Governs (Single Source of Aesthetic Truth)

Before building any page or section, establish or read the site's **Novamira Design** record (machine-readable, DTCG-compatible design system stored directly in WordPress) containing four pillars:

1. **Palette & Color Roles:** Exact allowed brand/neutral colors and their roles (surface, text, primary action, subtle border). Any color outside the record is flagged as **off-palette**. Map 1-to-1 to ACSS tokens (`--primary`, `--secondary`, `--base`, `--neutral`, `--shade`).
2. **Typography Pairing:** Intentional display/heading + body font pairing with defined scale and line-height hierarchy (mapped to ACSS `--h1`..`--h6`, `--text-*`). Avoid defaulting to generic unstyled Inter/Roboto pairs unless explicitly specified by the brand.
3. **Spacing Rhythm:** Consistent vertical and horizontal cadence mapped to ACSS `--section-space-*`, `--space-*`, and `--content-width`.
4. **Guidance & Explicit "Don'ts" (Anti-AI-Slop Rules):**
   * **Ban generic AI clichés:** No purple-blue glowing gradient blobs, no repetitive 3-column icon-in-circle cards stacked across every section, no gratuitous glassmorphism/heavy drop shadows, no decorative emoji icons in place of cohesive SVGs.
   * **Enforce layout variety:** Alternate section compositions purposefully (asymmetric 40/60 editorial splits, focused typographic statements, structured bento grids with clear hierarchy, concrete proof/metrics bands, real photography/product visuals).
   * **Single primary CTA focus per viewport:** Keep accent color reserved for key conversion actions so visual hierarchy remains unmistakable.

## 2. Five-Step New Website Design Workflow (Bricks + ACSS + Novamira Design)

1. **Step 1 — Art Direction & Token Lock (Before Any Page Build):**
   * Gather brand brief, target audience, conversion goal, and 1–2 visual references (or Figma links).
   * Create/update the **Novamira Design** record on WordPress (Palette, Typography, Spacing, Guidance & Don'ts).
   * Mirror those exact tokens into **ACSS** settings and Bricks Theme Styles, then record the summary in **Novamira Memories**.
2. **Step 2 — Component-First System (Not Full-Page Dumping):**
   * Never prompt or execute a full multi-section website in one monolithic raw dump.
   * Build core **Bricks Components** (with Properties) and **BEM Global Classes** first: Header, Footer, Buttons, Primary Card variants, Testimonial/Proof block, and CTA banner — styled strictly with ACSS variables.
3. **Step 3 — Section-by-Section Build in Draft Mode:**
   * Assemble pages section by section in `draft` status, varying layout rhythm and keeping DOM semantic (`section` > `container` > `block`).
   * Bind real **JetEngine** dynamic data (CPT/CCT/Relations) and realistic domain copy early instead of generic filler text.
4. **Step 4 — Novamira Design Audit & Visual Polish:**
   * Cross-check every built page against the **Novamira Design** record: catch off-palette colors, hardcoded pixel/rem values bypassing ACSS, font mismatches, weak contrast, or AI-slop layout repetition.
   * Inspect live rendering via **Novamira Visual** or **Chrome DevTools** across desktop and mobile viewports (checking spacing rhythm, image aspect ratios, and Core Web Vitals LCP/CLS).
5. **Step 5 — SEO & Client Handoff:**
   * Finalize on-page heading hierarchy (`<h1>` once per page) and **SureRank** metadata/Schema.
   * Enable **Strict Editor View** in Advanced Themer for client roles before production handoff.
