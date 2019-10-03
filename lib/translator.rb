require "yaml"

def load_library(file)
  library = YAML.load_file(file)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file, english_emoji)
  library = load_library(file)
  if library["get_emoticon"].include?(english_emoji)
    return library["get_emoticon"][english_emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file, japanese_emoji)
  library = load_library(file)
  if library["get_meaning"].include?(japanese_emoji)
    return library["get_meaning"][japanese_emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end
