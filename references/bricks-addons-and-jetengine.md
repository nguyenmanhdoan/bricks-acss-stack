# JetEngine (Core) & Optional Bricks Add-ons (BricksForge, BricksExtras)

Use this reference when implementing dynamic data, custom post types, query loops, forms, animations, or interactive UI components.

## 1. JetEngine Integration with Bricks Builder (Always Active — 100% of Projects)

JetEngine is a permanent core pillar on every website project. Always design dynamic data architecture around JetEngine before considering custom PHP/SQL.

* **Data Modeling First:**
  * Use **CPT (Custom Post Type)** when items need public URLs, SEO pages, taxonomies, and SureRank indexing (e.g., Projects, Services, Case Studies, Products).
  * Use **CCT (Custom Content Type)** for high-volume structured records that do not need standalone SEO URLs (e.g., Form Leads, Reviews, Booking Logs, Directory Specs) to keep `wp_posts` and `wp_postmeta` fast.
  * Use **Relations** instead of storing raw post IDs in text fields when linking CPTs (e.g., Services <-> Case Studies, Team <-> Projects).
* **Query Loops:**
  * Prefer **JetEngine Query Builder** for complex filtering, meta queries, relation queries, or CCT queries, then select that JetEngine Query inside Bricks' native Query Loop.
  * Keep simple standard post loops on Bricks' native Query Loop to avoid unnecessary overhead.
* **Dynamic Data Binding:**
  * Always inspect the actual registered JetEngine meta field keys via MCP Novamira Pro before binding dynamic tags in Bricks.
  * Use Bricks dynamic tag format matching the registered provider (e.g., `{je_<cpt>_<field_name>}` or standard WP `{post_title}`, `{featured_image}`, `{post_url}`, and JetEngine relation/repeater loops). Verify the exact dynamic tag syntax registered on the live site if unsure.
  * For repeaters and relations, bind a nested Bricks Query Loop rather than outputting raw HTML from PHP callbacks whenever possible.

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
