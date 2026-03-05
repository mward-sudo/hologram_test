defmodule Blog.HomePage do
  use Hologram.Page
  alias Blog.Components.AuthorBadge
  alias Blog.Components.HomeHero
  alias Blog.Components.PostPreview
  alias HologramTest.Repo
  alias HologramTest.Blog.Post
  import Ecto.Query

  route "/"

  layout Blog.MainLayout

  def init(_params, component, _server) do
    posts = Repo.all(from p in Post, order_by: [desc: p.inserted_at])
    put_state(component, :posts, posts)
  end

  def template do
    ~HOLO"""
    <HomeHero />
    <AuthorBadge />

    <div class="space-y-8 max-w-2xl mx-auto">
      {%for post <- @posts}
        <PostPreview post={post} />
      {/for}
    </div>
    """
  end
end
