# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HologramTest.Repo.insert!(%HologramTest.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HologramTest.Repo
alias HologramTest.Blog.Post

Repo.insert!(%Post{
  title: "Getting Started with Elixir",
  excerpt: "A beginner's guide to the Elixir programming language.",
  content: "Elixir is a dynamic, functional language designed for building scalable and maintainable applications...",
  likes: 0
})

Repo.insert!(%Post{
  title: "Building Web Apps with Phoenix",
  excerpt: "How to build fast, reliable web applications using the Phoenix framework.",
  content: "Phoenix is a web framework built on top of Elixir that makes it easy to build high-performance web applications...",
  likes: 0
})

Repo.insert!(%Post{
  title: "Ecto: The Database Layer",
  excerpt: nil,
  content: "Ecto is a toolkit for data mapping and language-integrated queries for Elixir...",
  likes: 0
})
