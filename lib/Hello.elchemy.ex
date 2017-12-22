
# Compiled using Elchemy v0.5.3
defmodule Hello do
  use Elchemy

  
  @moduledoc """
  Prints "world!"
  
      iex> import Hello
      iex> hello()
      "world!"

  
  """
  @spec hello() :: String.t
  def hello() do
    "world!"
  end

end

