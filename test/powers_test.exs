defmodule PowersTest do
  use ExUnit.Case
  doctest Powers

  test "nth_root" do
    assert Powers.nth_root(27, 3) == 3.0
    assert Powers.nth_root(81, 2) == 9.0
    assert Powers.nth_root(64, 3) == 4.0
  end
end
