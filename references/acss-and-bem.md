# Automatic.css (ACSS), BEM & Advanced Themer Reference

Use this reference when configuring ACSS & Advanced Themer at **Stage 2.1**, authoring Bricks global classes, custom CSS, layouts, and theme styles, and locking the site for client handoff.

## 1. Automatic.css (ACSS) Core Token System

ACSS tokens are context-agnostic (pure scale, not property-specific). Always verify the site's active ACSS configuration via MCP Novamira Pro and frontend `getComputedStyle` before writing CSS.

* **Spacing (`--space-*`):**
  * Scale: `--space-xxs`, `--space-xs`, `--space-s`, `--space-m`, `--space-l`, `--space-xl`, `--space-xxl`
  * Usage: `padding: var(--space-m);`, `gap: var(--space-l);`, `margin-block-end: var(--space-s);`
  * Never use invented property-prefixed tokens like `--pad-m` or `--margin-s`.
* **Section & Container Spacing:**
  * Section block padding: `--section-space-xs`, `--section-space-s`, `--section-space-m`, `--section-space-l`, `--section-space-xl`
  * Gutter / inline page padding: `--gutter` or `--content-gap` (check active ACSS settings)
  * Content width: `--content-width`
* **Typography (`--text-*` and `--h1`..`--h6`):**
  * Body scale: `--text-xs`, `--text-s`, `--text-m`, `--text-l`, `--text-xl`, `--text-xxl`
  * Heading scale: `--h1`, `--h2`, `--h3`, `--h4`, `--h5`, `--h6`
  * Line-height / measure: `--text-m-lh`, `--content-width-safe`, or semantic ch widths (`max-width: 65ch;`)
* **Colors (Contextual & Brand — Zero Off-Palette Lock):**
  * Brand palettes: `--primary`, `--secondary`, `--accent`, `--base`, `--neutral`, `--shade`
  * Transparencies & shades (when enabled in ACSS): `--primary-dark`, `--primary-light`, `--primary-ultra-light`, `--primary-trans-10` .. `--primary-trans-90`
  * Semantic tokens: `--bg-ultra-light`, `--bg-light`, `--bg-dark`, `--text-dark`, `--text-light`, `--white`, `--black`
  * **Strict Palette Lock:** Only use colors explicitly approved in the project concept / **Novamira Design** record. Never write raw hex/rgb/hsl values in Bricks settings or `%root%` CSS, never pull unconfigured default ACSS color slots (e.g., default blue/purple), and set SVG icon `fill`/`stroke` to `currentColor` or an approved ACSS variable.
* **Border Radius & Borders (Demo-Gated Only):**
  * `--radius-xs`, `--radius-s`, `--radius-m`, `--radius-l`, `--radius-xl`, `--radius-50`, `--radius-circle`
  * `--border-width`, `--border-color`
  * **Strict Fidelity Rule:** Only apply `--radius-*`, borders, or shadows when explicitly present in the approved FE Demo / Novamira Design record. If the approved demo uses sharp `0px` corners or borderless images/sections, **never** default to `var(--radius-m)` or decorative card borders/shadows.
* **Grid Utilities (ACSS Classes):**
  * Standard grids: `.grid--2`, `.grid--3`, `.grid--4`, `.grid--auto-2`, `.grid--auto-3`
  * Responsive overrides: `.grid--l-2`, `.grid--m-1`, `.grid--s-1`
  * Gaps: `.gap--xs`, `.gap--s`, `.gap--m`, `.gap--l`

## 2. Stage 2.1 Mandatory ACSS + AT Configuration Verification Checklist

Never begin building Templates or Pages while ACSS or AT remain at factory defaults. Verify every item below during **Stage 2.1** (and **Hard Stop** for user import if direct writes cannot safely recompile ACSS/AT):

* **ACSS Verified & Recompiled:**
  * Website Width (`--content-width`) and Breakpoints synced with Bricks Settings.
  * Root Font Size (`62.5%` or `100%` — locked consistently in Novamira Memories).
  * Brand Palette (`primary`, `secondary`, `accent`, `base`, `neutral`, `shade`) + shades/transparencies matching `design-system.json`.
  * Heading (`h1`–`h6`) & Body Typography Scale, Font Families, and Spacing Scale applied.
  * Default Border Radius & Button/Form tokens matching approved Demo (e.g., `0px` if sharp editorial demo).
  * **Frontend Proof-of-State:** After regenerating ACSS & Bricks CSS, verify via `playwright-cli` `eval` that `getComputedStyle(document.documentElement).getPropertyValue('--primary')` and `--content-width` return the exact approved values (proving CSS regenerated, not just saved in DB).
* **Advanced Themer (AT) Verified:**
  * **AT Framework = OFF** (Global Colors, Fluid Typography, Fluid Spacing, AT Dark Mode, Container overrides all disabled).
  * **AT Productivity Tools = ON** (BEM Class Generator, Variable Picker synced with ACSS, Superpower CSS, Class Manager, ID Lock, Plain Classes / Quick Search).

## 3. BEM Naming & Styling Rules in Bricks

* **When to use BEM Global Classes:** Any repeatable component (cards, hero sections, pricing tables, testimonials, feature rows, headers, footers).
* **When to use ACSS Utility Classes:** Pure layout scaffolding (`.grid--3`, `.gap--m`, `.bg--neutral-ultra-light`) or quick one-off spacing adjustments that do not belong to a reusable component.
* **Naming Format:**
  * Block: `.service-card`
  * Element (max 1 level deep): `.service-card__title`, `.service-card__media`, `.service-card__cta`
  * Modifier: `.service-card--featured`, `.service-card--dark`
  * Avoid deep chains like `.service-card__body__header__title`.
* **Bricks Custom CSS (`%root%`):**
  * Always scope component CSS using `%root%` inside the Bricks Global Class CSS field so Bricks compiles it to the class selector cleanly.
  * Example:
    ```css
    %root% {
      display: flex;
      flex-direction: column;
      padding: var(--space-l);
      gap: var(--space-m);
      background-color: var(--white);
    }
    %root%:hover .service-card__title {
      color: var(--primary);
    }
    ```

## 4. Advanced Themer + ACSS Coexistence Rules

**Golden Rule:** **ACSS** is the single CSS framework & token engine; **Advanced Themer (AT)** is strictly the Builder UX & productivity layer. Never run both frameworks simultaneously.

* **MUST DISABLE in Advanced Themer (Prevent Overlap with ACSS):**
  * **AT Framework:** Keep completely disabled (do not enable AT Global Colors, AT Fluid Typography/Spacing generators, or AT Framework auto-populated Theme Styles).
  * **AT Dark Mode / Color Scheme:** Keep disabled if ACSS Color Scheme is handling light/dark tokens.
  * **Layout Width / Section Overrides:** Do not let AT override container width or section padding managed by ACSS (`--content-width`, `--section-space-*`).
* **KEEP ENABLED in Advanced Themer (High-Value Workflow Tools):**
  * **BEM Class Generator / Class Converter:** Rapidly generate `.block__element` Global Classes from the Structure Panel.
  * **Variable Picker (Synced with ACSS):** Read/pick ACSS variables directly inside Bricks input fields without memorizing names.
  * **Superpower CSS & Code Recipes:** Autocomplete ACSS variables inside `%root%` custom CSS.
  * **Class Manager & Strict Editor / ID Lock:** Enforce styling on Global Classes rather than element `#id` and audit/clean unused classes.
  * **Builder UX Tweaks:** Quick Search, Structure Panel helpers, and Plain Classes for fast ACSS layout utility assignment (`.grid--3`, `.gap--m`).
* **Class & Variable Hygiene:** Before creating a new Bricks global class via MCP Novamira Pro, inspect existing global classes to avoid near-duplicates (e.g., `.hero-card` vs `.hero-cards`), and follow the site's configured Bricks breakpoints.

## 5. Client Handoff — Strict Editor View (Advanced Themer)

Before handing a completed website over to the client, configure **Strict Editor View** in Advanced Themer to protect the design system:

* **Role-Based Scoping:** Enable Strict Editor View for client-facing WordPress roles (e.g., `Editor` or a dedicated `Client` role) while preserving full Bricks Builder access for `Administrator` / agency accounts.
* **Lock Design & ACSS/BEM Classes:** Hide complex Bricks controls (Style tab, Global Class manager, Custom CSS, Theme Styles, Code elements, and ACSS utility/BEM class editing) so clients cannot accidentally remove ACSS classes, override tokens, or break responsive layouts.
* **Content-Only Editing:** Leave only safe content controls accessible (text, images, links, and exposed Bricks Component Properties / JetEngine CPT fields) so clients can update copy and media independently without risking layout regressions.
