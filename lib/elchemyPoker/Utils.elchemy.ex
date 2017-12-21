
# Compiled using Elchemy v0.5.3
defmodule ElchemyPoker.Utils do
  use Elchemy

  
  import Elchemy, only: []
  @spec shuffle(list(any)) :: list(any)
  curry shuffle/1
  verify as: Erlng.shuffle/1
  def shuffle(a1), do: Erlng.shuffle(a1)
end

