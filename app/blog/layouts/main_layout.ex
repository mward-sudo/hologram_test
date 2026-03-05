defmodule Blog.MainLayout do
  use Hologram.Component

  alias Hologram.UI.Link
  alias Hologram.UI.Runtime
  import Hologram.Router.Helpers, only: [asset_path: 1]

  def template do
    ~HOLO"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Blog</title>
        <link rel="stylesheet" href={asset_path("assets/css/app.css")} />
        <Runtime />
        <script defer type="text/javascript" src={asset_path("assets/js/app.js")}></script>
      </head>
      <body class="bg-white text-gray-900 antialiased transition-colors dark:!bg-gray-950 dark:text-gray-100">
        <header class="bg-white border-b border-gray-200 dark:!bg-gray-950 dark:border-gray-800">
          <nav class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
            <div class="flex items-center justify-between">
              <Link to={Blog.HomePage} class="flex items-center space-x-3 group">
                <div class="w-10 h-10 bg-gradient-to-br from-indigo-600 to-blue-600 rounded-lg flex items-center justify-center text-white font-bold text-lg group-hover:shadow-md transition-shadow">
                  B
                </div>
                <span class="text-xl font-bold text-gray-900 transition-colors group-hover:text-indigo-600 dark:text-gray-100 dark:group-hover:text-indigo-400">Blog</span>
              </Link>
              <div class="flex items-center space-x-8">
                <Link to={Blog.HomePage} class="text-gray-700 hover:text-indigo-600 font-medium transition-colors dark:text-gray-300 dark:hover:text-indigo-400">
                  Blog
                </Link>
              </div>
            </div>
          </nav>
        </header>
        <main class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <slot />
        </main>
        <footer class="bg-white border-t border-gray-200 mt-16 py-12 dark:!bg-gray-950 dark:border-gray-800">
          <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <p class="text-gray-600 text-sm dark:text-gray-400">Demo Blog © 2026</p>
          </div>
        </footer>
      </body>
    </html>
    """
  end
end
