defmodule HologramTest.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :excerpt, :string
    field :content, :string
    field :likes, :integer, default: 0

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :excerpt, :content, :likes])
    |> validate_required([:title])
  end
end
