defmodule Spellcheck do

  def correct_word(word) do
    startpython = "python /home/triya/git/marvin/spellcheck.py " <> word
    port = Port.open({:spawn, startpython}, [:binary])

    receive do
      {^port, {:data, correctedword}} ->
	correctedword
    end	
  end

end
