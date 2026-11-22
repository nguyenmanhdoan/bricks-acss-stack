# Changelog

Mọi thay đổi quan trọng của bộ skill `bricks-acss-stack` được ghi nhận tại đây theo chuẩn Semantic Versioning.

## [2.2.0] - 2026-11-23

### Added
* **Cơ chế Kiểm soát Xác nhận từng bước (Mandatory Approval & Step-Gate Governance)** trong `SKILL.md` và `references/novamira-design-workflow.md`:
  * **Chốt quy trình tổng thể trước khi chạy:** Bắt buộc trình bày kế hoạch tổng thể và danh sách bước nhỏ để người dùng xác nhận trước khi viết code hoặc thao tác WordPress.
  * **Xác nhận thông tin trước mọi bước thiết kế FE:** Bắt buộc xác nhận thông tin triển khai (Design Read, 3 Dials, hướng màu/font, dàn ý section) trước khi dựng FE Demo Trang chủ từ brief và trước khi thiết kế các trang con từ demo đã duyệt.
  * **Chia nhỏ bước & Done-Before-Next:** Triển khai cuốn chiếu theo từng bước độc lập (`2.1` -> `2.2` -> `2.3` -> `3.1` -> `3.2` -> `4.1`), báo cáo ngắn gọn kết quả và chờ người dùng xác nhận hoàn tất bước hiện tại trước khi sang bước tiếp theo để tránh lỗi dây chuyền.

## [2.1.0] - 2026-11-23

### Added
* **Stage 2.0 — Initial Site Bootstrap Checklist (Human vs. Agent Split)** trong `references/novamira-pro-ops.md` và `SKILL.md`: phân tách rõ phần người dùng cần chuẩn bị 1 lần (~5 phút: cài plugin/license, tạo Application Password, bật Abilities Hub & tắt Read Mode trên Staging) và phần **Agent tự động cấu hình 100%** sau khi kết nối MCP Novamira Pro (Novamira Design, Novamira Memories, Bricks Settings, ACSS/AT alignment, JetEngine data layer và SureRank defaults).
* **Quy tắc phân bổ thiết kế Trang con** trong `SKILL.md` và `references/novamira-design-workflow.md`:
  * Nhóm trang động (`Blog Archive`, `Single Blog`, `Project/CPT Archive`, `Single Project/CPT`) thiết kế thẳng thành Bricks Global Templates ở **Stage 2**.
  * Nhóm trang đặc thù (`Service Landing Pages`, `About`, `Contact`) chốt nhanh dàn ý section rồi dựng thẳng trên Bricks Staging ở **Stage 3** (tái sử dụng 100% Components/BEM Stage 2).
  * Bổ sung tùy chọn **Stage 1B** (chỉ dùng khi khách bắt buộc duyệt FE tĩnh trang con, kế thừa nguyên `tokens.css` & `styles.css`).

## [2.0.0] - 2026-11-23

### Changed
* **Tái cấu trúc toàn bộ `SKILL.md` và `references/novamira-design-workflow.md` thành Quy trình tuần tự 4 giai đoạn (Sequential 4-Stage Pipeline)** để OpenAI Codex và Google Antigravity thực thi chính xác, không bị lặp lại vòng đời ở từng trang con:
  * **Stage 1:** Brief & Dựng FE Demo tĩnh Bricks-Ready -> **GATE 1 (Bắt buộc dừng chờ chốt Demo)**.
  * **Stage 2:** Thiết lập nền tảng WordPress **1 lần duy nhất** (Novamira Design + ACSS + toàn bộ tầng dữ liệu JetEngine + Bricks Global Templates/Components/BEM).
  * **Stage 3:** Triển khai đồng loạt Trang chủ & các trang con bằng cách **tái sử dụng 100% hệ thống Stage 2** (cấm lặp lại Design Read hay tạo lại token/class mới cho từng trang con) + cấu hình SureRank.
  * **Stage 4:** Kiểm thử gom 1 đợt toàn site bằng `playwright-cli` (Bounded Verification Pass) -> Bật **Strict Editor View** của Advanced Themer & bàn giao.
* **Cập nhật quy định JetEngine Options Pages** trong `references/bricks-addons-and-jetengine.md`: cho phép gom tập trung cả Brand/Logo lẫn nội dung tĩnh Trang chủ/khối dùng chung (`title`, `subtitle`, `description`, ảnh chính lưu dạng **Media ID**), chia tab gọn nhẹ dưới ~100–150 KB, dùng Meta Box theo trang khi >5–10 trang tĩnh và giữ danh sách tăng trưởng ở CPT/CCT.

## [1.6.0] - 2026-11-22

### Changed
* Nâng cấp chuyên sâu toàn bộ quy chuẩn **JetEngine** (lõi 100% dự án) trong `references/bricks-addons-and-jetengine.md`:
  * **Phân tách mô hình dữ liệu:** Quy định rõ khi nào dùng CPT (kèm chặn index trang mỏng với SureRank), CCT (bắt buộc qua Query Builder khi dùng trên Bricks), Options Pages (cấm nhồi Repeater lớn gây phình autoload `wp_options`), Glossaries và quy ước đặt tên `snake_case` có tiền tố.
  * **Kiến trúc Query chuẩn Bricks:** Phân tầng Bricks Native Query Loop vs. JetEngine Query Builder + Bricks Query Loop; hạn chế widget JetEngine Listing Grid thừa wrapper.
  * **Relations, Dynamic Data & Hiệu năng:** Chống lồng quá 2 cấp Query Loop (N+1), dùng `{je_current_object_field}` đúng ngữ cảnh CCT/SQL/Repeater, bắt buộc phân trang/Load More và đánh index/Object Cache cho bảng lớn.

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
