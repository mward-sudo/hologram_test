defmodule Blog.Components.SiteFooter do
  use Hologram.Component

  def template do
    ~HOLO"""
    <footer class="bg-white border-t border-gray-200 mt-16 py-12 dark:!bg-gray-950 dark:border-gray-800">
      <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <p class="text-gray-600 text-sm dark:text-gray-400">Demo Blog © 2026</p>
      </div>
    </footer>
    """
  end
end
