defmodule Blog.MainLayout do
  use Hologram.Component

  alias Blog.Components.SiteFooter
  alias Blog.Components.SiteHeader
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
        <SiteHeader />
        <main class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <slot />
        </main>
        <SiteFooter />
      </body>
    </html>
    """
  end
end
