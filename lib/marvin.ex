defmodule Marvin do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Marvin.Slack, [])
    ]

    opts = [strategy: :one_for_one, name: Marvin.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
