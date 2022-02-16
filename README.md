# ExqUI

*This is an updated dependency which will work with phoenix_live_view 0.17.x*

ExqUI provides a UI dashboard for [Exq](https://github.com/akira/exq), a job processing library
compatible with Resque / Sidekiq for the Elixir language. ExqUI allow
you to see various job processing stats, as well as details on failed,
retried, scheduled jobs, etc.

## Configuration

1. ExqUI depends on the [api server](https://hexdocs.pm/exq/Exq.Api.html#content) component of the [exq](https://github.com/akira/exq). The
   user of ExqUI is expected to start the Exq with proper config. The
   only config required on ExqUI side is the name of the api
   server. It's set to Exq.Api by default.

   ```elixir
   config :exq_ui,
     api_name: Exq.Api
   ```
   There are two typical scenarios

   If ExqUI is embedded in a worker node which runs exq jobs, then
   nothing special needs to be done. Exq by default starts the api
   server on all worker nodes.

   If ExqUI needs to be embedded in a node which is not a worker, then
   Exq can be started in `api` mode, which will only start the api
   gen server and will not pickup jobs for execution. This can be done
   by configuring the `mode`.

   ```elixir
   config :exq,
     mode: :api
   ```

1. ExqUI uses Phoenix LiveView. If you already use LiveView, skip to
next step. Otherwise follow LiveView [installation docs](https://hexdocs.pm/phoenix_live_view/installation.html).

1. In your phoenix router import `ExqUIWeb.Router` and add
`live_exq_ui(path)`

```elixir
defmodule DemoWeb.Router do
  use Phoenix.Router
  import ExqUIWeb.Router

  pipeline :browser do
    plug :fetch_session
    plug :protect_from_forgery
  end

  scope "/", DemoWeb do
    pipe_through :browser

    live_exq_ui("/exq")
  end
end
```

## Development

```sh
mix setup # on first run
mix run dev.exs
open http://localhost:4000/exq
```
