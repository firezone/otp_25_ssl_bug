defmodule Otp25SslBug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: :finch_app}
      # Starts a worker by calling: Otp25SslBug.Worker.start_link(arg)
      # {Otp25SslBug.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Otp25SslBug.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
