defmodule Test.PageController do
  use Test.Web, :controller

  #plug Openmize.Logout when action in [:logout]

  def index(conn, _params) do
    render conn, "index.html"
  end
end
