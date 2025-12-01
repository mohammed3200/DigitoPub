# DigitoPub OJS 3 Theme

The DigitoPub OJS professional template is designed for use with OpenJournal systems. It is built using PHP and Smarty (compatible with the OJS template API).

## Features

* **OJS 3.3.0+ Compatibility**
* **Mobile-First Responsive Design**
* **RTL Support** for languages like Arabic (via `styles/index.scss` compilation)
* **Vanilla JS** for light interactivity (navigation).
* **Prominent Current Issue Hero Section**

## Prerequisites

* An OJS installation (v3.3.0 or higher).
* Node.js and npm (or yarn) for compiling the SCSS.

## Build Instructions (SCSS to CSS)

The theme uses SCSS and requires compilation to standard CSS before use.

1. **Install Dependencies:**
    You will need a standard SCSS compiler. Assuming you are in the `plugins/themes/DigitoPub/styles` directory:

    ```bash
    # You might use node-sass, dart-sass, or a custom build script.
    npm install -g sass # Install Dart Sass globally
    ```

2. **Compile SCSS:**
    Navigate to the theme root directory (`plugins/themes/DigitoPub/`).

    ```bash
    sass --update styles/index.scss:styles/index.css
    sass --update styles/front.scss:styles/front.css
    ```

    *Note: If you activate the RTL support in the SCSS, you might also need to generate a `rtl.css` file.*

## Installation Steps (OJS)

1. Place the `DigitoPub` folder into your OJS installation's `plugins/themes/` directory.
2. Log into your OJS journal as a Journal Manager or Site Administrator.
3. Go to **Settings -> Website -> Appearance**.
4. Find and select the **DigitoPub Theme** from the available themes.
5. Click **Save**.

## Configuration (Post-Installation)

1. **Hero Section Image:** Ensure you have a cover image set for your **Current Issue**. This image will be used in the prominent hero section on the homepage.
2. **Sidebar Blocks:** The design relies heavily on Custom Blocks (e.g., 'Editorial Board', 'Journal Menu', 'Analytics').
    * Go to **Settings -> Website -> Plugins -> Generic Plugins**.
    * Ensure the **Custom Block Manager** is enabled.
    * Create custom blocks to replicate the content seen in the demo page's sidebar. Assign them to the **Primary Sidebar** in **Settings -> Website -> Appearance -> Sidebar**.

## PHP Variable Assignment Example

To fully populate the `index.tpl` hero section, no extra PHP is strictly needed in the theme plugin, as the `$currentIssue` and `$announcements` variables are assigned by OJS core for the index page.

However, if you wished to simplify or extend this, you could add custom variable assignments in your `DigitoPubThemePlugin.inc.php`'s `init()` or `register()` method (not shown in the simplified version above) using the `TemplateManager::call_hook('TemplateManager::display')` hook, but for the index page, the core variables are sufficient.

**OJS Core Variables used (No extra PHP needed):**

```php
// These variables are assigned by OJS core for the frontend index page:
$currentIssue;   // Accessible as Smarty variable {$currentIssue}
$announcements;  // Accessible as Smarty variable {$announcements}

// The core index handler also assigns the journal description:
$templateMgr->assign('journalDescription', $journal->getLocalizedDescription());
```
