defmodule HologramTest.Repo do
  use Ecto.Repo,
    otp_app: :hologram_test,
    adapter: Ecto.Adapters.SQLite3
end
