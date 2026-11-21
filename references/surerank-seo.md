# SureRank SEO & Schema Reference

Use this reference when configuring on-page SEO, sitemaps, meta tags, or JSON-LD structured data with SureRank on a Bricks Builder + JetEngine website.

## 1. Single Source of Truth for SEO & Schema

* Manage SEO Title, Meta Description, Canonical URL, Robots (`index`/`noindex`, `follow`/`nofollow`), Open Graph/Social cards, XML Sitemaps, and JSON-LD Schema exclusively in **SureRank**.
* Never output duplicate JSON-LD `<script type="application/ld+json">` blocks in Bricks custom code, child theme functions, or BricksExtras elements (e.g., disable FAQ Schema inside BricksExtras Pro Accordion if SureRank outputs FAQ Schema).

## 2. On-Page Bricks Alignment for SureRank

* **Heading Hierarchy:** Exactly one `<h1>` per rendered page/template (bound to `{post_title}` on single templates). Follow strict `h1` -> `h2` -> `h3` -> `h4` order; use ACSS typography classes (`.h2`, `.text--l`) on `<p>` or `<span>` when styling visual hierarchy without breaking semantics.
* **Media & Core Web Vitals (LCP/CLS):** Always set descriptive `alt` text on images (or dynamic `{featured_image}` alt), explicit `width`/`height`, and `loading="eager"` + `fetchpriority="high"` on the primary above-the-fold hero image.
* **Internal Linking & Breadcrumbs:** Ensure breadcrumb trails align with SureRank's `BreadcrumbList` schema and clean URL hierarchy.

## 3. Programmatic Updates via MCP Novamira Pro

* Always inspect SureRank's live option names and postmeta keys in WordPress via Novamira Pro before writing or bulk-updating SEO metadata.
* Audit CPT and Taxonomy archive templates (created via JetEngine) to ensure every public CPT has clean global Title/Description patterns in SureRank, while utility pages (thank-you pages, internal search, cart/checkout, staging/test drafts) are explicitly set to `noindex`.
