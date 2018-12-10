# Foo

Minimal test case for bug in release commands in distillery.

Running this fails:

```
rm -rf _releases && MIX_ENV=prod  mix release --env=prod --name=base && MIX_ENV=prod  ./_releases/base/bin/base eval 'Elixir.LibraryApp.ReleaseTasks.task'
```

Even though running this works:

```
iex -S mix
```

Then:

```
> Elixir.LibraryApp.ReleaseTasks.task
```

See forum post here for context: [https://elixirforum.com/t/module-not-being-loaded-in-umbrella-app-even-though-the-app-it-lives-in-has-started-and-loaded/18634](https://elixirforum.com/t/module-not-being-loaded-in-umbrella-app-even-though-the-app-it-lives-in-has-started-and-loaded/18634)

