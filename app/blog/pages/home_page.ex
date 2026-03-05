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
    <div class="mb-16 text-center">
      <h1 class="text-5xl sm:text-6xl font-bold text-gray-900 mb-4 dark:text-gray-100">Welcome to my blog</h1>
      <p class="text-xl text-gray-600 max-w-2xl mx-auto dark:text-gray-400">Exploring technology, design, and personal growth through my experiences and insights. Join me on this journey of discovery.</p>
    </div>

    <div class="mb-12 text-center">
      <div class="flex justify-center mb-4">
        <div class="w-16 h-16 bg-gradient-to-br from-indigo-600 to-blue-600 rounded-full flex items-center justify-center text-white font-bold text-2xl">
          D
        </div>
      </div>
      <p class="text-lg font-semibold text-gray-900 dark:text-gray-100">Demo User</p>
      <p class="text-gray-600 text-sm dark:text-gray-400">A passionate tech enthusiast exploring web development</p>
    </div>

    <div class="space-y-8 max-w-2xl mx-auto">
      {%for post <- @posts}
        <PostPreview post={post} />
      {/for}
    </div>
    """
  end
end
