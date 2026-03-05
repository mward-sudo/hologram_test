defmodule Blog.PostPage do
  use Hologram.Page
  alias HologramTest.Repo
  alias HologramTest.Blog.Post

  route "/posts/:id"

  param :id, :integer

  layout Blog.MainLayout

  def init(params, component, _server) do
    post = Repo.get!(Post, params.id)
    put_state(component, :post, post)
  end

  def template do
    ~HOLO"""
    <article>
      <h1>{@post.title}</h1>
      <p>{@post.content}</p>

      <div class="likes">
        Likes: {@post.likes}
        <button $click="like_post">Like</button>
      </div>
    </article>
    """
  end

  def action(:like_post, _params, component) do
    # Update likes locally first for instant feedback
    component
    |> put_state([:post, :likes], component.state.post.likes + 1)
    |> put_command(:save_like, post_id: component.state.post.id)
  end

  def command(:save_like, params, server) do
    post = Repo.get!(Post, params.post_id)

    post
    |> Post.changeset(%{likes: post.likes + 1})
    |> Repo.update!()

    server
  end
end
