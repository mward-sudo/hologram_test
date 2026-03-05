defmodule Blog.Components.AuthorBadge do
  use Hologram.Component

  def template do
    ~HOLO"""
    <div class="mb-12 text-center">
      <div class="flex justify-center mb-4">
        <div class="w-16 h-16 bg-gradient-to-br from-indigo-600 to-blue-600 rounded-full flex items-center justify-center text-white font-bold text-2xl">
          D
        </div>
      </div>
      <p class="text-lg font-semibold text-gray-900 dark:text-gray-100">Demo User</p>
      <p class="text-gray-600 text-sm dark:text-gray-400">A passionate tech enthusiast exploring web development</p>
    </div>
    """
  end
end
