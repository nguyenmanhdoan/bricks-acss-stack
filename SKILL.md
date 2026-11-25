---
name: bricks-acss-stack
description: >-
  Use this skill whenever designing, building, auditing, or modifying WordPress
  websites built with Bricks Builder, Automatic.css (ACSS), Advanced Themer (AT),
  Admin and Site Enhancements (ASE), JetEngine, SureRank SEO, and optional
  BricksForge/BricksExtras via Novamira Pro (`novamira` CLI on Antigravity or
  MCP OAuth), OR when creating a standalone Bricks-ready FE Demo / static
  HTML-CSS-JS prototype (with ACSS-mirror tokens and BEM) for client approval
  prior to WordPress deployment. Enforces a sequential 4-stage production
  pipeline with mandatory visual approval gates for both Homepage and
  sub-pages/templates, 7-plugin configuration verification, native WordPress
  menu standards, mandatory Contact/Newsletter forms, and anti-overengineering
  JetEngine governance.
---

# Bricks Builder + ACSS + AT + ASE + JetEngine + SureRank Stack (via Novamira Pro)

Follow this **linear 4-stage production workflow** via **Novamira Pro** (**`novamira` CLI** on Google Antigravity, or MCP OAuth on MCP-connected clients). **Detect the project's current stage first** and execute only that stage — **NEVER restart Stage 1 (Design System creation) or Stage 2 when building inner/sub-pages.**

## Mandatory Approval & Step-Gate Governance (Anti-Runaway Rule)

Never execute large multi-step builds blindly without user sign-off:

1. **Master Plan Approval First:** Before executing any project, present the **overall roadmap & step breakdown** (target pages, data architecture, milestones) and **WAIT for user confirmation** before writing code or mutating WordPress.
2. **Pre-Design Info & Visual Approval (Homepage + Sub-Pages/Templates):**
   - **Homepage Demo:** Confirm Design Read, 3 Dials, palette/typography, and Homepage section outline before building.
   - **Sub-Pages & Dynamic Templates (Mandatory Visual Gate — Never Skip):** Before building ANY inner page (`About`, `Services`, `Contact`, etc.) or Dynamic Template (`Archive`, `Single`, `404`) in Bricks, you MUST present: (a) **Sitemap & detailed Section Outline** (sections, layout, icon/image needs, dynamic bindings, CTA), AND (b) **Visual Preview Screenshots** (static HTML/CSS preview reusing approved `tokens.css` & `styles.css`, captured full-page Desktop `1440x900` + Mobile `390x844` via `playwright-cli`) and **WAIT for user sign-off**.
3. **Chunked Execution — Done Before Next:** Execute in discrete atomic gates (`2.1 7-Plugin Stack Config + Proof-of-State` -> `2.2 JetEngine Data Model Approval & Build` -> `2.3 Seed 8 Demo Items/Type + Media IDs` -> `2.4 Menu Approval + Shared Bricks Templates/Components` -> `3.1 Homepage` -> `3.2 Inner Pages` -> `4.1 QA & Handoff`). Report concise results + proof after each gate and **WAIT for user confirmation** before proceeding.

## Sequential 4-Stage Production Pipeline

### Stage 1 — Brief, Homepage FE Demo & Sub-Page Visual Previews (Pre-WordPress)
* **Primary Design Skill Delegation (Mandatory):** At Stage 1 and Gate 1B, **automatically invoke and follow the `agency-web-design` skill** (`industry-archetypes.md`, `typography-and-color-vn.md`, `anti-slop-and-composition.md`, `critique-and-polish.md`, `bricks-acss-handoff.md`) as the primary design engine. Use [novamira-design-workflow.md](./references/novamira-design-workflow.md) to align Stage 1 deliverables with Stage 2–4 WordPress & Novamira Pro handoff.
* **Actions:**
  1. Run **Phase 0 once for the whole project** via `agency-web-design` (1-line Design Read, Archetype & Industry Blueprint, Surface Modes per page type, 3 Dials, Vietnamese-safe typography, 60-30-10 ACSS palette, single cohesive SVG icon family, and non-repeating section composition plan + full sitemap).
  2. Build a standalone Bricks-ready static Homepage FE Demo (`DESIGN.md`, `index.html`, `tokens.css` mirroring ACSS variables, `styles.css` with 1-level BEM classes, `main.js`, DTCG `design-system.json`). Never use Tailwind/Bootstrap/React.
  3. Annotate reusable blocks and dynamic loops (`<!-- [BRICKS-COMPONENT: name] -->`, `<!-- [JETENGINE-LOOP: cpt=slug] -->`, `<!-- [BRICKS-TEMPLATE: name] -->`).
  4. Run the `agency-web-design` 5-dimension Art Director self-critique and verify visually with `playwright-cli` (`1440x900` + `390x844`).
* **GATE 1 (Homepage Sign-Off):** Present the Homepage FE Demo and **STOP for user/client sign-off**.
* **GATE 1B (Mandatory Sub-Page & Dynamic Template Visual Sign-Off):** Once Homepage is approved, before building sub-pages or Archive/Single templates in WordPress, present the **Sitemap + Section Outlines** and extend the static preview using `agency-web-design` (strictly reusing the approved `tokens.css` & `styles.css` — never re-initializing the design system) to capture Desktop & Mobile screenshots of key inner pages (`About`, `Services`, `Contact`) and representative `Archive` / `Single` layouts. **STOP for user sign-off** before building Bricks templates.

### Stage 2 — WordPress Site Foundation (Run ONCE per Project via Novamira Pro)
* **2.0 Initial Bootstrap (Human vs. Agent Split):** Human installs/activates plugins + licenses, connects site via **`novamira` CLI** (`novamira auth` / `novamira sites` on Antigravity) or MCP OAuth, enables required **Abilities Hub** groups (Bricks Specialization, Novamira Design, Memories, Site Skills, WP-CLI), and turns **Read Mode OFF** on Staging (see [novamira-pro-ops.md](./references/novamira-pro-ops.md)).
* **2.1 Mandatory 7-Plugin Stack Configuration Gate + Proof-of-State (Hard Stop):** Configure and verify ALL 7 core plugins BEFORE creating data or pages:
  1. **NOVAMIRA:** Update all 3 pillars — **Novamira Design** (`design-system.json`), **Novamira Memories** (stack config, breakpoints, ACSS tokens, icon family, BEM prefixes, visual fidelity rules), and **Novamira Site Skills** (project rules if enabled).
  2. **BRICKS:** `Cascade layer: ON`, `CSS loading method: External Files`, Theme Styles, container width matching ACSS, verify Child Theme.
  3. **ACSS:** Apply exact Website Width, Root Font Size, Brand Palette, Typography, Spacing, and Radius defaults from approved Demo. *(Hard Stop: if direct write is unsafe, output exact JSON/values, pause for user import, and verify regenerated CSS via `playwright-cli` `getComputedStyle` on `--primary` / `--content-width`).*
  4. **AT (Advanced Themer):** **DISABLE AT Framework completely** (no AT Colors/Typography/Spacing/Dark Mode conflict with ACSS); **ENABLE productivity tools** (BEM Generator, Variable Picker synced with ACSS, Superpower CSS, Class Manager, ID Lock). *(Same Hard Stop if manual import is required).*
  5. **ASE (Admin and Site Enhancements):** Configure baseline hardening & media controls (disable XML-RPC, hide WP version, enable SVG Upload with sanitize, Image Upload Control, disable Comments if unused, check SMTP).
  6. **SURERANK:** Configure Global Title/Meta patterns, OG defaults, XML Sitemap, Organization/LocalBusiness Schema, and disable duplicate schema in other plugins.
  7. **WordPress Core Basics:** Permalink `Post name`, Reading Settings, Timezone/Locale (see [wordpress-core-standards.md](./references/wordpress-core-standards.md)).
  * **Proof-of-State Mandate:** Report verified read-back values/IDs and frontend CSS token check before moving to Step 2.2.
* **2.2 JetEngine Data Layer (Approval Gate — Anti-Overengineering):**
  * Present a **Data Model Proposal Table** (`Entity -> WordPress Core vs. JetEngine -> Reason`) and **WAIT for user approval** before creating anything.
  * Follow the **Minimalist Decision Matrix** in [bricks-addons-and-jetengine.md](./references/bricks-addons-and-jetengine.md): use WordPress core (`Posts`, `Pages`, `Appearance > Menus`) whenever sufficient; limit JetEngine Options Page to **at most 1 tabbed Global Brand Info page**; create CPT/CCT/Relations/Glossaries ONLY when genuinely justified.
* **2.3 Seed Cohesive Demo Content (8 Items/Type + Media IDs):** Populate **8 realistic sample items per active dynamic type** using [humanize-copy.md](./references/humanize-copy.md) (zero Lorem Ipsum) with cohesive images uploaded to **WordPress Media Library (Media IDs)** — zero external hotlinks.
* **2.4 Menu Approval & Shared Bricks Templates/Components:**
  * **Propose Header & Footer Menu trees** tailored to the website topic and **WAIT for user confirmation**.
  * Create real WordPress menus in **Appearance > Menus** and assign Menu Locations.
  * Build Global Templates (`Header`, `Footer`, `Blog/CPT Archive`, `Single`, `404`) and reusable **Bricks Components** strictly matching approved Gate 1B screenshots (including **WP Native Menu** in Header/Footer and mandatory **Newsletter Form** in Footer).

### Stage 3 — Multi-Page Implementation (Reuse Only — NO Loop Reset)
* **Strict Anti-Loop Rule:** Never re-run Phase 0 or recreate design tokens/global classes per sub-page.
* Build Homepage and approved bespoke inner pages (`About`, `Services`, `Contact` with mandatory **Contact Form**) on Bricks Staging in `draft` status by **reusing** Stage 2 Components, BEM Global Classes, ACSS tokens, Media IDs, and approved JetEngine bindings.
* Configure **SureRank** SEO metadata and Schema per page.

### Stage 4 — Batch QA Verification & Client Handoff (Run ONCE for Whole Site)
1. Regenerate ACSS & Bricks CSS and flush all WordPress/page/object caches via MCP Novamira Pro.
2. Run **one batched Bounded Verification Pass** using `playwright-cli` on Desktop (`1440x900`) and Mobile (`390x844`) across Homepage + representative sub-pages/Archive/Single: verify computed ACSS tokens, visual richness (icons/Media IDs loaded), **Mobile Menu drawer open/close**, **Contact Form & Newsletter Form submission**, `console error`, horizontal overflow, and UX Quality Floor (`4.5:1`, `44x44px`, `100dvh`, `CLS < 0.1`).
3. Verify Form Submission Storage & ASE SMTP readiness; enable Advanced Themer **Strict Editor View** for client roles.
4. Update **Novamira Memories** with final IDs, recommend **Novamira Read Mode ON** for production handoff, and report exact modified IDs.

## Hard Guardrails (All Stages)

* **Zero Off-Palette Colors (Strict Design System & Palette Lock):** Every color on the site (backgrounds, surfaces, text, headings, buttons, hover/focus states, badges, borders, overlays, gradients, SVG `fill`/`stroke`) **MUST** belong strictly to the approved concept palette locked in `design-system.json` / **Novamira Design** / **ACSS** + **Novamira Memories**.
  * **FORBIDDEN:** Introducing any color outside the approved concept — including raw hardcoded hex/rgb/hsl/named colors, decorative gradients, or unused default ACSS color slots (e.g., default ACSS blue/purple `--secondary` or `--accent` when not part of the approved concept).
  * **Mandatory Check:** Always reference approved ACSS color variables (`var(--*)` / `currentColor` for SVGs) and run an off-palette computed-color check (`color`, `backgroundColor`, `borderColor`) via `playwright-cli` before marking any build step done.
* **Strict Demo Fidelity + Visual Richness Floor:** Once Demo & Gate 1B previews are approved, match exact visual grammar (`border-radius`, `border`, `box-shadow`, surfaces — zero invented AI card polish) AND never build bare text-only sub-pages/templates. Every page/template must use the project's single cohesive SVG icon family and Media Library images (**Media IDs only — zero external hotlinks**).
* **WordPress Native Menu Mandate:** ALL Header and Footer navigation menus MUST be created in **Appearance > Menus** and rendered via Bricks `Nav Menu` / `Nav Nestable` (bound to WP Menu) / `WP Menu`, sharing **one Primary Menu** across Desktop and Mobile Drawer. **NEVER hardcode menus using standalone `Text Link` elements.**
* **Mandatory Functional Forms:** **Contact Page** MUST include a working Contact Form; **Footer** MUST include a working Newsletter Form — both with validation, Honeypot/Turnstile spam protection, and Submission Storage (Bricks/BricksForge Submissions or JetEngine CCT).
* **7-Plugin Mandatory Config & Anti-Overengineering JetEngine:** Never skip ACSS, AT, ASE, SureRank, or Novamira (`Design` + `Memories` + `Site Skills`) configuration; never create unnecessary JetEngine CPT/CCT/Relations/Options when WordPress core suffices.
* **Semantic Bricks DOM & ACSS + BEM:** Native Bricks elements (`section` > `container` > `block`), ACSS tokens (`var(--space-m)`, `var(--primary)`), 1-level BEM Global Classes (never `#id` styling, never Tailwind, never `!important` fighting `@layer bricks`).

## Reference Library (Load Only What Current Stage Needs)

* **Primary Stage 1 & Gate 1B Design Engine (Companion Skill):** Always load `agency-web-design` (multi-industry archetypes, Vietnamese-safe typography, 12-pattern anti-AI-slop composition, Art Director critique & Bricks/ACSS handoff spec) whenever executing Stage 1 or Gate 1B.
* Stage 1 & Gate 1B WordPress/Novamira Alignment (Design Read, 3 Dials, Sub-page Previews, Visual Richness Floor, `playwright-cli` QA): [novamira-design-workflow.md](./references/novamira-design-workflow.md)
* Stage 2–4 Novamira Pro (`novamira` CLI on Antigravity / MCP OAuth) & 7-Plugin Configuration Gate + Proof-of-State: [novamira-pro-ops.md](./references/novamira-pro-ops.md)
* WordPress Core Standards (Appearance > Menus, ASE Baseline, Media Hygiene, `wp-wpcli-and-ops` / `wp-performance` synergy): [wordpress-core-standards.md](./references/wordpress-core-standards.md)
* Bricks Builder core architecture (Components, Cascade Layers, Interactions, Query Loop, `{echo:}` allowlist, Code Signatures): [bricks-academy-core.md](./references/bricks-academy-core.md)
* ACSS tokens, BEM conventions, Advanced Themer setup & Strict Editor View: [acss-and-bem.md](./references/acss-and-bem.md)
* JetEngine Decision Matrix (Anti-Overengineering), Mandatory Forms & optional BricksForge/BricksExtras: [bricks-addons-and-jetengine.md](./references/bricks-addons-and-jetengine.md)
* SureRank SEO & Schema standards: [surerank-seo.md](./references/surerank-seo.md)
* Humanize copy (anti-AI prose) & 8-item demo content seeding standard: [humanize-copy.md](./references/humanize-copy.md)
