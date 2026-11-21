# Changelog

Mọi thay đổi quan trọng của bộ skill `bricks-acss-stack` được ghi nhận tại đây theo chuẩn Semantic Versioning.

## [1.5.0] - 2026-11-22

### Changed
* Tích hợp **`playwright-cli`** (`@playwright/cli`) làm công cụ kiểm thử tự động ưu tiên (tiết kiệm token) trong Bước 4 (**Bounded Verification Pass**) và **Mode A (FE Demo)** tại `references/novamira-design-workflow.md` — chuẩn hóa viewport kiểm thử Desktop (`1440x900`) + Mobile (`390x844`), kiểm tra `console error`, tràn khung ngang và sự kiện tracking (`dataLayer`).

## [1.4.0] - 2026-11-22

### Added
* **Quy trình 2 chế độ (2-Mode Workflow)** trong `SKILL.md` và `references/novamira-design-workflow.md`:
  * **Mode A — Standalone FE Demo (Chưa cần WordPress / Novamira Pro):** Cho phép dựng nhanh bản prototype tĩnh HTML5 + CSS + JS nhẹ để trình bày và chốt giao diện với khách hàng trước khi dựng hạ tầng WordPress.
  * **Chuẩn chuyển đổi 1-1 không viết lại CSS:** Khai báo `tokens.css` mô phỏng đúng tên biến Automatic.css (`--primary`, `--space-*`, `--section-space-*`, `--text-*`, `--radius-*`), xuất kèm `design-system.json` chuẩn DTCG cho Novamira Design, giữ DOM khớp cấu trúc Bricks + BEM và đánh dấu sẵn `<!-- [BRICKS-COMPONENT] -->`, `<!-- [JETENGINE-LOOP] -->`.
  * **Checklist chuyển giao Mode A -> Mode B:** Quy trình 3 bước nạp trực tiếp bản FE Demo đã duyệt vào WordPress Staging + Bricks + ACSS + JetEngine + SureRank qua MCP Novamira Pro.

### Changed
* Cập nhật `SKILL.md` để tự động kích hoạt cả khi yêu cầu thiết kế FE Demo độc lập trước khi triển khai WordPress.
* Cập nhật `README.md` bổ sung điểm nổi bật của quy trình 2 chế độ.

## [1.3.0] - 2026-11-22

### Added
* **Pha 0 (Brief Inference)** trong `references/novamira-design-workflow.md`: bổ sung bước chốt **Design Read** 1 dòng trước khi dựng trang, phân loại **4 Surface Modes** (`Persuade`, `Read`, `Experience`, `Operate`), tách rõ quy trình *Refinement* và *Redesign*.
* **Hệ 3 thông số định lượng (The Three Dials):** `DESIGN_VARIANCE`, `MOTION_INTENSITY`, `VISUAL_DENSITY` (thang 1–10) kèm preset theo nhóm dự án (B2B uy tín `3/2/5`, Landing chuyển đổi `7/6/4`, Agency `9/8/3`, Blog `6/4/3`).
* **Khẩu lệnh tinh chỉnh (Steering Vocabulary):** `critique`, `audit`, `polish`, `bolder`, `quieter`, `distill`, `clarify`.
* **Ngưỡng UX & Craft định lượng (Quality Floor):** tương phản `>= 4.5:1`, font body mobile `>= 16px`, độ dài dòng `60–75ch`, vùng chạm `>= 44x44px` cách `>= 8px`, Hero dùng `min-height: 100dvh`, transition `150–300ms`, đồng bộ 1 bộ SVG icon cùng `strokeWidth`, giữ `CLS < 0.1`.

### Changed
* Nâng cấp Bước 4 quy trình dựng web sang **Bounded Verification Pass** (soi desktop + mobile cùng 1 lượt, sửa trọn gói 1 đợt, kiểm chứng tối đa thêm 1 vòng) để chống đốt token.

## [1.2.0] - 2026-11-21

### Added
* Hướng dẫn cài đặt toàn cục và cục bộ đầy đủ cho **OpenAI Codex** (Windows PowerShell và macOS/Linux) trong `README.md`.
* Lệnh `git pull` cập nhật nhanh cho cả Google Antigravity và OpenAI Codex.

## [1.1.0] - 2026-11-21

### Added
* Tệp `references/novamira-design-workflow.md` tích hợp chuẩn **Novamira Design** (Novamira 1.10.0+) gồm 4 trụ cột kiểm duyệt chống AI slop (Palette, Typography, Spacing, Guidance & Don'ts) và quy trình 5 bước thiết kế website WordPress mới.
* Đấu nối `novamira-design-workflow.md` vào tệp điều hướng `SKILL.md` và cập nhật cây thư mục trong `README.md`.

## [1.0.0] - 2026-11-21

### Added
* Khởi tạo bộ skill `bricks-acss-stack` chuẩn **Progressive Disclosure** với tệp gốc `SKILL.md` và 5 tài liệu tham chiếu:
  * `references/novamira-pro-ops.md`: Quy chuẩn vận hành toàn site qua MCP Novamira Pro (Abilities Hub, Bricks Specialization, Memories, Read Mode, WP-CLI, Crash Recovery).
  * `references/bricks-academy-core.md`: Kiến trúc lõi Bricks Academy (Components & Properties, CSS Cascade Layers `@layer`, Interactions, Query Loop, `{echo:}` allowlist, Code Signatures).
  * `references/acss-and-bem.md`: Hệ biến ACSS, đặt tên BEM, quy tắc tách vai Automatic.css và Advanced Themer, quy trình bàn giao **Strict Editor View**.
  * `references/bricks-addons-and-jetengine.md`: Phân cấp **JetEngine** (100% lõi dự án) và add-on tùy chọn (**BricksForge**, **BricksExtras**).
  * `references/surerank-seo.md`: Quy chuẩn SEO On-page và nguồn Schema JSON-LD duy nhất trên **SureRank**.
