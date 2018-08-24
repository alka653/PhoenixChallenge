defmodule ProjectElixir.PageController do
  use ProjectElixir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
