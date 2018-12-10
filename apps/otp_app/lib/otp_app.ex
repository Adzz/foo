defmodule OTPApp.Bar do
  @thing :existing_atom
end

defmodule OTPApp do
  def hello() do
    String.to_existing_atom("existing_atom")
  end
end
