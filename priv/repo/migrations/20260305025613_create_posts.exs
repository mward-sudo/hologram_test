defmodule HologramTest.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :excerpt, :string
      add :content, :text
      add :likes, :integer, default: 0, null: false

      timestamps()
    end
  end
end
