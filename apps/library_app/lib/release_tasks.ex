defmodule LibraryApp.ReleaseTasks do
  @deps [:otp_app, :logger]

  def task() do
    prepare_dependencies()
    LibraryApp.task()
    shutdown()
  end

  defp prepare_dependencies do
    Application.load(:library_app)
    Enum.each(@deps, fn x -> {:ok, _} = Application.ensure_all_started(x) end)
    Application.loaded_applications() |> IO.inspect()
    Application.started_applications() |> IO.inspect()
  end

  defp shutdown do
    :init.stop()
  end
end
