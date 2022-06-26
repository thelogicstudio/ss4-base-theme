<header role="banner">
    <div class="logo-container">
        <a href="$BaseHref" class="logo" rel="home">
            <% if $SiteConfig.Logo %>
                $SiteConfig.Logo.ScaleHeight(80)
            <% else %>
                $SiteConfig.Title
            <% end_if %>
        </a>
    </div>

    <div class="header-navigation">
        <button id="menu-toggle" class="hamburger hamburger--spin" type="button">
              <span class="hamburger-box">
                <span class="hamburger-inner"></span>
              </span>
        </button>

        <% include Navigation %>
    </div>
</header>