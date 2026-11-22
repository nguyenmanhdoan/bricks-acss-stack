# MCP Novamira Pro — Official Operations & Bricks Specialization Protocol

Aligned with official documentation (`novamira.ai/docs/`). MCP Novamira Pro is the **site-wide execution engine for the entire WordPress installation** — spanning Bricks Builder, Automatic.css (ACSS), Advanced Themer, JetEngine (100% core), SureRank SEO, optional add-ons (BricksForge, BricksExtras), WordPress core, database, filesystem, and WP-CLI.

## 0. Stage 2.0 — Initial Site Bootstrap Checklist (Human vs. Agent Split)

Immediately after setting up a new Staging WordPress site and connecting MCP Novamira Pro, divide initial setup cleanly so the human only handles credentials/licenses and the Agent automates everything else:

### 0.1. Human Prerequisite (~5 Minutes in `wp-admin` — Cannot Be Automated Safely)
* **Install & License Plugins:** Install and activate Bricks Builder (+ Child Theme), Automatic.css (ACSS), Advanced Themer, JetEngine, SureRank, Novamira + Novamira Pro (and optional BricksForge / BricksExtras if used on this project), and enter commercial license keys.
* **Connect MCP:** Create an Administrator **Application Password** in WordPress and register the site URL/credentials in your MCP client (Antigravity / Codex).
* **Configure Novamira Abilities Hub:** In `wp-admin > Novamira > Abilities Hub`, verify required groups are enabled (**Bricks Specialization**, **Novamira Design**, **Novamira Memories**, **WordPress/WP-CLI/Filesystem**) and ensure **Read Mode is OFF** on Staging (keep Read Mode ON for Production sites).

### 0.2. Agent Automated Bootstrap (Executed Automatically by Agent via Novamira Pro)
Once connected, the Agent performs the full initial configuration in one pass without asking the user to click through settings manually:
1. **Stack & Abilities Discovery:** Inspect active plugins, theme versions, and available Abilities Hub tools; confirm whether optional add-ons (BricksForge, BricksExtras) are active.
2. **Novamira Design & Memories:** Write the project's **Novamira Design** record (Palette, Typography, Spacing, Guidance & Don'ts from approved `design-system.json`) and save site conventions (Website Width, Root Font Size, BEM prefixes, CPT/CCT/Options map) into **Novamira Memories**.
3. **Bricks Builder Core Settings:** Verify/configure `Cascade layer: ON`, `CSS loading method: External Files`, Theme Styles, and global container width via Bricks Specialization abilities.
4. **ACSS & Advanced Themer Alignment:** Inspect live ACSS and Advanced Themer options via Novamira Pro; apply ACSS palette/typography/spacing tokens and verify **AT Framework is disabled** (keeping only AT productivity/BEM/Variable Picker tools). *(If a specific ACSS/AT version stores complex encrypted/serialized UI options unsafe for direct DB writes, inspect first and output a clean 1-click JSON import or exact checklist rather than corrupting options).*
5. **JetEngine & SureRank Initialization:** Scaffold all required JetEngine **Options Pages, Meta Boxes, CPTs, CCTs, Taxonomies, Relations, Glossaries, Query Builder queries** and configure **SureRank** global Title/Meta/Schema defaults.

## 1. Tool Selection Hierarchy (Use Native Abilities First)

Novamira Pro exposes capabilities managed through the **Abilities Hub** in `wp-admin`. Always prefer the highest-level specialized ability before dropping down to raw primitives:

1. **Bricks Specialization Abilities (Highest Priority for Bricks):**
   * Always use Novamira Pro's dedicated Bricks abilities for **Pages**, **Templates & Display Conditions**, **Components (with properties/props)**, **Theme Styles**, **Global Classes**, **CSS Variables**, **Color Palettes**, **Dynamic Data bindings**, and **Global Settings**.
   * Never bypass Bricks abilities by injecting raw uneditable HTML or blindly mutating serialized Bricks postmeta via raw PHP/SQL — native Bricks abilities preserve full visual editability, proper component propagation, and component deletion protection.
2. **Memories (Persistent Cross-Session Context):**
   * At the start of a session, read Novamira Pro **Memories** to load saved site architecture (ACSS custom tokens, BEM prefixes, JetEngine CPT/CCT/relation maps, SureRank conventions).
   * After establishing major design tokens, CPT schemas, or reusable Bricks components, store concise updates in **Memories** so future sessions do not waste tokens re-discovering the site.
3. **WordPress Structured Abilities & WP-CLI:**
   * Use structured WP abilities (posts, terms, options, transients, schemas) and **WP-CLI** (foreground for quick commands like cache flush; background jobs for heavy bulk operations).
4. **Filesystem Tools (`Read / Write / Edit / Delete / List`):**
   * Confined by default to `ABSPATH` (or custom `novamira_filesystem_base_dir` filter). Protected core paths (`wp-admin/`, `wp-includes/`, `wp-content/mu-plugins/`) cannot be recursively deleted.
5. **Raw PHP Execution & Direct `$wpdb` (Last Resort Only):**
   * Because raw PHP executes with full WordPress runtime privileges and bypasses filesystem tool restrictions, reserve it strictly for inspecting/configuring plugins without dedicated abilities (e.g., querying JetEngine/ACSS/SureRank live options or registering hooks) and always keep snippets minimal, idempotent, and backed up.

## 2. Environment & Read Mode Rules (Staging vs. Production)

* **Production Sites — Read Mode ON:**
  * Use Novamira Pro **Read Mode** on production sites for audits, inspecting Bricks templates/components/global classes, checking ACSS token consistency, auditing JetEngine fields, and reviewing SureRank SEO/Schema.
  * In Read Mode, write pathways (PHP execution, file editing, WP-CLI, Visual/Design writes) are withheld, while Bricks specialization reads, Memories, and read-only SQL (executed in a rolled-back transaction) remain available.
  * Remember: Read Mode is an application-layer guardrail, not a server-level security sandbox.
* **Development / Staging Sites — Full Build Mode:**
  * Perform all active page building, template refactoring, JetEngine schema creation, and code changes on **Development or Staging** with recent backups enabled.
  * Do not disable Crash Recovery / runtime safety limits when running PHP tasks.

## 3. Four-Phase Execution Workflow

1. **Discovery & Memory Load (Read-Only):**
   * Read Novamira **Memories** and discover available abilities in **Abilities Hub**.
   * Verify installed/active plugins: confirm core stack (**Bricks Builder, ACSS, Advanced Themer, JetEngine, SureRank**) and explicitly check whether optional add-ons (**BricksForge**, **BricksExtras**) are active before referencing their elements.
   * Inspect existing Bricks global classes, CSS variables, templates, components, and target post/CPT schemas before writing.
2. **Scoped & Reversible Writes:**
   * Build new pages or major layout changes in `draft` status, or duplicate an existing Bricks template before modifying a live one.
   * Build repeatable UI patterns as **Bricks Components** (with props) + **BEM Global Classes** rather than monolithic single-page JSON trees.
   * Never run destructive SQL (`DROP`, `TRUNCATE`, mass `DELETE`), bulk `wp search-replace`, or edits to `wp-config.php` / `.htaccess` without explicit user confirmation.
3. **CSS & Cache Flush:**
   * After editing Bricks pages, templates, global classes, Theme Styles, or ACSS settings, regenerate Bricks CSS and flush active page/object caches (LiteSpeed, WP Rocket, FlyingPress, Redis, WP-CLI `wp cache flush`).
4. **Verification & Memory Update:**
   * Confirm HTTP 200 and check PHP error logs for warnings/fatals.
   * If Chrome DevTools MCP or Novamira Visual review is available, verify desktop/mobile layout, console errors, and Core Web Vitals (LCP, CLS, INP).
   * Update Novamira **Memories** with any newly created Components, Global Class conventions, or JetEngine CPT/CCT slugs, and report exact modified IDs to the user.
