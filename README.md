# Bricks + ACSS + JetEngine + SureRank Agent Skill (via MCP Novamira Pro)

Skill chuẩn hóa theo đặc tả **Agent Skills** (Progressive Disclosure) dành cho **Google Antigravity**, Claude Code và Cursor khi thiết kế, xây dựng và vận hành website WordPress trên bộ stack:

* **Lõi cố định (100% dự án):** WordPress + Bricks Builder + Automatic.css (ACSS) + Advanced Themer + JetEngine + SureRank SEO qua **MCP Novamira Pro**.
* **Add-on tùy chọn theo dự án:** BricksForge (Pro Forms, GSAP) và BricksExtras (tự động kiểm tra trạng thái cài đặt trước khi sử dụng).

## Cấu trúc thư mục

```text
bricks-acss-stack/
├── SKILL.md                                 # Quy tắc lõi & điều hướng Progressive Disclosure
├── references/
│   ├── novamira-pro-ops.md                  # Quy trình vận hành MCP Novamira Pro (Abilities Hub, Read Mode, Memories)
│   ├── novamira-design-workflow.md          # Quy trình Novamira Design & thiết kế web mới chống AI slop
│   ├── bricks-academy-core.md               # Chuẩn Bricks Academy (Components, Cascade Layers, Interactions, Code Signatures)
│   ├── acss-and-bem.md                      # Hệ biến ACSS, BEM, tách vai Advanced Themer & Strict Editor View
│   ├── bricks-addons-and-jetengine.md       # JetEngine (CPT/CCT/Relations/Query Builder) & BricksForge/BricksExtras
│   ├── surerank-seo.md                      # Chuẩn SEO On-page & Schema JSON-LD duy nhất trên SureRank
│   └── humanize-copy.md                     # Khử giọng văn AI (Humanize) & chuẩn tạo 8 nội dung mẫu/loại kèm ảnh demo
├── README.md
├── CHANGELOG.md
└── LICENSE
```

## Cài đặt

### 1. Google Antigravity

**Cài toàn cục (dùng cho mọi dự án trên máy):**

```powershell
# Windows (PowerShell)
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git "$env:USERPROFILE\.gemini\config\skills\bricks-acss-stack"
```

```bash
# macOS / Linux
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git "$HOME/.gemini/config/skills/bricks-acss-stack"
```

### 2. OpenAI Codex (Codex App / Codex CLI)

**Cài toàn cục (dùng cho mọi dự án trên máy):**

```powershell
# Windows (PowerShell)
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git "$env:USERPROFILE\.codex\skills\bricks-acss-stack"
```

```bash
# macOS / Linux
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git "$HOME/.codex/skills/bricks-acss-stack"
```

### 3. Cài cục bộ theo từng dự án (dùng chung cho cả Antigravity & Codex)

```powershell
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git ".agents/skills/bricks-acss-stack"
```

### 4. Cài nhanh qua CLI (`npx skills`)

```bash
npx skills add nguyenmanhdoan/bricks-acss-stack
```

### Cập nhật phiên bản mới

Chạy `git pull` trong thư mục skill đã cài:

```powershell
git -C "$env:USERPROFILE\.gemini\config\skills\bricks-acss-stack" pull
git -C "$env:USERPROFILE\.codex\skills\bricks-acss-stack" pull
```

## Điểm nổi bật

* **Hỗ trợ quy trình 2 chế độ (FE Demo -> WordPress 1-1):** Hỗ trợ dựng nhanh bản **FE Demo tĩnh** thuần HTML5/CSS/JS (dùng đúng tên biến ACSS + BEM + `design-system.json` chuẩn DTCG) để chốt giao diện với khách trước, sau đó chuyển đổi 1-1 sang Bricks Components, ACSS và JetEngine qua MCP Novamira Pro mà không phải viết lại CSS.
* **Bám sát tài liệu chính chủ:** Tổng hợp quy chuẩn từ Novamira Docs (`novamira.ai/docs/`), Bricks Academy (`academy.bricksbuilder.io`) và Automatic.css.
* **Tiết kiệm Context Window:** Áp dụng Progressive Disclosure — chỉ nạp tệp tham chiếu tương ứng với tác vụ đang thực hiện.
* **An toàn khi thao tác Production:** Bắt buộc đọc trạng thái site thật và Novamira Memories trước khi ghi, tôn trọng Read Mode trên Production và kích hoạt Strict Editor View của Advanced Themer trước khi bàn giao khách hàng.

## Lịch sử cập nhật

Xem chi tiết các phiên bản thay đổi tại [CHANGELOG.md](./CHANGELOG.md).
