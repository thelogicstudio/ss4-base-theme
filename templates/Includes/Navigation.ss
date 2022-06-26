<nav id="navigator" class="nav-container">
    <div class="collapse navbar-collapse" id="MainNav">
        <ul class="nav-primary">
            <% loop $Menu(1) %>
            <li class="$LinkingMode nav-item<% if $isCurrent || $isSection %> active<% end_if %>">
                <a href="$Link" title="$Title.XML">$MenuTitle.XML</a>

                <% if $Children %>
                    <ul class="nav-secondary">
                        <% loop $Children %>
                            <li class="<% if $isCurrent || $isSection %> active<% end_if %> nav-item nav-item-secondary">
                                <a href="$Link"
                                   <% if $RedirectionType == "External" %>target="_blank"<% end_if %>>$MenuTitle</a>
                            </li>
                        <% end_loop %>
                    </ul>
                </li>
                <% end_if %>
            <% end_loop %>
        </ul>
    </div>
</nav>
