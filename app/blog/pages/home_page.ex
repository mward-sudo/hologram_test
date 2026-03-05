defmodule Blog.HomePage do
  use Hologram.Page
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
    <h1>Welcome to my Blog</h1>

    <div class="posts">
      {%for post <- @posts}
        <PostPreview post={post} />
      {/for}
    </div>
    """
  end
end
