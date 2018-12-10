# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
  # This sets the default release built by `mix release`
  default_release: :foo,
  # This sets the default environment used by `mix release`
  default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html

# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set(dev_mode: true)
  set(include_erts: false)
  set(cookie: :NOT_A_COOKIE)
end

environment :prod do
  set(include_erts: true)
  set(include_src: false)
  set(vm_args: "priv/templates/vm.args.eex")
end

release :base do
  set(version: "base-#{current_version(:otp_app)}")

  set(
    applications: [
      :runtime_tools,
      :otp_app,
      :library_app
    ]
  )

  set(output_dir: "_releases/base")
end
