defmodule Blog.Components.HomeHero do
  use Hologram.Component

  def template do
    ~HOLO"""
    <div class="mb-16 text-center">
      <h1 class="text-5xl sm:text-6xl font-bold text-gray-900 mb-4 dark:text-gray-100">Welcome to my blog</h1>
      <p class="text-xl text-gray-600 max-w-2xl mx-auto dark:text-gray-400">Exploring technology, design, and personal growth through my experiences and insights. Join me on this journey of discovery.</p>
    </div>
    """
  end
end
