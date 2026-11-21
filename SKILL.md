---
name: bricks-acss-stack
description: >-
  Use this skill whenever designing, building, auditing, or modifying WordPress
  websites built with Bricks Builder, Automatic.css (ACSS), Advanced Themer,
  BricksForge, BricksExtras, JetEngine, and SureRank SEO via MCP Novamira Pro.
  Activate for Bricks layout/template/component creation, ACSS variable & BEM
  styling, JetEngine CPT/CCT/Query Loop integration, BricksForge Pro Forms/GSAP,
  BricksExtras interactive UI, SureRank SEO/Schema setup, or WordPress site
  operations through Novamira Pro.
---

# Bricks Builder + ACSS + JetEngine + SureRank Stack (via MCP Novamira Pro)

Standard operating procedures and architectural guardrails for building production WordPress websites on this stack without CSS bloat, hardcoded values, or broken dynamic data.

## Core Architecture Rules (Always Enforced)

1. **Read Live State & Memories First (Novamira Pro Gate):**
   Before creating or editing anything via MCP Novamira Pro, read **Novamira Memories** and inspect the live WordPress site (Abilities Hub, Read Mode status, installed plugins, existing Bricks global classes/components, active ACSS tokens, JetEngine CPTs/fields, and SureRank settings). Always use Novamira Pro's native **Bricks Specialization abilities** instead of raw PHP/HTML hacks so pages, templates, and components stay 100% editable in Bricks. Never guess meta keys or class IDs.
2. **Semantic Bricks Structure First:**
   Use native Bricks semantic elements (`section` > `container` > `block` / `div`, proper HTML tags `header`, `main`, `article`, `nav`, `footer`, `ul`/`li`) with clean DOM depth. Never wrap unnecessary `div` layers.
3. **ACSS Variables + BEM Over Raw Values:**
   - Never hardcode pixel/rem values for spacing, font sizes, radii, or colors when an ACSS token exists (`var(--space-m)`, `var(--text-l)`, `var(--radius-m)`, `var(--primary)`).
   - Never inject Tailwind utility classes or inline `style=""` attributes.
   - Style reusable components on **Bricks Global Classes** following BEM (`.block`, `.block__element`, `.block--modifier`), never on Bricks element `#id` unless for a truly one-off layout override.
4. **Native Tooling Priority & Plugin Availability:**
   - **Core Stack (100% of projects):** Bricks Builder + Automatic.css (ACSS) + Advanced Themer + **JetEngine** (CPT, CCT, Meta Boxes, Relations, Query Builder, Listing) + **SureRank** (sole SEO & JSON-LD Schema source) via **MCP Novamira Pro**.
   - **Optional Add-ons (Project-Dependent):** **BricksForge** (Pro Forms, GSAP Timeline) and **BricksExtras** (Modal, OffCanvas, Mega Menu, Pro Accordion, TOC, Popover). Always verify via Novamira Pro whether each add-on is installed and active on the target site before using its elements; if not installed, use native Bricks Builder elements + clean CSS/JS instead.
5. **Safe Production Operations:**
   Prefer staging or draft status for structural page/template changes. Verify rendered output (and check console/Core Web Vitals if Chrome DevTools is available) after writing via Novamira Pro.

## Workflow Steps

1. **Inspect Context via Novamira Pro:**
   Verify target post/template ID, existing Bricks global classes, ACSS variables, and JetEngine/SureRank configuration.
2. **Load Only Relevant Reference Files:**
   - Site-wide MCP Novamira Pro operations (Abilities Hub, Read Mode, Memories, Bricks Specialization, WP-CLI, cache): read [novamira-pro-ops.md](./references/novamira-pro-ops.md)
   - New website design & anti-AI-slop workflow (**Novamira Design** record, palette/typography/don'ts, component-first build, visual audit): read [novamira-design-workflow.md](./references/novamira-design-workflow.md)
   - Bricks Builder core architecture (Components & Properties, Cascade Layers, Interactions, Query Loop, `{echo:}` allowlist, Code Signatures): read [bricks-academy-core.md](./references/bricks-academy-core.md)
   - Styling, ACSS variables, BEM, Advanced Themer: read [acss-and-bem.md](./references/acss-and-bem.md)
   - JetEngine (100% core) & optional BricksForge/BricksExtras: read [bricks-addons-and-jetengine.md](./references/bricks-addons-and-jetengine.md)
   - SureRank SEO & Schema standards: read [surerank-seo.md](./references/surerank-seo.md)
3. **Design & Implement:**
   Build clean Bricks element trees, attach BEM global classes with ACSS tokens, bind JetEngine dynamic tags/queries, and configure SureRank metadata.
4. **Verify Before Completion:**
   - Confirm no raw hardcoded colors/spacing where ACSS tokens apply.
   - Confirm single `<h1>` per page, valid heading hierarchy (`h1` -> `h2` -> `h3`), accessible contrast and alt attributes.
   - Confirm Bricks JSON/CSS regenerated cleanly and no PHP/JS console errors occur.
   - **Pre-Handoff Check:** Before client delivery, verify Advanced Themer's **Strict Editor View** is enabled for client roles (hiding complex Bricks panels and locking ACSS/BEM classes so clients can only edit text/media safely).
