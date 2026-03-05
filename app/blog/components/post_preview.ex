defmodule Blog.Components.PostPreview do
  use Hologram.Component
  alias Hologram.UI.Link

  prop :post, :map

  def template do
    ~HOLO"""
    <article class="border-b border-gray-200 pb-8 last:border-b-0 dark:border-gray-800">
      <div class="flex flex-col">
        <h3 class="text-2xl font-bold text-gray-900 mb-2 hover:text-indigo-600 transition-colors dark:text-gray-100 dark:hover:text-indigo-400">
          <Link to={Blog.PostPage, id: @post.id}>
            {@post.title}
          </Link>
        </h3>
        {%if @post.excerpt}
          <p class="text-gray-700 leading-relaxed mb-4 dark:text-gray-300">{@post.excerpt}</p>
        {/if}
        <Link
          to={Blog.PostPage, id: @post.id}
          class="inline-flex items-center text-indigo-600 hover:text-indigo-700 font-medium group w-fit dark:text-indigo-400 dark:hover:text-indigo-300">
          Read more
          <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
          </svg>
        </Link>
      </div>
    </article>
    """
  end
end
