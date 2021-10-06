<!doctype html>

	<!--[if !IE]><!-->
	<html lang="$ContentLocale">
	<!--<![endif]-->
	<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
	<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
	<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->
	<head>
		<% base_tag %>
		<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> | $SiteConfig.Title</title>
        <link rel="shortcut icon" href="/favicon.ico">

		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		$MetaTags(false)
		<!--[if lt IE 9]>
		<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<% if $FeaturedImage %><meta property="og:image" content="{$BaseHref}{$FeaturedImage.SetWidth(550).FileName}" />
		<% else_if $Image %><meta property="og:image" content="{$BaseHref}{$Image.SetWidth(550).FileName}" />
		<% else_if $Images.exists %><meta property="og:image" content="{$BaseHref}{$Images.first.SetWidth(550).FileName}" />
		<% else_if $Parent.FeaturedImage %><meta property="og:image" content="{$BaseHref}{$Parent.FeaturedImage.SetWidth(550).FileName}" />
		<% else_if $SiteConfig.Logo %><meta property="og:image" content="{$BaseHref}{$SiteConfig.Logo.SetWidth(550).FileName}" />
		<% end_if %>


		<% include Requirements %>
	</head>
	<body class="$ClassName" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>

		<% include Header %>

		<div class="main<% if $Level(2) %> sublevel<% end_if %> typography" role="main">
            $Layout
		</div>

		<% include Footer %>

	</body>
</html>
