<header role="banner" class="">
	<div class="">
		<div class="">
			<div class="">
				<p>
					<a href="$BaseHref" class="brand" rel="home">
                        <i class="icon"></i>
						<% if $SiteConfig.Logo %>
							$SiteConfig.Logo.ScaleHeight(80)
						<% else %>
							$SiteConfig.Title
						<% end_if %>
					</a>
				</p>
			</div>
			<div class="">
				<button class="" type="button" data-toggle="collapse" data-target="#MainNav" aria-controls="MainNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class=""></span>
				</button>
			</div>
			<div class="">
				<div class=""><% include Navigation %></div>
			</div>
		</div>
	</div>
</header>
