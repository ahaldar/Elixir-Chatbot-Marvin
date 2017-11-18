defmodule DoThing do
  import Define
  import DefineSpell
  import Translate

  def do_thing(cmd) do
    # Command formats:
    #  d word                         gives definiton of word
    #  d s word                       gives definition of suggested correct word if wrong spelling
    #  t lang-from lang-to word       gives definiton and translation of word
    #
    cond do
      Regex.run ~r/^d\ss\s/, cmd ->
	cmd2 = Regex.replace(~r/^d\ss\s/, cmd, "")
	DefineSpell.init(cmd2)
      Regex.run ~r/^d\s/, cmd ->
	cmd2 = Regex.replace(~r/^d\s/, cmd, "")
	Define.init(cmd2)
      Regex.run ~r/^t\s/, cmd ->
	cmd2 = Regex.replace(~r/^t\s/, cmd, "")
	Translate.init(cmd2)
      true ->
	Define.init(cmd)
    end
  end

end
