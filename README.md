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
│   └── surerank-seo.md                      # Chuẩn SEO On-page & Schema JSON-LD duy nhất trên SureRank
├── README.md
└── LICENSE
```

## Cài đặt cho Google Antigravity

### Cách 1: Cài toàn cục (dùng cho mọi dự án trên máy)

```powershell
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git "$env:USERPROFILE\.gemini\config\skills\bricks-acss-stack"
```

### Cách 2: Cài cục bộ theo từng dự án

```powershell
git clone https://github.com/nguyenmanhdoan/bricks-acss-stack.git ".agents/skills/bricks-acss-stack"
```

### Cách 3: Cài qua CLI (`npx skills`)

```bash
npx skills add nguyenmanhdoan/bricks-acss-stack
```

## Điểm nổi bật

* **Bám sát tài liệu chính chủ:** Tổng hợp quy chuẩn từ Novamira Docs (`novamira.ai/docs/`), Bricks Academy (`academy.bricksbuilder.io`) và Automatic.css.
* **Tiết kiệm Context Window:** Áp dụng Progressive Disclosure — chỉ nạp tệp tham chiếu tương ứng với tác vụ đang thực hiện.
* **An toàn khi thao tác Production:** Bắt buộc đọc trạng thái site thật và Novamira Memories trước khi ghi, tôn trọng Read Mode trên Production và kích hoạt Strict Editor View của Advanced Themer trước khi bàn giao khách hàng.
