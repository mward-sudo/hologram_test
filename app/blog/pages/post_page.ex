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
    <article class="max-w-2xl mx-auto">
      <header class="mb-8">
        <h1 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4 leading-tight dark:text-gray-100">{@post.title}</h1>
      </header>

      <div class="prose prose-lg max-w-none mb-12">
        <p class="text-gray-800 leading-relaxed whitespace-pre-wrap text-lg dark:text-gray-300">{@post.content}</p>
      </div>

      <div class="mt-12 pt-8 border-t border-gray-200 dark:border-gray-800">
        <div class="flex items-center justify-between flex-col sm:flex-row gap-4">
          <div class="flex items-center space-x-2">
            <svg class="w-6 h-6 text-red-500" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
            </svg>
            <span class="text-lg font-semibold text-gray-900 dark:text-gray-100">{@post.likes}</span>
          </div>
          <button 
            $click="like_post" 
            class="px-6 py-2.5 bg-indigo-600 text-white font-medium rounded-lg hover:bg-indigo-700 active:bg-indigo-800 transition-colors shadow-sm hover:shadow-md">
            Like this post
          </button>
        </div>
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
