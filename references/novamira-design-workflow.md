# Novamira Design & Anti-AI-Slop Website Creation Workflow

Aligned with **Novamira Design** (`novamira.ai/docs/`, Novamira 1.10.0+) and distilled craft standards (Design Read, Quantitative Dials, Surface Modes, Bounded Verification, and Measurable UX Floor) adapted strictly for **WordPress + Bricks Builder + ACSS + JetEngine + SureRank**.

## 1. Phase 0 — Brief Inference Before Any Build

Never jump straight into building sections with default LLM aesthetics. Establish four quick decisions first:

* **One-Line Design Read:** State a single concise line before creating tokens or layouts:
  *"Reading this as: `<page kind>` for `<audience>`, in `<Surface Mode>` mode, with a `<vibe>` visual language."*
  Ask at most **one** clarifying question only when the brief genuinely diverges; if clear from context, proceed.
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

## 3. Five-Step Build & Bounded Verification Workflow

1. **Step 1 — Lock Art Direction & Tokens:** Complete Phase 0 (Design Read, Surface Mode, 3 Dials), write the **Novamira Design** record, sync tokens into **ACSS** + Bricks Theme Styles, and save a summary in **Novamira Memories**.
2. **Step 2 — Component-First Foundation:** Never dump an entire multi-section page monolithically. Build reusable **Bricks Components** (with Properties) and **BEM Global Classes** first (Header, Footer, Buttons, Card variants, Proof/Testimonial block, CTA banner) styled strictly with ACSS variables.
3. **Step 3 — Section-by-Section Build in Draft Mode:** Assemble pages section by section in `draft` status, matching the 3 Dials and Surface Mode, using clean semantic DOM (`section` > `container` > `block`) and binding real **JetEngine** dynamic data early instead of Lorem Ipsum.
4. **Step 4 — Bounded Verification Pass (No Infinite Polish Loops):**
   * Cross-check built pages against the **Novamira Design** record (catch off-palette colors, hardcoded pixel/rem values, font drift, or AI-slop repetition).
   * Inspect **desktop (`1440x900`) + mobile (`390x844`) together in one batched round** using **`playwright-cli`** (preferred for token efficiency: `open`, `resize`, `screenshot`, `console error`, `eval` for horizontal overflow/broken images/dataLayer events, `close`), or via Novamira Visual / Chrome DevTools. Fix all findings in one batch, confirm with **at most one more round**, and stop.
5. **Step 5 — SEO & Client Handoff:** Verify single `<h1>`, heading hierarchy, and **SureRank** metadata/Schema, then enable **Strict Editor View** in Advanced Themer for client roles before handoff.

## 4. Steering Vocabulary (On-Demand Refinement Verbs)

When refining an existing Bricks page or section, respond accurately to these targeted directives:

* `critique`: Subjective art-director & UX review (visual hierarchy, pacing, cognitive load, generic AI tells).
* `audit`: Objective technical check (accessibility, contrast, responsive overflow, ACSS token compliance, Core Web Vitals).
* `polish`: Final precision pass tightening spacing, alignment, states, and micro-details within current tokens.
* `bolder` / `quieter`: Push visual contrast and hierarchy higher when bland, or dial back visual noise when cluttered.
* `distill` / `clarify`: Strip redundant elements/cards to essentials, or sharpen headlines, button labels, and form error copy.

## 5. Quantitative UX & Craft Quality Floor (Pre-Ship Checklist)

* **Contrast & Readability:** Text contrast `>= 4.5:1` (`>= 3:1` for large text); mobile body font `>= 16px` (prevents iOS auto-zoom); desktop body line length `60–75ch` (`35–60ch` on mobile).
* **Touch & Responsive Stability:** Interactive touch targets `>= 44x44px` with `>= 8px` gap; use `min-height: 100dvh` (never `100vh`) on full-height Heroes to prevent iOS Safari address-bar jump; zero horizontal scroll on mobile.
* **Icons, Motion & Core Web Vitals:** Single cohesive SVG icon family with uniform `strokeWidth` site-wide; base UI transitions `150–300ms` respecting `prefers-reduced-motion`; WebP/AVIF images with explicit `width`/`height` (and `loading="eager"` + `fetchpriority="high"` on hero LCP) to keep `CLS < 0.1`.

## 6. Mode A — Standalone Bricks-Ready FE Demo (Pre-WordPress) & 1-to-1 Handoff

Use **Mode A** when pitching or getting client visual approval before setting up WordPress and MCP Novamira Pro. Every demo must be engineered for zero-rewrite handoff into Bricks + ACSS:

### 6.1. Standalone Demo Structure & Rules
* **Clean Static Bundle:** Output pure semantic HTML5 + CSS + lightweight vanilla JS (e.g., `index.html`, `tokens.css`, `styles.css`, `main.js`, `design-system.json`). **Never use Tailwind, Bootstrap, or React** so styles map 1-to-1 to Bricks + ACSS.
* **ACSS-Mirror Tokens (`tokens.css` + DTCG `design-system.json`):** Define `:root` variables using exact **Automatic.css** token names (`--primary`, `--secondary`, `--accent`, `--base`, `--neutral`, `--space-xs`..`--space-xxl`, `--section-space-*`, `--text-*`, `--h1`..`--h6`, `--radius-*`, `--content-width`), plus a DTCG-compatible `design-system.json` ready for direct import into **Novamira Design**.
* **Bricks-Ready DOM & BEM:** Build every section using Bricks' native hierarchy (`section` > `.container` > `.grid--*` / `.block`) and 1-level **BEM Global Classes** (`.service-card`, `.service-card__title`, `.service-card--featured`) consuming only `var(--*)` ACSS tokens.
* **Handoff Annotations:** Mark reusable blocks and dynamic loops directly in HTML comments:
  * `<!-- [BRICKS-COMPONENT: service-card] -->`
  * `<!-- [JETENGINE-LOOP: cpt=services] -->`
  * `<!-- [BRICKS-TEMPLATE: header / footer] -->`
* **Apply Full Quality Controls:** Run Phase 0 (Design Read, Surface Mode, 3 Dials), Bounded Verification using **`playwright-cli`** (desktop `1440x900` + mobile `390x844` screenshots, `console error`, horizontal overflow check), and the Section 5 UX Quality Floor before sending the preview to the client.

### 6.2. Converting Approved Mode A Demo -> Mode B (WordPress + Novamira Pro)
1. **Sync Design Tokens:** Import `design-system.json` into **Novamira Design**, mirror `tokens.css` values into **ACSS** + Bricks Theme Styles, and save the summary in **Novamira Memories**.
2. **Map 1-to-1 to Bricks & JetEngine:** Convert each `<!-- [BRICKS-COMPONENT] -->` block into a native Bricks Component (with Properties), register the exact **BEM Global Classes** (whose ACSS `var(--*)` rules work unchanged), and wire `<!-- [JETENGINE-LOOP] -->` sections to JetEngine CPTs/CCTs and Query Builder.
3. **Finalize & Handoff:** Configure **SureRank** SEO/Schema, flush Bricks CSS/site caches, run Bounded Verification on staging, and enable Advanced Themer **Strict Editor View** for client delivery.
