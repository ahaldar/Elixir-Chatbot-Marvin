# (C) Aparajita Haldar
#
# Dummy translation module.
#

defmodule Translate do
  
  def init(query) do
    map = %{"hi" => "bonjour", "hello" => "bonjour",
	    "bye" => "au revoir", "goodbye" => "au revoir",
	    "how are you" => "comment allez-vous?",
	    "don't know" => "je ne sais pas",
	    "yes" => "oui", "no" => "non", "thanks" => "merci", "thank you" => "merci",
	    :return => "Sorry, I don't know what that means."
	   }

    cond do
      Regex.run ~r/^en\sfr\s/, query ->
	phrase = Regex.replace(~r/^en\sfr\s/, query, "")
	cond do
	  Map.has_key?(map, phrase) ->
	    map[phrase]
	  true ->
	    map[:return]
	end 
      true ->
	map[:return]
    end
 
  end

end
