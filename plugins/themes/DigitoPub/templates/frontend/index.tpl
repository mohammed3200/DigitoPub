{**
 * templates/frontend/index.tpl
 *
 * Copyright (c) 2014-2021 OJS Public Knowledge Project
 * DigitoPub Theme Implementation
 *
 *}
{include file="frontend/components/header.tpl"}

<div class="pkp_page {$pagePreamble}">
	<div class="page_wrapper">
		
		{* --- HERO SECTION: CURRENT ISSUE PROMO --- *}
		<div class="digitopub_hero_wrapper">
			<div class="digitopub_hero_inner">
				{if $currentIssue}
					<div class="digitopub_hero_content">
						<h1 class="digitopub_hero_title">{translate key="issue.journalissue"}</h1>
						<div class="digitopub_hero_cover">
							{if $currentIssue->hasCoverImage()}
								<a href="{url page="issue" op="view" path=$currentIssue->getBestIssueId()}">
									<img src="{$currentIssue->getCoverImageUrl()|escape}" alt="{translate key="issue.coverPage.altText"}" class="img-fluid">
								</a>
							{/if}
						</div>
						<p class="digitopub_hero_meta">
							{if $currentIssue->getDatePublished()}{translate key="publication.datePublished"}: {$currentIssue->getDatePublished()|date_format:$dateFormatShort}{/if}
						</p>
						<a href="{url page="issue" op="current"}" class="btn btn-primary digitopub_hero_cta">{translate key="issue.currentIssue"}</a>
					</div>
				{else}
					<p>{translate key="current.noCurrentIssue"}</p>
				{/if}
			</div>
		</div>
		
		<div class="content_wrapper">
			<main class="digitopub_main" id="main-content">
				{block name="blocks_before_main"}
					{call_hook name="Templates::Frontend::Index::Content"}
				{/block}

				{* --- ANNOUNCEMENTS --- *}
				<div class="digitopub_announcements">
					<h2>{translate key="announcement.announcements"}</h2>
					{if $announcements}
						<ul class="digitopub_announcement_list">
							{foreach from=$announcements item=announcement name=announcements}
								<li class="digitopub_announcement_item">
									<h3 class="digitopub_announcement_title">
										<a href="{url page="announcement" op="view" path=$announcement->getId()}">{$announcement->getLocalizedTitle()|escape}</a>
									</h3>
									<p class="digitopub_announcement_date">{$announcement->getDatePosted()|date_format:$dateFormatShort}</p>
									<div class="digitopub_announcement_summary">{$announcement->getLocalizedDescription()|truncate:150:"..."}</div>
								</li>
							{/foreach}
						</ul>
					{else}
					<p>{translate key="announcement.noneExist"}</p>
					{/if}
					
					{if $publicAnnouncements}
					<div class="digitopub_view_all">
						<a href="{url page="announcement"}">{translate key="announcement.viewAll"}</a>
					</div>
					{/if}
				</div>
				
				{* --- INDEX JOURNAL DESCRIPTION --- *}
				{if $journalDescription}
					<div class="digitopub_description_section">
						<h2>{$currentJournal->getLocalizedTitle()|escape}</h2>
						<div class="digitopub_description_content">
							{$journalDescription}
						</div>
					</div>
				{/if}

			</main><!-- .digitopub_main -->

			<aside class="digitopub_sidebar" id="sidebar">
				{include file="frontend/components/sidebar.tpl"}
			</aside><!-- .digitopub_sidebar -->
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}