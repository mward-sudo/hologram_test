defmodule Blog.Components.SiteHeader do
  use Hologram.Component

  alias Hologram.UI.Link

  def template do
    ~HOLO"""
    <header class="bg-white border-b border-gray-200 dark:!bg-gray-950 dark:border-gray-800">
      <nav class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex items-center justify-between">
          <Link to={Blog.HomePage} class="flex items-center space-x-3 group">
            <div class="w-10 h-10 bg-gradient-to-br from-indigo-600 to-blue-600 rounded-lg flex items-center justify-center text-white font-bold text-lg group-hover:shadow-md transition-shadow">
              B
            </div>
            <span class="text-xl font-bold text-gray-900 transition-colors group-hover:text-indigo-600 dark:text-gray-100 dark:group-hover:text-indigo-400">Blog</span>
          </Link>
          <Link to={Blog.HomePage} class="text-gray-700 hover:text-indigo-600 font-medium transition-colors dark:text-gray-300 dark:hover:text-indigo-400">
            Blog
          </Link>
        </div>
      </nav>
    </header>
    """
  end
end
