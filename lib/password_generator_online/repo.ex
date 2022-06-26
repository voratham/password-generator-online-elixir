defmodule PasswordGeneratorOnline.Repo do
  use Ecto.Repo,
    otp_app: :password_generator_online,
    adapter: Ecto.Adapters.Postgres
end
