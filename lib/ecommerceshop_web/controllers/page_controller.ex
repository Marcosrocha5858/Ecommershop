defmodule EcommerceshopWeb.PageController do
  use EcommerceshopWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
