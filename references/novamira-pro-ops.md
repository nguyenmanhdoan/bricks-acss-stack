# MCP Novamira Pro (OAuth) — Official Operations & 7-Plugin Stack Protocol

Aligned with official documentation (`novamira.ai/docs/`). **MCP Novamira Pro (OAuth)** is the primary site-wide execution engine for the entire WordPress installation — spanning **Novamira**, **Bricks Builder**, **Automatic.css (ACSS)**, **Advanced Themer (AT)**, **Admin and Site Enhancements (ASE)**, **JetEngine**, **SureRank SEO**, optional add-ons (BricksForge, BricksExtras), WordPress core, database, filesystem, and WP-CLI.

## 0. Stage 2.0 & 2.1 — Mandatory 7-Plugin Configuration Gate + Proof-of-State

Immediately after setting up a Staging WordPress site and connecting **MCP Novamira Pro (OAuth)**, complete Stage 2.0 (Human) and Stage 2.1 (Agent) in full. **NEVER skip or leave plugins at default settings before building data or pages.**

### 0.1. Stage 2.0 — Human Prerequisite (~5 Minutes in `wp-admin`)
* **Install & License Plugins:** Install and activate Bricks Builder (+ Child Theme), Automatic.css (ACSS), Advanced Themer (AT), Admin and Site Enhancements (ASE), JetEngine, SureRank, Novamira + Novamira Pro (and optional BricksForge / BricksExtras if used), and enter commercial license keys.
* **Connect MCP (OAuth):** Authenticate the site via **MCP Novamira Pro OAuth** in Codex (ChatGPT Desktop) / Antigravity Desktop.
* **Configure Novamira Abilities Hub:** In `wp-admin > Novamira > Abilities Hub`, verify required groups are enabled (**Bricks Specialization**, **Novamira Design**, **Novamira Memories**, **Novamira Site Skills**, **WordPress / WP-CLI / Filesystem**) and ensure **Read Mode is OFF** on Staging (keep Read Mode ON for Production sites).

### 0.2. Stage 2.1 — Mandatory 7-Plugin Stack Configuration (Hard Gate)
Once connected via MCP Novamira Pro, the Agent MUST inspect, configure, and verify **ALL 7 core plugins** + WordPress Core Basics before proceeding to Step 2.2:

1. **NOVAMIRA (All 3 Pillars Required):**
   * **Novamira Design:** Write the complete project design record (`design-system.json`: Palette, Typography, Spacing, Border/Radius rules, Surface Modes, Guidance & Don'ts) from the approved Demo.
   * **Novamira Memories:** Save stack inventory (active plugins/versions), Website Width, Root Font Size, Breakpoints, ACSS tokens, single SVG icon family, BEM prefixes, visual fidelity constraints, and later Menu IDs / JetEngine schema / Page & Template IDs.
   * **Novamira Site Skills:** Update/sync site-specific rules and conventions into Novamira Site Skills (when enabled on the site) so every future session inherits exact project constraints.
2. **BRICKS BUILDER:**
   * Verify active **Bricks Child Theme**.
   * Configure `Cascade layer: ON`, `CSS loading method: External Files`, disable unused bloat, set Global Container Width matching ACSS, and configure **Theme Styles** (Body typography, Headings `h1`–`h6`, Links, Form inputs, Container & Section defaults).
3. **ACSS (Automatic.css) — HARD STOP RULE:**
   * Configure Website Width (`--content-width`), Root Font Size, Brand Palette (`--primary`, `--secondary`, `--accent`, `--base`, `--neutral`, `--shade`), Typography Scale & Font Families, Spacing Scale, and Radius/Border defaults to match the approved Demo 1-to-1.
   * **Hard Stop Mandate:** Never leave ACSS unconfigured at factory defaults. If the installed ACSS version stores serialized/complex UI options that cannot be safely written and recompiled via MCP, **STOP immediately**, output the exact ACSS import JSON (or exact dashboard settings table), ask the user to apply/save in ACSS, and **verify the regenerated CSS on the live frontend** before moving on.
4. **AT (Advanced Themer) — HARD STOP RULE:**
   * **MUST DISABLE AT Framework completely** (AT Global Colors, AT Fluid Typography/Spacing, AT Dark Mode, Container/Section overrides) so zero styles conflict with ACSS.
   * **MUST ENABLE AT Productivity Tools:** BEM Class Generator, Variable Picker synced with ACSS, Superpower CSS, Class Manager, ID Lock, Plain Classes / Quick Search.
   * **Hard Stop Mandate:** Apply the same stop-and-confirm rule as ACSS if manual import/toggle in AT dashboard is required — never leave AT unconfigured.
5. **ASE (Admin and Site Enhancements):**
   * Configure baseline modules per [wordpress-core-standards.md](./wordpress-core-standards.md): disable XML-RPC, hide WP version, **enable SVG Upload (with sanitization)**, **enable Image Upload Control**, disable Comments (if unused), cap revisions, clean Admin UI, and check **ASE SMTP** readiness.
6. **SURERANK SEO:**
   * Configure Global Title & Meta Description patterns, default OG/Social image, XML Sitemap (public post types ON, internal/utility types OFF), Organization/LocalBusiness Schema, and verify no duplicate JSON-LD schema is emitted by other plugins.
7. **JETENGINE (Readiness Only at 2.1 -> Approval Gate at 2.2):**
   * Verify JetEngine active modules (Options Pages, CPT, CCT, Relations, Query Builder, Glossaries) — **do NOT create any CPT/CCT/Options yet** until the user approves the Data Model Proposal Table at Gate 2.2.
8. **WordPress Core Basics:**
   * Verify Permalinks (`Post name`), Timezone, Site Language, and Staging search-engine visibility (`blog_public = 0`).

### 0.3. Proof-of-State Mandate (Required to Pass Gate 2.1)
Never report "configured" from memory alone. Before asking to proceed to Step 2.2, present a concise **Proof-of-State Verification Table** backed by real read-back evidence:
* Exact read-back status of all 7 plugins (`NOVAMIRA [Design/Memories/Skills]`, `BRICKS`, `ACSS`, `AT`, `ASE`, `SURERANK`, `JETENGINE`).
* Trigger ACSS & Bricks CSS regeneration + cache flush, then run a quick `playwright-cli` frontend `eval` check on computed CSS variables (e.g., `getComputedStyle(document.documentElement).getPropertyValue('--primary')` and `--content-width`) to prove ACSS tokens are actively compiled and loaded on the frontend.

## 1. Tool Selection Hierarchy (Use Native MCP Abilities First)

Always prefer the highest-level specialized ability exposed by MCP Novamira Pro before dropping down to raw primitives:

1. **Bricks Specialization Abilities (Highest Priority for Bricks):**
   * Always use dedicated Bricks abilities for **Pages**, **Templates & Display Conditions**, **Components (with properties/props)**, **Theme Styles**, **Global Classes**, **CSS Variables**, **Color Palettes**, **Dynamic Data bindings**, and **Global Settings**.
   * Never bypass Bricks abilities by injecting raw uneditable HTML or blindly mutating serialized Bricks postmeta via raw PHP/SQL.
2. **Novamira Design, Memories & Site Skills:**
   * At session start, read **Novamira Memories** and **Novamira Design** to load saved site architecture, Menu IDs, icon family, visual fidelity rules, and JetEngine schema.
   * After establishing or changing tokens, menus, schemas, or reusable Bricks components, immediately update **Novamira Memories** (and **Site Skills** when conventions change).
3. **WordPress Structured Abilities & WP-CLI:**
   * Use structured WP abilities (posts, terms, menus, options, transients, schemas) and **WP-CLI** (following `wp-wpcli-and-ops` best practices for menu creation, rewrite/cache flushes, and safe inspection).
4. **Filesystem Tools (`Read / Write / Edit / Delete / List`):**
   * Confined by default to `ABSPATH` (or custom `novamira_filesystem_base_dir` filter). Protected core paths (`wp-admin/`, `wp-includes/`, `wp-content/mu-plugins/`) cannot be recursively deleted.
5. **Raw PHP Execution & Direct `$wpdb` (Last Resort Only):**
   * Reserve strictly for inspecting/configuring plugins without dedicated abilities (e.g., reading live ACSS/AT/ASE/SureRank options) and always keep snippets minimal, idempotent, and backed up.

## 2. Environment & Read Mode Rules (Staging vs. Production)

* **Production Sites — Read Mode ON:**
  * Use Novamira Pro **Read Mode** on production sites for audits, inspecting Bricks templates/components/global classes, checking ACSS token consistency, auditing JetEngine fields, and reviewing SureRank SEO/Schema.
  * In Read Mode, write pathways (PHP execution, file editing, WP-CLI, Visual/Design writes) are withheld, while Bricks specialization reads, Memories, and read-only SQL remain available.
* **Development / Staging Sites — Full Build Mode:**
  * Perform all active page building, template refactoring, JetEngine schema creation, and code changes on **Development or Staging** with recent backups enabled.
  * Do not disable Crash Recovery / runtime safety limits when running PHP tasks.

## 3. Four-Phase Execution Workflow

1. **Discovery & Memory Load (Read-Only):**
   * Read **Novamira Memories**, **Novamira Design**, and discover available MCP abilities.
   * Verify installed/active plugins across all 7 core plugins (**Novamira, Bricks, ACSS, AT, ASE, SureRank, JetEngine**) plus optional add-ons (**BricksForge**, **BricksExtras**).
   * Inspect existing Bricks global classes, CSS variables, WP Menus, templates, components, and target post/CPT schemas before writing.
2. **Scoped & Reversible Writes:**
   * Build new pages or major layout changes in `draft` status, or duplicate an existing Bricks template before modifying a live one.
   * Build repeatable UI patterns as **Bricks Components** (with props) + **BEM Global Classes** rather than monolithic single-page JSON trees.
   * Never run destructive SQL (`DROP`, `TRUNCATE`, mass `DELETE`), bulk `wp search-replace`, or edits to `wp-config.php` / `.htaccess` without explicit user confirmation.
3. **CSS & Cache Flush:**
   * After editing Bricks pages, templates, global classes, Theme Styles, or ACSS settings, regenerate ACSS & Bricks CSS and flush active page/object caches (LiteSpeed, WP Rocket, FlyingPress, Redis, WP-CLI `wp cache flush`).
4. **Verification & Memory Update:**
   * Confirm HTTP 200 and check PHP error logs for warnings/fatals.
   * Run batched `playwright-cli` verification (Desktop `1440x900` + Mobile `390x844`, computed ACSS variables, Mobile Menu drawer, Contact & Newsletter Form submission, console errors, Core Web Vitals).
   * Update **Novamira Memories** with final Menu IDs, Components, Global Class conventions, and JetEngine schema, and report exact modified IDs to the user.
