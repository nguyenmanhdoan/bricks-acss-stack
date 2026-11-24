# JetEngine (Anti-Overengineering Core), Mandatory Forms & Optional Bricks Add-ons

Use this reference when designing the data architecture at **Gate 2.2**, building mandatory Contact/Newsletter forms, or using optional BricksForge / BricksExtras features.

## 1. JetEngine Minimalist Decision Matrix (Anti-Overengineering Mandate)

JetEngine is always installed in the stack, **but MUST NOT be overused blindly**. Never invent unnecessary CPTs, CCTs, Relations, Glossaries, or bloated Options Pages when native WordPress features already solve the problem cleanly.

### 1.1. Gate 2.2 — Mandatory Data Model Proposal Before Creation
Before creating ANY JetEngine CPT, CCT, Taxonomy, Relation, Meta Box, Glossary, or Options Page via MCP Novamira Pro, present a concise **Data Model Proposal Table** (`Content Entity` | `Use WP Core or JetEngine` | `Fields / Purpose` | `Reason`) and **WAIT for user approval**.

### 1.2. Decision Matrix: WordPress Core vs. JetEngine

| Content / Feature | Use This | Rule & Rationale |
| :--- | :--- | :--- |
| **Blog / News / Articles** | **WordPress Core (`Posts` + `Categories` / `Tags`)** | Never create a custom `blog` or `news` CPT duplicating WordPress Posts. |
| **Standard Static Pages** (About, Contact, Policies, Simple Landing) | **WordPress Core (`Pages`) + Bricks** | Do NOT create JetEngine CPTs or bloated Options Pages just to hold normal page copy. |
| **Header & Footer Navigation** | **WordPress Core (`Appearance > Menus`)** | **NEVER** use JetEngine Options Page or Repeaters to manage site menus. |
| **Global Brand Settings** (Logo Media ID, Hotline, Email, Address, Social, Copyright, Global CTA) | **JetEngine Options Page (Max 1 tabbed page)** | Keep lean (~20–60 KB total, well under 100 KB). Store all images as **Media ID**. Never dump 10 full pages of text or growing lists into an Options Page. |
| **Core Business Entities needing public URLs & SEO** (e.g., Services, Projects/Portfolio, Products if no WooCommerce) | **JetEngine CPT (+ Taxonomies)** | Create ONLY for real business entities required by the approved sitemap. Set `publicly_queryable: false` / `has_archive: false` (or `noindex` in SureRank) if an entity has no standalone detail pages. |
| **High-Volume Flat Records / Non-SEO Data** (e.g., Form Leads, Reviews, >20 Store Locations) | **JetEngine CCT** | Dedicated MySQL table keeps `wp_posts`/`wp_postmeta` lean. Do NOT create a CCT for 3–5 small static items. Always query via **JetEngine Query Builder** inside Bricks Query Loop. |
| **Cross-Entity Links shown on Frontend** (e.g., Projects linked to a Service) | **JetEngine Relations** | Create ONLY when the approved UI actually displays related items across two entities. |
| **Shared Select/Checkbox Lists** | **JetEngine Glossaries** | Create ONLY when the exact same option list is reused across `>= 2` Meta Boxes or Forms. |
| **Structured Fields on Many Static Landing Pages (>5–10 pages)** | **JetEngine Meta Box (per Page)** | Prefer per-page Meta Boxes over a giant Options Page so each page loads only its own meta and supports WP Revisions. |

### 1.3. Naming, Query Architecture & Performance Guardrails
* **Naming Convention:** Use consistent `snake_case` with a short entity prefix for meta keys (e.g., `srv_price_from`, `prj_client_name`) and record the approved schema in **Novamira Memories**.
* **Bricks Native Query Loop (Default):** Use for standard Posts, CPTs, Terms, and Media — produces clean semantic DOM pairing natively with ACSS `.grid--*` and BEM Global Classes.
* **JetEngine Query Builder + Bricks Query Loop (Hybrid Standard):** Use for CCTs, Relations, SQL Queries, REST API queries, or multi-condition meta queries.
* **Avoid JetEngine Listing Grid Widget:** Do not use the Listing Grid widget inside Bricks (extra wrapper overhead) unless a Listing-only feature such as *Listing Injections* is explicitly required.
* **Avoid Deep Nested Loops:** Never nest more than 2 Query Loops inside a single card (prevents N+1 queries).
* **Dynamic Tags Verification:** Inspect actual registered JetEngine meta keys and field slugs via MCP Novamira Pro before binding in Bricks. Use `{je_current_object_field}` for CCT/SQL/Repeater contexts.
* **Always Paginate & Index:** Never render large unpaginated lists; index frequently filtered CCT/Relation columns and pair with Object Cache.

## 2. Mandatory Functional Forms (Contact Page & Footer Newsletter)

Every website built with this stack MUST include two real, working forms (never static non-functional `<input>` mockups):

### 2.1. Contact Page — Mandatory Contact Form
* **Engine:** Use **BricksForge Pro Forms** if Novamira Pro confirms BricksForge is active; otherwise use **Bricks Native Form** element.
* **Required Structure:**
  * Clear semantic field names (`full_name`, `phone`, `work_email`, `service_interest`, `message`) with proper `<label>` elements, accessible validation, and clear inline success/error messages.
  * **Spam Protection:** Honeypot enabled (plus Cloudflare Turnstile / reCAPTCHA if configured).
  * **Zero Lost Leads (Submission Storage):** Always enable **Form Submission Storage** (Bricks Form Submissions, BricksForge Pro Forms Submissions, or optional JetEngine CCT `form_leads`) in addition to Email notification, so leads are never lost if SMTP is not yet configured.
  * **SMTP Verification:** Confirm **ASE SMTP** (or active SMTP plugin) during Stage 2.1 / Stage 4 Handoff.

### 2.2. Footer Global Template — Mandatory Newsletter Form
* **Engine:** Bricks Native Form or BricksForge Pro Forms (matching site stack).
* **Required Structure:**
  * Accessible Email input (`newsletter_email`, `type="email"`, `required`) + clear Submit CTA button + Honeypot spam protection + concise inline success/error feedback.
  * **Storage / Routing:** Enable Submission Storage (or connect to active email marketing webhook/CRM/CCT `newsletter_subscribers`) so every signup is reliably captured.
* **Stage 4 QA Verification:** `playwright-cli` MUST verify both Contact Form and Newsletter Form render cleanly on Desktop (`1440x900`) and Mobile (`390x844`) and accept valid submissions without console errors.

## 3. BricksForge (Optional — Verify Installed via MCP Novamira Pro First)

Only use BricksForge features if MCP Novamira Pro confirms the plugin is active. Otherwise, use Bricks native Form element + lightweight CSS/JS.

* **Pro Forms:** Use for multi-step forms, conditional logic, webhook/CRM submissions, and custom post/CCT creation.
* **GSAP Animations & Timelines:** Prefer subtle, purposeful motion (`transform` and `opacity` only), respect `prefers-reduced-motion`, and never delay above-the-fold Hero LCP with `opacity: 0`.

## 4. BricksExtras (Optional — Verify Installed via MCP Novamira Pro First)

Only use BricksExtras elements if MCP Novamira Pro confirms the plugin is active. Otherwise, build accessible native Bricks structures (Nestable Accordion, Tabs, Popup Template, Nav Nestable).

* **Navigation & Overlays:** Mega Menu, Slide Menu, OffCanvas, Modal, Popover (ensure ARIA labels, focus trap, Escape handling, and ACSS focus tokens).
* **Content & Conversion:** Pro Accordion (disable FAQ Schema inside BricksExtras if SureRank handles FAQ Schema), Pro Tabs, Table of Contents, Read More / Less, Before/After Image, Content Timeline, Pro Slider.
