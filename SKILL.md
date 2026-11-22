---
name: bricks-acss-stack
description: >-
  Use this skill whenever designing, building, auditing, or modifying WordPress
  websites built with Bricks Builder, Automatic.css (ACSS), Advanced Themer,
  BricksForge, BricksExtras, JetEngine, and SureRank SEO via MCP Novamira Pro,
  OR when creating a standalone Bricks-ready FE Demo / static HTML-CSS-JS
  prototype (with ACSS-mirror tokens and BEM) for client approval prior to
  WordPress deployment. Enforces a single sequential 4-stage production
  pipeline (FE Demo -> Foundation Once -> All Pages Reuse -> Batch QA & Handoff)
  without restarting the workflow on inner pages.
---

# Bricks Builder + ACSS + JetEngine + SureRank Stack (Sequential 4-Stage Pipeline)

Follow this **linear 4-stage production workflow** from start to finish. **Detect the project's current stage first** and execute only that stage — **NEVER restart Stage 1 or Stage 2 when building inner/sub-pages.**

## Sequential 4-Stage Production Pipeline

### Stage 1 — Brief & Standalone FE Demo (Pre-WordPress)
* **When:** Starting from a client brief or designing a visual prototype before WordPress setup.
* **Actions:**
  1. Run **Phase 0 once for the whole project** (1-line Design Read, Surface Modes per page type, 3 Dials, and sitemap).
  2. Build a standalone Bricks-ready static FE Demo (`index.html`, `tokens.css` mirroring ACSS variables, `styles.css` with 1-level BEM classes, `main.js`, DTCG `design-system.json`) covering the Homepage + key layout patterns. Never use Tailwind/Bootstrap.
  3. Annotate reusable blocks and dynamic loops (`<!-- [BRICKS-COMPONENT: name] -->`, `<!-- [JETENGINE-LOOP: cpt=slug] -->`).
  4. Quick visual check with `playwright-cli` (`1440x900` + `390x844`).
* **GATE 1 (Mandatory Stop):** Present the FE Demo and **STOP for user/client sign-off** before moving to Stage 2. If revisions are requested, refine the demo in place using steering verbs (`critique`, `polish`, `bolder`, `quieter`) — do not jump to WordPress yet.

### Stage 2 — WordPress Site Foundation (Run ONCE per Project via MCP Novamira Pro)
* **When:** After FE Demo is approved (or starting directly on an existing WordPress Staging site).
* **Actions:**
  1. **Novamira Pro Read-First Gate:** Read **Novamira Memories**, inspect Abilities Hub, verify core stack (**Bricks, ACSS, Advanced Themer, JetEngine, SureRank**) and check whether optional add-ons (**BricksForge**, **BricksExtras**) are active.
  2. **Lock Design System Once:** Import `design-system.json` into **Novamira Design**, mirror `tokens.css` into **ACSS** + Bricks Theme Styles (keep Advanced Themer Framework disabled), and save conventions in **Novamira Memories**.
  3. **Build Complete JetEngine Data Layer Once:**
     - **Options Page (tabbed):** Brand/Logo (Media ID), Global Info (hotline, address, social, shared CTAs), and centralized static content (title, subtitle, description, main images as Media ID) for Homepage & shared sections.
     - **Page Meta Boxes** (if >5–10 static pages) + **CPTs, CCTs, Taxonomies, Relations, Glossaries, and Query Builder queries** for all growing/dynamic data.
  4. **Build Shared Bricks System Once:** Create Global Templates (Header, Footer, Single, Archive, 404), reusable **Bricks Components** (with Properties), and **BEM Global Classes** using Novamira Pro's native Bricks Specialization abilities.

### Stage 3 — Multi-Page Implementation (Reuse Only — NO Loop Reset)
* **When:** Foundation (Stage 2) is ready and building the Homepage + all inner/sub-pages.
* **Strict Anti-Loop Rule:** **DO NOT re-run Stage 1 (Design Read / token creation) or recreate global classes/components per sub-page.**
* **Actions:**
  1. Assemble Homepage and all sub-pages in `draft` status by **reusing** Stage 2 Bricks Components, BEM Global Classes, ACSS tokens, and JetEngine Options Page / Meta Box / Query Loop bindings.
  2. Configure **SureRank** SEO metadata and Schema (single JSON-LD source; never duplicate schema).

### Stage 4 — Batch QA Verification & Client Handoff (Run ONCE for the Whole Site)
* **When:** All target pages are implemented and ready for QA/delivery.
* **Actions:**
  1. Regenerate Bricks CSS and flush all WordPress/page/object caches via Novamira Pro.
  2. Run **one batched Bounded Verification Pass** using `playwright-cli` across Homepage + representative sub-pages/Single/Archive on Desktop (`1440x900`) and Mobile (`390x844`): check layout, `console error`, horizontal overflow, UX Quality Floor (`4.5:1`, `44x44px`, `100dvh`, `CLS < 0.1`), and form/tracking `dataLayer`. Fix all findings in one batch, confirm with at most one more round, and stop.
  3. Enable Advanced Themer **Strict Editor View** for client roles (lock ACSS/BEM classes and complex Bricks panels so clients safely edit content via JetEngine Options Page / Meta Boxes / Component Properties).
  4. Recommend **Novamira Read Mode ON** for production handoff and report exact modified IDs.

## Hard Guardrails (All Stages)

* **Semantic Bricks DOM & ACSS + BEM:** Native Bricks elements (`section` > `container` > `block`), ACSS tokens (`var(--space-m)`, `var(--primary)`), BEM on Global Classes (never `#id` styling, never Tailwind, never `!important` fighting `@layer bricks`).
* **Native Tooling Priority:** Core stack (100% of projects): Bricks + ACSS + Advanced Themer + **JetEngine** + **SureRank** via **MCP Novamira Pro**. Optional add-ons (**BricksForge**, **BricksExtras**): verify active via Novamira Pro first; otherwise use native Bricks elements.

## Reference Library (Load Only What Current Stage Needs)

* Stage 1 (FE Demo, Design Read, 3 Dials, Surface Modes, Steering Verbs, UX Quality Floor, `playwright-cli` QA): [novamira-design-workflow.md](./references/novamira-design-workflow.md)
* Stage 2–4 MCP Novamira Pro operations (Abilities Hub, Bricks Specialization, Read Mode, Memories, WP-CLI, cache): [novamira-pro-ops.md](./references/novamira-pro-ops.md)
* Bricks Builder core architecture (Components & Properties, Cascade Layers, Interactions, Query Loop, `{echo:}` allowlist, Code Signatures): [bricks-academy-core.md](./references/bricks-academy-core.md)
* ACSS tokens, BEM conventions, Advanced Themer setup & Strict Editor View: [acss-and-bem.md](./references/acss-and-bem.md)
* JetEngine (100% core: Options Page, CPT, CCT, Relations, Query Builder) & optional BricksForge/BricksExtras: [bricks-addons-and-jetengine.md](./references/bricks-addons-and-jetengine.md)
* SureRank SEO & Schema standards: [surerank-seo.md](./references/surerank-seo.md)
