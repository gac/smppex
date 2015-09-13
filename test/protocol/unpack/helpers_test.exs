defmodule SMPPEX.Protocol.Unpack.HelpersTest do
  use ExUnit.Case

  import SMPPEX.Protocol.Unpack.Helpers

  test "hex?" do
    assert hex?("hello") == false
    assert hex?("012345678abcdefABCDEF") == true
    assert hex?({}) == false
    assert hex?([]) == false
    assert hex?(:abc) == false
  end

  test "dec?" do
    assert dec?("hello") == false
    assert dec?("0123456789") == true
    assert dec?({}) == false
    assert dec?([]) == false
    assert dec?(:abc) == false
  end



end


