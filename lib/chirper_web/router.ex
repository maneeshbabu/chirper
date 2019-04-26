defmodule ChirperWeb.Router do
  use ChirperWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChirperWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/user", UserController, only: [:create, :new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChirperWeb do
  #   pipe_through :api
  # end
end
