# Bricks Builder Core Architecture (Bricks Academy Standards)

Aligned with official Bricks Academy (`academy.bricksbuilder.io`). Use this reference when designing Bricks components, templates, global styling, dynamic data, interactions, or custom PHP hooks.

## 1. Design System Hierarchy

Follow Bricks' native styling cascade from broadest to most specific:

1. **CSS Variables (ACSS / Style Manager / Color Manager):** Single source of truth for spacing, typography, colors, and radii.
2. **Theme Styles:** Site-wide defaults (body typography, links, headings, container width, section defaults, form inputs) scoped via conditions.
3. **Global Classes (BEM + ACSS Utilities):** Reusable style sets applied across elements; never rely on element `#id` styling for repeatable patterns.
4. **Components & Properties:** Package repeatable structures (cards, heroes, pricing tiers, CTAs, headers) into **Bricks Components**. Expose editable **Component Properties** (text, image, link, toggle bound to element Display Conditions) so instances stay synchronized while customizing content safely.

## 2. CSS Cascade Layers (`@layer`) — Bricks 2.0+

* Bricks wraps core styles in native CSS cascade layers (`bricks.reset`, `bricks`, `bricks.gutenberg`, `bricks.icons`, `bricks.libs`), enabled by default under `Bricks > Settings > Performance > Cascade layer`.
* **Rules:**
  * Keep Cascade Layers enabled (do not disable them).
  * Because default Bricks element styles sit inside `@layer bricks`, user Global Classes and ACSS rules override them cleanly — **never spam `!important` or deep selector chains** to fight Bricks defaults.

## 3. Templates, Display Conditions & Interactions

* **Templates & Conditions:** Build Header, Footer, Single (per JetEngine CPT), Archive, Search, 404, and Popup layouts as Bricks Templates with explicit **Display Conditions** (post type, taxonomy, user role, etc.).
* **Native Interactions First:** Before writing custom JavaScript (or assuming optional BricksForge/BricksExtras are installed), use Bricks' native **Interactions** (triggers: `Click`, `Scroll`, `Enter viewport`, `Content loaded`, `Form success` -> actions: `Toggle class`, `Set attribute`, `Show/Hide element`, `Show/Hide popup`, `Start animation`).

## 4. Query Loop, Dynamic Data & Security Rules

* **Query Loop & Filtering:**
  * Use Bricks native **Query Loop** for standard post/term loops and select **JetEngine Query Builder** inside Query Loop for complex CPT/CCT/relation/meta queries.
  * Use Bricks' built-in **Query Sort, Filter & Live Search** elements (or JetSmartFilters if active) for AJAX filtering/sorting without page reload.
* **`{echo:...}` Allowlist Mandate (Bricks 1.9.7+):**
  * Any custom PHP function invoked via `{echo:function_name}` **must** be explicitly allowlisted via the `bricks/code/echo_function_names` filter in the child theme (or snippet plugin), otherwise Bricks silently blocks execution.
* **Code Signatures & Security Hygiene:**
  * Executable Code elements, Query Editor PHP, and raw Code SVGs require valid **Code Signatures** (unsigned elements are blocked and flagged).
  * Prefer native Bricks elements, JetEngine Query Builder, and child-theme PHP hooks (`bricks/posts/query_vars`, `bricks/query/loop_object`, `bricks/code/echo_function_names`) over scattering executable PHP inside Bricks Code elements — especially on hardened sites using `BRICKS_LOCK_CODE_SIGNATURES`.
  * When CSS loading is set to **External Files**, always trigger Bricks CSS regeneration (via Novamira Pro / WP-CLI) after structural or global class updates.
