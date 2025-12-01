{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 OJS Public Knowledge Project
 * DigitoPub Theme Implementation
 *
 *}
<!DOCTYPE html>
<html lang="{$currentJournal->getPrimaryLocale()|replace:'_':'-'}"{if $currentJournal->getPrimaryLocale()|substr:0:2 == 'ar'} dir="rtl"{/if}>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	{include file="frontend/components/headerHead.tpl"}
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/DigitoPub/styles/index.css" type="text/css" />
	{* Add a RTL-specific stylesheet if needed, or rely on CSS pre-processor *]
	{if $currentJournal->getPrimaryLocale()|substr:0:2 == 'ar'}
		<link rel="stylesheet" href="{$baseUrl}/plugins/themes/DigitoPub/styles/rtl.css" type="text/css" />
	{/if}
</head>
<body class="pkp_application_page {$templateMgr->getBodyClass()|escape}">

	<div id="digitopub_body_wrapper">
		
		{* --- TOP BAR / COOKIE NOTICE (Optional) ---
		<div class="digitopub_top_bar">... cookie notice a la the demo ...</div>
		*}
		
		{* --- HEADER/BRANDING/ISSN --- *}
		<header class="digitopub_header container">
			<div class="digitopub_logo_area">
				{include file="frontend/components/app_logo.tpl"}
			</div>
			<div class="digitopub_header_meta">
				{if $currentJournal->getData('onlineIssn')}
					<span class="digitopub_issn digitopub_issn_online">
						<span class="label">Online ISSN:</span>
						{$currentJournal->getData('onlineIssn')|escape}
					</span>
				{/if}
				{if $currentJournal->getData('printIssn')}
					<span class="digitopub_issn digitopub_issn_print">
						<span class="label">Print ISSN:</span>
						{$currentJournal->getData('printIssn')|escape}
					</span>
				{/if}
				<a href="{url page="login"}" class="btn btn-sm btn-outline-secondary digitopub_login_link">
					{translate key="user.login"}
				</a>
			</div>
		</header>
		
		{* --- MAIN NAVIGATION --- *}
		<nav class="digitopub_navigation_bar" id="main-navigation">
			<div class="container digitopub_navbar_inner">
				<button class="navbar-toggler" type="button" aria-label="{translate key="common.navigation.toggle"}">
					<span class="fa fa-bars"></span>
					{translate key="common.menu"}
				</button>
				
				<ul class="digitopub_nav_list list-unstyled">
				{* Standard OJS pages *}
					<li class="digitopub_nav_item"><a href="{url page="index"}">{translate key="navigation.home"}</a></li>
					<li class="digitopub_nav_item"><a href="{url page="issue" op="current"}">{translate key="issue.current"}</a></li>
					<li class="digitopub_nav_item"><a href="{url page="issue" op="archive"}">{translate key="archive.archives"}</a></li>
					<li class="digitopub_nav_item"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
					<li class="digitopub_nav_item"><a href="{url page="about"}">{translate key="about.aboutTheJournal"}</a></li>
					
					{* Search form in the nav bar *}
					<li class="digitopub_nav_item digitopub_search_item">
                        {include file="frontend/components/searchForm.tpl"}
					</li>
				</ul>
			</div>
		</nav>
	
		<div class="digitopub_content_area container">