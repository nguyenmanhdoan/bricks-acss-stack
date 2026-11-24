# Changelog

Mọi thay đổi quan trọng của bộ skill `bricks-acss-stack` được ghi nhận tại đây theo chuẩn Semantic Versioning.

## [2.4.1] - 2026-11-24

### Changed
* **Tham chiếu chéo Stage 1 & Gate 1B sang `agency-web-design`:** Cập nhật `SKILL.md` và `references/novamira-design-workflow.md` để Stage 1 và Gate 1B tự động gọi skill đồng hành [`agency-web-design`](https://github.com/nguyenmanhdoan/agency-web-design) làm công cụ thiết kế chính (đa lĩnh vực, chuẩn dấu tiếng Việt, chống AI-slop, rubric Art Director và bàn giao CSS/ACSS/BEM 1-to-1).

## [2.4.0] - 2026-11-24

### Added
* **Tệp mới `references/wordpress-core-standards.md`:** Khóa cứng chuẩn WordPress Core khi triển khai Bricks Builder:
  * **WP Native Menu Mandate:** Đề xuất cây Menu Header & Footer theo chủ đề website để người dùng chốt -> tạo menu thật trong `Appearance > Menus` -> gọi trực tiếp qua Bricks `Nav Menu` / `Nav Nestable` / `WP Menu` (dùng chung 1 Primary Menu cho cả Desktop & Mobile Drawer), **tuyệt đối cấm hardcode Text Link**.
  * **ASE (Admin and Site Enhancements) Baseline:** Checklist cấu hình bắt buộc ngay Stage 2.1 (tắt XML-RPC, ẩn WP version, bật SVG Upload có sanitize, Image Upload Control, tắt Comments nếu không dùng, giới hạn revisions, kiểm tra ASE SMTP).
  * **Media Library & SVG Hygiene:** Bắt buộc gắn toàn bộ ảnh và SVG bằng **Media ID** trong Media Library (cấm hotlink URL ngoài), dùng duy nhất 1 bộ SVG icon đồng nhất `stroke-width`.
  * **Phối hợp WordPress Agent Skills:** Quy ước kết hợp chọn lọc với `wp-wpcli-and-ops` và `wp-performance` (không áp dụng quy tắc Gutenberg/Block Theme lên Bricks).
* **Gate 1B (Bắt buộc duyệt Mục lục + Demo hình ảnh cho Trang con & Dynamic Templates)** trong `SKILL.md` và `references/novamira-design-workflow.md`:
  * Chấm dứt tình trạng AI tự ý dựng template/trang con sơ sài (thiếu icon, thiếu ảnh) trên Bricks. Bắt buộc trình bày **Mục lục trang + Section Outline chi tiết** và xuất bản xem trước HTML/CSS (tái sử dụng `tokens.css` & `styles.css` đã duyệt) kèm ảnh chụp Desktop (`1440x900`) + Mobile (`390x844`) qua `playwright-cli` để user chốt mẫu trước khi build Bricks.
  * Bổ sung **Visual Richness Floor** chống dựng template trơ trụi.
* **Gate 2.1 — Cấu hình bắt buộc đủ 7 Plugin + Proof-of-State** trong `SKILL.md`, `references/novamira-pro-ops.md` và `references/acss-and-bem.md`:
  * Khóa cứng cấu hình đầy đủ ngay đầu Stage 2 cho cả 7 plugin: **NOVAMIRA** (đủ 3 trụ cột `Design` + `Memories` + `Site Skills` qua **MCP Novamira Pro OAuth**), **BRICKS**, **ACSS**, **AT** (TẮT AT Framework, BẬT bộ công cụ productivity), **ASE**, **SURERANK**, **JETENGINE**.
  * Áp dụng luật **Hard Stop** cho ACSS & AT (nếu không tự ghi/compile an toàn được thì phải dừng xuất JSON/thông số để user áp dụng) và yêu cầu **Proof-of-State** (đọc ngược option + kiểm tra `getComputedStyle` biến `--primary`, `--content-width` trên frontend qua `playwright-cli`).
* **JetEngine Minimalist Decision Matrix (Gate 2.2 — Anti-Overengineering)** trong `references/bricks-addons-and-jetengine.md`:
  * Bắt buộc trình bày bảng đề xuất Data Model (`WordPress Core` vs. `JetEngine`) cho user duyệt trước khi tạo bất kỳ CPT/CCT/Relation/Glossary/Options Page nào.
  * Khóa ranh giới rõ ràng: Blog dùng `Posts`, trang tĩnh dùng `Pages`, menu dùng `Appearance > Menus`, tối đa 1 JetEngine Options Page gọn cho Global Brand Info.
* **Form bắt buộc hoạt động thực tế (Contact Form & Footer Newsletter Form)** trong `SKILL.md` và `references/bricks-addons-and-jetengine.md`:
  * Trang Liên hệ bắt buộc có **Contact Form**; Footer bắt buộc có **Newsletter Form** (Bricks Native Form hoặc BricksForge Pro Forms), đủ validation, Honeypot/Turnstile, **Submission Storage** (không mất lead) và kiểm thử submit trong Stage 4 QA.

### Changed
* Cập nhật `SKILL.md` và `README.md` đồng bộ toàn bộ stack 7 plugin qua **MCP Novamira Pro (OAuth)** và cấu trúc thư mục mới.

## [2.3.3] - 2026-11-23

### Added
* **Quy tắc cứng Tuân thủ 100% nguyên bản Demo (Strict Fidelity to Approved Demo)** trong `SKILL.md`, `references/acss-and-bem.md` và `references/novamira-design-workflow.md`:
  * Cấm tuyệt đối AI tự ý thêm `border-radius`, viền (`border`), bóng đổ (`box-shadow`), nền phụ hoặc khung card trang trí lên hình ảnh, background và section khi bản Demo đã duyệt không có.
  * Bắt buộc trích xuất đúng thông số bề mặt (`border-radius`, `border`, `box-shadow`, `background`) từ bản Demo đã chốt và lưu ràng buộc vào **Novamira Memories** trước khi dựng Stage 2–3.

## [2.3.2] - 2026-11-23

### Added
* Thêm script `scripts/install-to-workspace.ps1` hỗ trợ cài gọn `bricks-acss-stack` vào `.agents/skills/` của từng dự án thiết kế website (phù hợp mô hình dùng cục bộ theo từng dự án web, để `marketing-seo-stack` chạy toàn cục hằng ngày).

## [2.3.1] - 2026-11-23

### Changed
* Nâng cấp chuyên sâu `references/humanize-copy.md` bằng tinh hoa chọn lọc từ `viet-humanize`, `blader/humanizer`, `humanizer-skill` và `humanize-skills`:
  * **Viết đúng ngữ cảnh (Context-Aware Register):** Giữ đúng sắc thái thương hiệu/xưng hô, không ép mọi nội dung thành văn ngắn hoặc suồng sã.
  * **Bảo toàn dữ kiện (Fact Preservation):** Cấm bịa số liệu/chứng nhận giả, cấm tự nâng mức khẳng định (*"có thể giảm"* -> *"giảm"*, *"hỗ trợ"* -> *"đảm bảo"*).
  * **Biên tập 2 lượt (Two-Pass Editing):** Lượt 1 lọc sáo ngữ, dấu `—`, mẫu câu *"Không chỉ X mà còn Y"* và bộ ba tính từ; Lượt 2 phá lặp cấu trúc (Anti-Convergence) giữa 8 bài/dự án mẫu và xóa kết bài đạo lý sáo rỗng.

## [2.3.0] - 2026-11-23

### Added
* Tệp mới `references/humanize-copy.md` tích hợp **quy chuẩn khử giọng văn AI (Humanize Copy)** cho cả tiếng Việt lẫn tiếng Anh (cấm các cụm từ sáo rỗng AI, ưu tiên số liệu/đầu việc cụ thể, nhịp câu tự nhiên, CTA rõ ràng, tuyệt đối không dùng Lorem Ipsum).
* **Bước 2.3 — Tạo dữ liệu mẫu đồng bộ (8 nội dung mẫu / loại + ảnh demo Media ID)** trong `SKILL.md`: thực hiện ngay sau khi chốt concept Trang chủ và dựng xong tầng dữ liệu JetEngine (trước khi dựng Bricks Templates & Trang con), tạo sẵn **8 mục mẫu cho mỗi loại nội dung động** (8 bài viết, 8 dự án, 8 sản phẩm...) phân bổ đều theo Taxonomy và Relations kèm ảnh đồng bộ bảng màu/phong cách để thiết kế lưới 2/3/4 cột, phân trang và bộ lọc mượt mà không vướng quy trình.

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
