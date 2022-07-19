defmodule NotifyScheduler.Repo do
  use Ecto.Repo,
    otp_app: :notify_scheduler,
    adapter: Ecto.Adapters.Postgres
end
