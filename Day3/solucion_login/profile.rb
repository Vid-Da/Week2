<% if(@username) %>
  hi <%= @username %> <br>
  <a href="/logout">logout</a>
<% else %>
  hi, you must login! <a href="/">Here</a>
<% end %>
