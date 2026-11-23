# Humanize Copy & Realistic Demo Content Seeding

Use this reference whenever writing website copy (FE Demo headlines, CTAs, section copy, About/Service text) or seeding sample WordPress content (posts, projects, products, CPT/CCT records) so all text reads naturally like a domain specialist rather than generic AI prose.

## 1. Core Copywriting Principles (Distilled for Vietnamese & English)

* **Context-Aware Register (No One-Size-Fits-All Voice):**
  * Natural writing does **not** mean forcing every page to sound casual, overly short, or stripping proper domain terminology. Match the brand register and Surface Mode (B2B enterprise, luxury/editorial, technical service, conversion landing page) and keep Vietnamese pronouns/tone consistent.
* **Fact & Meaning Preservation (Zero Hallucination):**
  * Preserve all client facts, numbers, units, proper nouns, conditions, and causal links verbatim.
  * Never upgrade certainty (do not turn *"có thể giảm"* into *"giảm"*, *"hỗ trợ"* into *"đảm bảo"*, or *"sau khi"* into *"nhờ"*).
  * Never invent fake metrics, awards, or client testimonials just to make copy look "specific". When seeding demo placeholders, mark clearly as sample data or use realistic scope descriptions without fabricated legal/numeric claims.
* **Two-Pass Editing Protocol:**
  * **Pass 1 — Surface Cleanup:**
    * *Ban Vietnamese AI clichés:* "Trong thời đại 4.0", "Trong bối cảnh hiện nay", "Hãy cùng khám phá", "Điều quan trọng cần lưu ý là", "Không thể phủ nhận rằng", "Hành trình", "Bức tranh toàn cảnh", "Sự bùng nổ của", "Giải pháp toàn diện hàng đầu", "Nâng tầm đẳng cấp", "Tiên phong dẫn đầu".
    * *Ban English AI clichés:* "In today's fast-paced world", "Delve into", "Let's explore", "Game-changer", "Elevate your...", "Unlock the power of", "Seamless experience", "Cutting-edge solution", "Testament to", "Tapestry".
    * Cut robotic crutches: overuse of em-dashes (`—`), repetitive *"Không chỉ X mà còn Y"* / *"It's not just X, it's Y"* formulas, forced rule-of-three adjective strings, and chatbot sign-offs.
  * **Pass 2 — Structural Cleanup:**
    * Remove preachy/moralizing closing sentences that summarize what the reader just read.
    * Show concrete scope, deliverables, or process instead of naming abstract emotions or vague praise.
    * **Anti-Convergence Across Multiple Items:** When writing multiple cards or 8 sample items, intentionally vary opening hooks, sentence rhythm, and paragraph length so items do not share an identical structural template.
* **No Lorem Ipsum & Actionable UI Copy:** Never use Lorem Ipsum in FE Demos or Staging drafts. Keep CTA buttons specific to the user action (*"Nhận báo giá dự án"*, *"Xem hồ sơ năng lực"*) rather than generic (*"Tìm hiểu thêm"*, *"Xem thêm"*).

## 2. Demo Content Seeding Standard (Stage 2.3 — 8 Items per Type)

Execute immediately **after confirming Homepage concept/core services and building the JetEngine Data Layer**, and **before assembling Bricks Templates & Pages**:

* **Quantity Rule (8 Items per Active Content Type):** Seed **8 realistic sample items** for every active dynamic content type on the site (e.g., 8 sample Blog Posts, 8 sample Projects, 8 sample Products, and 8 sample CCT/CPT items where applicable).
  * *Why 8?* Cleanly tests 2-, 3-, and 4-column ACSS grids (`.grid--2`, `.grid--3`, `.grid--4`), Pagination / Load More, Taxonomy AJAX filters, and JetEngine Relations without empty slots or broken card heights.
* **Taxonomy & Relation Coverage:** Distribute the 8 items evenly across active categories/taxonomies (e.g., 3 Event, 3 Film, 2 OOH) and link realistic **JetEngine Relations** so single templates and related-item loops render with real data immediately.
* **Cohesive Demo Visuals (Media ID):** Upload demo images matching the approved **Novamira Design** palette, mood, and aspect ratios (WebP/compressed, descriptive filenames and SEO `alt` text), and attach them via **Media ID** to Featured Images, Galleries, and JetEngine Options Page fields.
* **Natural Length Variation:** Vary sample titles, excerpts, and meta fields realistically (shorter and longer entries) to stress-test card alignment, heading wrapping, and line clamping cleanly.
