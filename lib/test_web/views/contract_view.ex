defmodule Test.ContractView do
  use Test.Web, :view
  def render("scripts.html", _assigns) do
    ~s{<script>require("web/static/js/contracts").Contract.run()</script>}
    |> raw
  end
end
