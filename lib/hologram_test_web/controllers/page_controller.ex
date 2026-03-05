defmodule HologramTestWeb.PageController do
  use HologramTestWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
