defmodule TlakauakWeb.Router do
  use TlakauakWeb, :router

  import TlakauakWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TlakauakWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TlakauakWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TlakauakWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: TlakauakWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", TlakauakWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update

    live "/promotores", PromotorLive.Index, :index
    live "/promotores/new", PromotorLive.Index, :new
    live "/promotores/:id/edit", PromotorLive.Index, :edit

    live "/promotores/:id", PromotorLive.Show, :show
    live "/promotores/:id/show/edit", PromotorLive.Show, :edit

    live "/coordinadores", CoordinadorLive.Index, :index
    live "/coordinadores/new", CoordinadorLive.Index, :new
    live "/coordinadores/:id/edit", CoordinadorLive.Index, :edit

    live "/coordinadores/:id", CoordinadorLive.Show, :show
    live "/coordinadores/:id/show/edit", CoordinadorLive.Show, :edit

    live "/colonias", ColoniaLive.Index, :index
    live "/colonias/new", ColoniaLive.Index, :new
    live "/colonias/:id/edit", ColoniaLive.Index, :edit

    live "/colonias/:id", ColoniaLive.Show, :show
    live "/colonias/:id/show/edit", ColoniaLive.Show, :edit
    
    live "/localidades", LocalidadLive.Index, :index
    live "/localidades/new", LocalidadLive.Index, :new
    live "/localidades/:id/edit", LocalidadLive.Index, :edit

    live "/localidades/:id", LocalidadLive.Show, :show
    live "/localidades/:id/show/edit", LocalidadLive.Show, :edit

    live "/promovidos", PromovidoLive.Index, :index
    live "/promovidos/new", PromovidoLive.Index, :new
    live "/promovidos/:id/edit", PromovidoLive.Index, :edit

    live "/promovidos/:id", PromovidoLive.Show, :show
    live "/promovidos/:id/show/edit", PromovidoLive.Show, :edit
  end

  scope "/", TlakauakWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email



  end

  scope "/", TlakauakWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :confirm
  end
end
