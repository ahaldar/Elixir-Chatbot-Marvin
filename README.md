# Marvin

Marvin responds to messages giving dictionary definitions, corrected spelling, and some translations.

Message format:
@paranoidandroid: <command>

<command> format:
  d <word>                         gives definiton of word
  d s <word>                       gives definition of suggested correct word if wrong spelling
  t lang-from lang-to <word>       gives definiton and translation of word


Modularised. Definitions postprocessed slightly.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add `marvin` to your list of dependencies in `mix.exs`:

```elixir
def deps do
[{:marvin, "~> 0.1.0"}]
end
```

2. Ensure `marvin` is started before your application:

```elixir
def application do
[applications: [:marvin]]
end
```

