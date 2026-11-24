# Novamira Design & Anti-AI-Slop Website Creation Workflow

Aligned with **Novamira Design** (`novamira.ai/docs/`, Novamira 1.10.0+) and distilled craft standards (Design Read, Quantitative Dials, Surface Modes, Bounded Verification, Visual Richness Floor, and Measurable UX Floor) adapted strictly for **WordPress + Bricks Builder + ACSS + AT + ASE + JetEngine + SureRank** via **MCP Novamira Pro (OAuth)**.

> **Companion Skill Delegation (Stage 1 & Gate 1B):** Always load and execute the **`agency-web-design`** skill first during Stage 1 and Gate 1B for multi-industry visual blueprints (`industry-archetypes.md`), Vietnamese-safe font pairings & 60-30-10 color scales (`typography-and-color-vn.md`), 12 non-generic section compositions (`anti-slop-and-composition.md`), Art Director critique (`critique-and-polish.md`), and Bricks/ACSS static handoff (`bricks-acss-handoff.md`). This file governs how those approved deliverables bridge cleanly into Novamira Design and Stage 2–4 WordPress deployment.

## 1. Phase 0 — Brief Inference Before Any Build

Never jump straight into building sections with default LLM aesthetics. Establish five quick decisions first:

* **One-Line Design Read & Pre-Build Confirmation:** State a concise summary before creating tokens or layouts:
  *"Reading this as: `<page kind>` for `<audience>`, in `<Surface Mode>` mode, with a `<vibe>` visual language."*
  Present the proposed **3 Dials, palette/typography direction, single cohesive SVG icon family, and full sitemap / Homepage section outline**, and **WAIT for user confirmation** before generating the Homepage FE Demo.
* **Surface Mode (Per Page, Not Whole Site):**
  * `Persuade`: Landing pages, services, pricing, campaigns — visual clarity and single primary CTA lead.
  * `Read`: Blog posts, guides, documentation, case studies — scannable typography and reading comfort lead.
  * `Experience`: Portfolios, studios, visual showcases — photography/work leads from the first viewport.
  * `Operate`: Client portals, member dashboards, booking tools — speed, scanability, and predictable controls lead.
* **Refinement vs. Redesign (Existing Client Sites):**
  * **Refinement:** Preserve existing brand identity, tokens, and out-of-scope sections; tighten spacing, hierarchy, and UX cleanly.
  * **Redesign:** Treat the old layout as anti-reference; replace the Novamira Design record and ACSS palette cleanly instead of half-polishing an outdated look.
* **The Three Dials (1–10 Scale):** Set explicit visual calibration before scaffolding (user can override conversationally):
  * `DESIGN_VARIANCE` (1 = strict symmetry, 10 = asymmetric editorial freedom)
  * `MOTION_INTENSITY` (1 = static, 10 = expressive scroll/GSAP choreography)
  * `VISUAL_DENSITY` (1 = airy/gallery, 10 = compact/high-density)
  * **Agency Presets:** Trust-first B2B / Regulated `3 / 2 / 5` · SaaS / Conversion Landing `7 / 6 / 4` · Agency / Creative `9 / 8 / 3` · Editorial / Blog `6 / 4 / 3`.

## 2. Novamira Design Record (Single Source of Aesthetic Truth)

Store the finalized direction directly in WordPress via **Novamira Design** (machine-readable, DTCG-compatible) and mirror 1-to-1 into **ACSS** + **Novamira Memories**:

1. **Palette & Color Roles:** Exact allowed colors and roles (surface, text, primary action, subtle border). Any color outside the record is flagged as **off-palette**. Map directly to ACSS (`--primary`, `--secondary`, `--base`, `--neutral`, `--shade`).
2. **Typography Pairing:** Intentional Heading/Body font pairing mapped to ACSS `--h1`..`--h6` and `--text-*` (never default blindly to generic unstyled Inter/Roboto unless specified by the brand).
3. **Spacing Rhythm:** Consistent cadence mapped to ACSS `--section-space-*`, `--space-*`, and `--content-width`.
4. **Guidance & Explicit "Don'ts" (Anti-AI-Slop Bans):**
   * Ban purple-blue glowing gradient blobs, repetitive 3-column icon-in-circle cards stacked across consecutive sections, gratuitous glassmorphism/heavy drop shadows, and emoji icons in place of cohesive SVGs.
   * Alternate section compositions purposefully (asymmetric 40/60 splits, typographic statements, hierarchical bento grids, concrete proof/metrics bands, real photography).
   * Reserve accent color for the single primary CTA focus per viewport.

## 3. Sequential Stage Alignment & Mandatory Sub-Page Visual Gate (Gate 1B)

Follow the 4-stage pipeline in `SKILL.md` strictly in order — **never re-initialize the design system when building sub-pages**:

1. **Stage 1 (Homepage FE Demo — Run ONCE):** Complete Phase 0 (Design Read, Surface Modes, 3 Dials, SVG icon family, sitemap), build the standalone Bricks-ready Homepage FE Demo (`index.html`, `tokens.css`, `styles.css`, `main.js`, `design-system.json`), verify via `playwright-cli`, and **STOP at Gate 1** for client/user sign-off.
2. **Gate 1B (MANDATORY Sub-Page & Dynamic Template Visual Approval — Never Skip):**
   * **Before building ANY inner page (`About`, `Services`, `Contact`, etc.) or Dynamic Template (`Blog/CPT Archive`, `Single`, `404`) in Bricks**, you MUST:
     1. Present the **Sitemap & detailed Section Outline** for each sub-page and dynamic template (listing exact sections, layout composition, SVG icon & image slots, dynamic data fields, and CTA/form placement).
     2. Build static HTML/CSS visual previews **strictly reusing the approved `tokens.css` & `styles.css`** (zero token re-creation) and capture **full-page screenshots on Desktop (`1440x900`) and Mobile (`390x844`) via `playwright-cli`**.
     3. Present the outline + screenshots to the user and **STOP for explicit approval** before touching Bricks Templates or Pages.
3. **Stage 2 (WordPress 7-Plugin Foundation & Shared Templates — Run ONCE):** Execute Stage 2.0/2.1 (7-Plugin Mandatory Config + Proof-of-State), Gate 2.2 (JetEngine Data Model Approval), Step 2.3 (8 demo items/type + Media Library Media IDs), and Step 2.4 (Header/Footer Menu Approval -> WP Native Menus + Bricks Global Templates matching approved Gate 1B screenshots).
4. **Stage 3 (Homepage & Bespoke Inner Pages — Reuse Only):** Assemble Homepage and approved inner pages (`About`, `Services`, `Contact` with mandatory Contact Form) directly on Bricks Staging in `draft` status strictly reusing Stage 2 Components, BEM Global Classes, ACSS tokens, Media IDs, and approved JetEngine bindings. Configure **SureRank** SEO/Schema per page.
5. **Stage 4 (Batched Bounded Verification & Handoff — Run ONCE for Whole Site):**
   * Cross-check built pages against the **Novamira Design** record and Gate 1B screenshots: **enforce zero off-palette colors** (scan computed `color`, `backgroundColor`, `borderColor` and Bricks CSS for any rogue hex/rgb or unapproved default ACSS color slot), catch hardcoded pixel/rem values, unrequested `border-radius`/borders/shadows, bare/stripped-down templates, or AI-slop repetition.
   * Inspect **Homepage + representative sub-pages/Archive/Single on desktop (`1440x900`) + mobile (`390x844`) together in one batched round** using **`playwright-cli`** (`open`, `resize`, `screenshot`, `console error`, `eval` for computed ACSS tokens, **off-palette color audit**, horizontal overflow, broken images, Mobile Menu drawer open/close, Contact & Newsletter Form submission, and `dataLayer` events, `close`). Fix all findings in one batch, confirm with **at most one more round**, and stop.
   * Verify single `<h1>`, heading hierarchy, **SureRank** metadata/Schema, Form Submission Storage & ASE SMTP, then enable **Strict Editor View** in Advanced Themer for client roles before handoff.

## 4. Steering Vocabulary (On-Demand Refinement Verbs)

When refining an existing Bricks page or section, respond accurately to these targeted directives:

* `critique`: Subjective art-director & UX review (visual hierarchy, pacing, cognitive load, generic AI tells).
* `audit`: Objective technical check (accessibility, contrast, responsive overflow, ACSS token compliance, Core Web Vitals).
* `polish`: Final precision pass tightening spacing, alignment, states, and micro-details within current tokens.
* `bolder` / `quieter`: Push visual contrast and hierarchy higher when bland, or dial back visual noise when cluttered.
* `distill` / `clarify`: Strip redundant elements/cards to essentials, or sharpen headlines, button labels, and form error copy.

## 5. Visual Richness Floor & Quantitative UX Quality Floor (Pre-Ship Checklist)

* **Visual Richness Floor (Anti-Skeleton Template Mandate):**
  * Never ship bare, text-only sub-pages or Archive/Single templates. Every inner page and dynamic template must carry the same craft density as the approved Homepage:
    * **Cohesive SVG Iconography:** Single SVG icon family with uniform `stroke-width` site-wide (uploaded to WP Media Library via ASE SVG Sanitize or native Bricks SVG — never mixed icon libraries, never emoji placeholders).
    * **Cohesive Media (Media IDs Only):** Real/demo images matching the approved palette & consistent `aspect-ratio` uploaded to **WordPress Media Library** (attached as **Media ID** — zero external hotlinks).
    * **Clear Visual Hierarchy:** Structured eyebrow/category badges, metadata rows, scannable scannability blocks, hover/focus states, and intentional ACSS spacing rhythm.
* **Contrast & Readability:** Text contrast `>= 4.5:1` (`>= 3:1` for large text); mobile body font `>= 16px` (prevents iOS auto-zoom); desktop body line length `60–75ch` (`35–60ch` on mobile).
* **Touch & Responsive Stability:** Interactive touch targets `>= 44x44px` with `>= 8px` gap; use `min-height: 100dvh` (never `100vh`) on full-height Heroes to prevent iOS Safari address-bar jump; zero horizontal scroll on mobile.
* **Motion & Core Web Vitals:** Base UI transitions `150–300ms` respecting `prefers-reduced-motion`; WebP/AVIF images with explicit `width`/`height` (and `loading="eager"` + `fetchpriority="high"` on hero LCP) to keep `CLS < 0.1`.

## 6. Mode A — Standalone Bricks-Ready FE Demo (Pre-WordPress) & 1-to-1 Handoff

Use **Mode A** for both the Homepage (Gate 1) and Sub-Pages / Dynamic Template Previews (Gate 1B) before building in Bricks:

### 6.1. Standalone Demo Structure & Rules
* **Clean Static Bundle:** Output pure semantic HTML5 + CSS + lightweight vanilla JS (`index.html`, sub-page/template preview HTMLs, `tokens.css`, `styles.css`, `main.js`, `design-system.json`). **Never use Tailwind, Bootstrap, or React** so styles map 1-to-1 to Bricks + ACSS.
* **ACSS-Mirror Tokens (`tokens.css` + DTCG `design-system.json`):** Define `:root` variables using exact **Automatic.css** token names (`--primary`, `--secondary`, `--accent`, `--base`, `--neutral`, `--space-xs`..`--space-xxl`, `--section-space-*`, `--text-*`, `--h1`..`--h6`, `--radius-*`, `--content-width`), plus a DTCG-compatible `design-system.json` ready for direct import into **Novamira Design**.
* **Bricks-Ready DOM & BEM:** Build every section using Bricks' native hierarchy (`section` > `.container` > `.grid--*` / `.block`) and 1-level **BEM Global Classes** (`.service-card`, `.service-card__title`, `.service-card--featured`) consuming only `var(--*)` ACSS tokens.
* **Handoff Annotations:** Mark reusable blocks and dynamic loops directly in HTML comments:
  * `<!-- [BRICKS-COMPONENT: service-card] -->`
  * `<!-- [JETENGINE-LOOP: cpt=services] -->`
  * `<!-- [BRICKS-TEMPLATE: header / footer / archive / single] -->`
* **Apply Full Quality Controls:** Run Phase 0, Bounded Verification using **`playwright-cli`** (desktop `1440x900` + mobile `390x844` screenshots, `console error`, horizontal overflow check), and Section 5 floors before sending previews to the user/client.

### 6.2. Converting Approved Mode A Demo -> Mode B (WordPress + MCP Novamira Pro)
1. **Sync Design Tokens & Fidelity Lock:** Inspect the approved demo's exact computed styles (`border-radius`, `border`, `box-shadow`, `background`, `padding`, font sizes) and import `design-system.json` into **Novamira Design**, mirror `tokens.css` values into **ACSS** + Bricks Theme Styles (verifying regenerated CSS on frontend), and save explicit visual constraints (e.g., *"sharp 0px corners on all images/sections, no card borders/shadows, Lucide 1.5px icon family"*) into **Novamira Memories**.
2. **Map 1-to-1 to Bricks, Native Menus & JetEngine:** Convert each `<!-- [BRICKS-COMPONENT] -->` block into a native Bricks Component (with Properties), bind Header/Footer menus strictly to **Appearance > Menus**, register exact **BEM Global Classes** (preserving exact corner radius, flat/borderless surfaces, icons, and Media IDs), wire approved **JetEngine** queries, and include mandatory Contact & Newsletter Forms.
3. **Finalize & Handoff:** Configure **SureRank** SEO/Schema, regenerate ACSS & Bricks CSS + flush caches, run Bounded Verification on staging, and enable Advanced Themer **Strict Editor View** for client delivery.
