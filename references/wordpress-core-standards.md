# WordPress Core Standards, Native Menus & ASE Baseline

Use this reference during Stage 2 (Foundation), Stage 3 (Page Assembly), and Stage 4 (QA & Handoff) to enforce strict WordPress conventions alongside Bricks Builder, ACSS, and MCP Novamira Pro (OAuth).

## 1. Native WordPress Navigation Menus (Hard Mandate)

Never hardcode site navigation inside Bricks Header or Footer templates using standalone `Text Link` elements.

### 1.1. Menu Proposal & User Approval Gate (Before Creating Menus)
* Before creating menus in WordPress, propose a clear **Header & Footer Menu Tree** tailored to the website's industry and sitemap:
  * **Header (`Primary Menu`):** Top-level items (typically 4–6 concise links + logical sub-items for Services/Products/Resources) + separate primary CTA button if applicable.
  * **Footer Menus:** Group cleanly into dedicated WordPress menus (e.g., `Footer Company`, `Footer Services`, `Footer Legal`) so each footer column is independently manageable by the client in `wp-admin`.
* **WAIT for user review/adjustment** before creating the menus.

### 1.2. WordPress `Appearance > Menus` + Bricks Integration Rules
* **Create Real WP Menus:** Create every approved menu in WordPress (`Appearance > Menus` via MCP Novamira Pro WP-CLI `wp menu create` + `wp menu item add-post` / `add-term` / `add-custom`) and assign the primary menu to the active theme's Menu Location.
* **Bricks Header & Footer Binding:**
  * Render menus strictly using Bricks' native **Nav Menu** element, **Nav Nestable** (dynamically bound to WP Menu), or **WP Menu** element.
  * **Single Source for Desktop & Mobile:** Bind both the Desktop navigation and the Mobile Off-Canvas/Drawer menu to the **same `Primary Menu`** so clients only edit navigation in one place (`Appearance > Menus`).
  * **Zero Hardcoded Text Links:** Do NOT replace Header/Footer menus with manual `Text Link` elements. *(Exception: single utility elements like a standalone Header CTA button, phone/email contact row bound to JetEngine Global Brand Info, or social icon buttons).*
* **Save Menu IDs to Novamira Memories:** Record exact Menu names, IDs, and assigned Locations in **Novamira Memories** for future updates.

## 2. WordPress Core Configuration Baseline (Stage 2.1)

Verify and configure these core WordPress settings during Stage 2.1:

* **Permalinks:** Set to `Post name` (`/%postname%/`) and flush rewrite rules (`wp rewrite flush --hard`).
* **Reading Settings:** Assign the static `Homepage` and `Posts page` (if Blog is used) cleanly once created; keep *"Discourage search engines"* (`blog_public = 0`) ON during Staging and remind user to turn it OFF at Production launch.
* **General Settings:** Verify Site Title, Tagline, Site Language (e.g., `vi` or `en_US`), and Timezone (e.g., `Asia/Ho_Chi_Minh`).
* **Child Theme Discipline:** Place all custom PHP snippets, `bricks/code/echo_function_names` allowlists, and custom hooks in the active **Bricks Child Theme** (`functions.php` or structured `/inc/` files) — never edit WordPress core or the Bricks parent theme.

## 3. Media Library & SVG Hygiene (Zero External Hotlinks)

* **Media Library Only (Media ID):** Every image and SVG icon used in Homepage, inner pages, Archive/Single templates, and JetEngine Options/CPT fields MUST be uploaded to the WordPress Media Library and referenced by **Media ID** — never hotlink external URLs (Unsplash, Pexels, temporary CDNs).
* **SEO Filenames & Alt Text:** Use descriptive ASCII lowercase hyphenated filenames (`dich-vu-san-xuat-tvc-doanh-nghiep.webp`) and meaningful `alt` attributes.
* **Single Cohesive SVG Icon Family:** Lock one consistent SVG icon set with uniform `stroke-width` site-wide (recorded in Novamira Memories). Upload sanitized SVGs to Media Library (enabled via ASE) or use Bricks' native SVG/Icon element — never dump raw inline `<svg>` code into executable Bricks Code elements.

## 4. Admin and Site Enhancements (ASE) Mandatory Baseline (Stage 2.1)

Configure **ASE** immediately at Stage 2.1 as part of the 7-Plugin Stack Gate:

* **Security & Hardening:**
  * Disable XML-RPC.
  * Hide WordPress version number / obfuscate author slugs where appropriate.
  * Enable Login ID/Limit Login Attempts (unless already handled by a dedicated WAF/security plugin — never duplicate).
* **Media & Content Hygiene:**
  * **Enable SVG Upload** (with built-in SVG sanitization enabled) so cohesive brand/UI SVGs upload cleanly to Media Library.
  * **Enable Image Upload Control** (set sensible max dimensions e.g. `2560px` and WebP conversion if no dedicated image optimizer plugin is active).
  * **Disable Comments** site-wide for corporate/brochure/B2B websites that do not use blog comments.
  * **Revisions Control:** Cap post revisions (e.g., `5–10`) to keep `wp_posts` lean.
* **Admin UX & Email Readiness:**
  * Clean Admin Bar / hide distracting admin notices for non-admin client roles.
  * Verify **Email Delivery (ASE SMTP)** or confirm an active SMTP plugin so Contact Form and Newsletter Form emails do not silently fail in production.

## 5. Synergy with Selected Official WordPress Agent Skills

When `wp-wpcli-and-ops` and `wp-performance` (from `WordPress/agent-skills`) are installed alongside `bricks-acss-stack`:

* Use **`wp-wpcli-and-ops`** practices whenever executing WP-CLI commands through **MCP Novamira Pro** (creating/assigning menus, flushing rewrites/caches, inspecting options safely, avoiding destructive search-replace).
* Use **`wp-performance`** practices during **Stage 4 QA** to audit `wp_options` autoload size, slow database queries, object caching, and asset weight.
* **Scope Boundary:** Do NOT apply Gutenberg Block Theme (`theme.json`, FSE block templates) patterns on Bricks Builder sites — Bricks + ACSS + AT + JetEngine remains the sole layout and styling architecture.
