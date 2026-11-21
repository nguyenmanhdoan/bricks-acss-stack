# MCP Novamira Pro — Official Operations & Bricks Specialization Protocol

Aligned with official documentation (`novamira.ai/docs/`). MCP Novamira Pro is the **site-wide execution engine for the entire WordPress installation** — spanning Bricks Builder, Automatic.css (ACSS), Advanced Themer, JetEngine (100% core), SureRank SEO, optional add-ons (BricksForge, BricksExtras), WordPress core, database, filesystem, and WP-CLI.

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
