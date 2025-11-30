<?php

import('lib.pkp.classes.plugins.ThemePlugin');

class DigitoPubThemePlugin extends ThemePlugin {

	/**
	 * Register the theme.
	 * @param string $category
	 * @param string $path
	 * @param int $mainContextId
	 */
	public function register($category, $path, $mainContextId = null) {
		$success = parent::register($category, $path, $mainContextId);
		if ($success) {
			// Load the theme-specific styles
			$this->addStyle('theme-digitopub', 'styles/index.css');

			// Add a custom style that will only load on the front index page
			$this->addStyle('theme-digitopub-front', 'styles/front.css', array(
				'contexts' => array('frontend-index')
			));
			
			// Load JS (vanilla)
			$this->addScript('theme-digitopub-js', 'js/digitopub.js', array(
				'contexts' => array('frontend')
			));

			// Register additional template overrides for custom layouts
			// Note: OJS 3.x themes typically use `templates/frontend/` for global overrides
			// and specific path overrides for blocks, etc.
		}
		return $success;
	}

	/**
	 * Get the display name of the theme.
	 * @return string
	 */
	public function getDisplayName() {
		return 'DigitoPub Theme';
	}

	/**
	 * Get the description of the theme.
	 * @return string
	 */
	public function getDescription() {
		return 'A replication of the DigitoPub OJS theme using Smarty and vanilla PHP/JS.';
	}
}