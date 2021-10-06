<nav id="navigator" class="nav-container">
	<div class="collapse navbar-collapse" id="MainNav">
	  <ul class="nav">
            <% loop $Menu(1) %>
                <li class="$LinkingMode nav-item<% if $isCurrent || $isSection %> active<% end_if %>"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
            <% end_loop %>
	  </ul>
	</div>
</nav>
