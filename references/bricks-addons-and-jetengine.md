# JetEngine (Core) & Optional Bricks Add-ons (BricksForge, BricksExtras)

Use this reference when implementing dynamic data, custom post types, custom content types, relations, options pages, query loops, forms, animations, or interactive UI components.

## 1. JetEngine Integration with Bricks Builder (Always Active — 100% of Projects)

JetEngine is a permanent core pillar on every website project. Always design dynamic data architecture around JetEngine before considering custom PHP or raw SQL.

### 1.1. Data Modeling Rules (CPT vs. CCT vs. Options Page vs. Glossary)
* **Custom Post Types (CPT):** Use for entities that require public URLs, taxonomies, and SureRank SEO indexing (e.g., Services, Projects, Case Studies, Team, Products).
  * If a CPT is used purely as an internal data container without standalone pages (e.g., Testimonials, Partner Logos), set `publicly_queryable: false` / `has_archive: false` (or `noindex` in SureRank) to prevent thin duplicate pages from being indexed.
* **Custom Content Types (CCT):** Use for high-volume structured records or non-SEO data (Form Leads, Reviews, Booking Logs, Directory Specs, Store Locations). CCTs use dedicated custom MySQL tables, keeping `wp_posts` and `wp_postmeta` lean and fast.
  * **Bricks Query Rule for CCT:** Native Bricks post queries cannot read CCT tables directly — always create a **JetEngine > Query Builder** query (`Custom Content Type`) and connect it as the source inside a Bricks Query Loop.
* **Options Pages (Centralized Content & Global Settings):**
  * Use tabbed JetEngine Options Pages as the centralized editing hub for **Brand & Global Settings** (light/dark Logo, Favicon, hotline, address, social links, Header/Footer CTAs) AND **static core-page content** (Homepage/About/Contact titles, subtitles, descriptions, hero/main images, fixed proof metrics) so clients can update copy and media in one place without opening Bricks.
  * **Media ID Mandate:** Always store image fields as **Media ID** (integer, a few bytes) rather than raw URLs or inline SVG/base64 so Bricks outputs responsive `srcset`, WebP/AVIF, and SEO `alt` attributes while keeping `wp_options` lightweight (~20–60 KB total).
  * **Scale & Autoload Guardrail:** Keep total Options Page payload lean (under ~100–150 KB). Never put growing/unbounded lists (30+ Projects, Products, Posts, Testimonials, or heavy nested Repeaters) into an Options Page — use **CPT/CCT** for lists, and use **per-page JetEngine Meta Boxes** if the site has more than 5–10 distinct static landing pages (so each page loads only its own meta and shares the same screen with SureRank SEO + WP Revisions).
* **Glossaries:** Use JetEngine Glossaries for reusable select/checkbox option lists (provinces, service tiers, statuses) instead of duplicating choices across multiple Meta Boxes.
* **Naming Convention:** Use consistent `snake_case` with a short entity prefix for meta keys (e.g., `srv_price_from`, `prj_client_name`) to prevent collisions across Meta Boxes and keep **Novamira Memories** clean.

### 1.2. Query Architecture (Bricks Query Loop vs. Query Builder vs. Listing Grid)
* **Bricks Native Query Loop (Default for simple loops):** Use for standard Posts, CPTs, Terms, and Media — produces the cleanest semantic DOM and pairs natively with ACSS `.grid--*` and BEM Global Classes.
* **JetEngine Query Builder + Bricks Query Loop (Hybrid Standard):** Use for CCTs, Relations, SQL Queries, REST API queries, Data Stores, or multi-condition meta queries — combines JetEngine's data engine with Bricks' native layout and styling control.
* **Avoid JetEngine Listing Grid Widget:** Do not use the JetEngine Listing Grid widget inside Bricks (it adds extra wrapper markup and abstraction overhead) unless a project explicitly needs a Listing-only feature such as *Listing Injections*.

### 1.3. Relations, Repeaters & Dynamic Data Binding
* **Relations:** Always use **JetEngine Relations** (One-to-One, One-to-Many, Many-to-Many, with optional relation meta fields) instead of storing raw Post IDs in text fields. Display related items via a JetEngine Relations Query attached to a Bricks Query Loop.
* **Avoid Deep Nested Loops:** Avoid nesting more than 2 Query Loops inside a single card (prevents N+1 database queries and object-context bugs). Simplify the card data model or use a single cached SQL Query when complex joins are required.
* **Dynamic Tags Verification:** Always inspect actual registered JetEngine meta keys and field slugs via **MCP Novamira Pro** before binding dynamic tags in Bricks. Use `{je_current_object_field}` when pulling fields from CCT, SQL, or Repeater contexts, and prefer nested Bricks Query Loops over outputting raw HTML from PHP callbacks.

### 1.4. JetEngine Performance Guardrails
* **Always Paginate:** Never render hundreds of CPT/CCT items in a single unpaginated loop; always configure Pagination, Load More, or AJAX filtering (Bricks native Query Filters or JetSmartFilters when installed).
* **Indexing & Caching:** For large CCT or Relations tables, index columns frequently used in `meta_query` / `WHERE` clauses and pair with Object Cache (Redis/Memcached) or Query Caching so heavy queries do not hit MySQL uncached on every request.

## 2. BricksForge (Optional — Verify Installed via Novamira Pro First)

Only use BricksForge features if Novamira Pro confirms the plugin is active on the current site. Otherwise, use Bricks native Form element + lightweight CSS/JS.

* **Pro Forms:**
  * Use BricksForge Pro Forms for multi-step forms, conditional logic, webhook/CRM submissions, and custom post/CCT creation.
  * Map form field names clearly (`full_name`, `work_email`, `phone`, `service_interest`) so GTM/GA4 tracking and webhooks stay consistent.
  * Add honeypot / Turnstile / spam protection and clear accessible error/success states.
* **GSAP Animations & Timelines:**
  * Prefer subtle, purposeful motion (fade-up reveals, gentle stagger, smooth pin/scrub only when adding narrative value).
  * Respect `prefers-reduced-motion` and avoid animating layout-thrashing properties (`width`, `height`, `top`, `left`); animate `transform` and `opacity` only to protect CLS and INP.
  * Keep scroll triggers minimal on above-the-fold hero elements so **LCP (Largest Contentful Paint)** is never delayed by `opacity: 0` on initial render.

## 3. BricksExtras (Optional — Verify Installed via Novamira Pro First)

Only use BricksExtras elements if Novamira Pro confirms the plugin is active on the current site. Otherwise, build accessible native Bricks structures (e.g., native Nestable Accordion, Tabs, Popup Template, Nav Nestable).

* Use BricksExtras native elements instead of hand-coding custom JS widgets for:
  * **Navigation & Overlays:** Mega Menu, Slide Menu, OffCanvas, Modal, Popover.
  * **Content & Conversion:** Pro Accordion (supports FAQ Schema alignment — disable duplicate schema if SureRank handles FAQ Schema), Pro Tabs, Table of Contents, Read More / Less, Before/After Image, Content Timeline.
  * **Dynamic Sliders:** Pro Slider paired with Bricks/JetEngine Query Loop.
* **Accessibility Check:** Ensure every Modal, OffCanvas, Accordion, and Tab has proper ARIA labels, keyboard focus trap/escape handling, and visible focus states using ACSS focus tokens.
