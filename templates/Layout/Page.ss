<div>
    <div class="container">
        <div class="row">
            <% if $Menu(2) || $SideBarView.Widgets %>
                <% include SideBar %>
            <% end_if %>

            <div class="content-container" role="main">
                <article>
                    <div class="content">
                        $ElementalArea
                    </div>
                </article>
            </div>
        </div>
    </div>
</div>

