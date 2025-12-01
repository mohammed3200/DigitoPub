{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2021 OJS Public Knowledge Project
 * DigitoPub Theme Implementation
 *
 *}
{call_hook name="Templates::Frontend::Footer::PageFooter"}

			<footer class="digitopub_footer">
				<div class="digitopub_footer_top row">
					{* ADDRESS & CONTACT - Hardcoded for demo, but typically in custom blocks or settings *}
					<div class="col-md-4 digitopub_footer_col">
						<h4>{translate key="user.contact"}</h4>
						<p><strong>{translate key="common.address"}</strong></p>
						<address>
							Via T. di Joannuccio 1<br>
							05100 Terni (TR), California
						</address>
					</div>
					<div class="col-md-4 digitopub_footer_col">
						<h4>{translate key="about.contact"}</h4>
						<p>
							<strong>{translate key="manager.editors"}</strong><br>
							(+01) 3499888576 (Editorial Office)
						</p>
						<p>
							<strong>{translate key="common.management"}</strong><br>
							(+73) 3676565476 (ED Marketing & Communication)
						</p>
					</div>
					<div class="col-md-4 digitopub_footer_col">
						{* FOOTER IMAGE - Use a Static Block or setting in a real theme *}
						<img src="{image url="demo_footer.png"}" alt="{translate key="common.logo"}">
					</div>
				</div>
				
				<div class="digitopub_footer_bottom">
					<p class="digitopub_copyright">
						{translate key="contact.copyright"} &copy; {$smarty.now|date_format:"%Y"} {$currentJournal->getLocalizedTitle()|escape}, {translate key="frontend.copyright.rights.reserved"}.
						{* Licensing info - Important to include for OJS *}
						<br>
						{if $currentJournal->getLocalizedData('licenseUrl')}
							<a href="{$currentJournal->getLocalizedData('licenseUrl')|escape}">
								{translate key="manager.publication.license"}
							</a>
						{/if}
						{* Theme credit (Optional for a real theme, included here for completeness) *}
						<span class="digitopub_theme_credit">Site using <strong>DigitoPub Theme</strong>.</span>
					</p>
					{include file="frontend/components/siteStats.tpl"}
				</div>

			</footer>

		</div>{* end .digitopub_content_area *}
	</div>{* end #digitopub_body_wrapper *}

	{* JS will be loaded here by OJS hooks *}
	{call_hook name="Templates::Frontend::Body::Footer"}
	</body>
</html>