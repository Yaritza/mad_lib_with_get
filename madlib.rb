require 'engtagger'
require 'rest-client'
require 'json'
require 'rexml/document'

$uri = URI("http://www.kimonolabs.com/api/6o548b0m?apikey=cae829be41ef6e13cfb7b98cbe568b6d")


def get_text
  body = RestClient.get($uri)
  parsed = JSON.parse(body)
  sign_object = parsed['results']['collection1'][0]
  #sign_name = sign_object['sign']
  #horoscope_text = sign_object['horoscope']
  return sign_object
end

def tag(text)
  tgr=EngTagger.new
  tgr.add_tags(text)
end

def build_lib(tagged)
  doc = REXML::Document.new "<doc>#{tagged}</doc>"
  elems = doc.root.children.select{|child| child.is_a? REXML::Element}
  pairs = elems.map do |elem|
    {:name => elem.name, :text => elem.text}
  end
  pairs
end

def get_input(pairs)
  lib = String.new
  pairs.each do |pair|
    lib << text
  end
  lib
end

sign_object = get_text
tagged = tag(sign_object['horoscope'])
build_lib(tagged)