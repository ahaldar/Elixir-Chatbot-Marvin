defmodule Postprocess do

  def postprocess(definition) do
    definition2 = ""
    str = String.split(definition, "\r\n.\r\n")
    definition2 = remove_codes(str, definition2)
    to_string(definition2)
  end

  def remove_codes(str, definition2) do
    for substr <- str do
      substr = Regex.replace(~r/150.*?\n/, substr, "")
      substr = Regex.replace(~r/151\s/, substr, "")
      substr = Regex.replace(~r/250.*?\n/, substr, "")
      definition2 = definition2 <> "\n_____________________\n" <> to_string(substr)
    end
  end

end

