require 'json'

def partial(file, &block)
  path = "#{Dir.pwd}/src/partial/#{file}.haml"
  Haml::Engine.new(File.read path).render do
    capture_haml &block
  end
end

def react_component(class_name, props = {})
  capture_haml {
    haml_tag :div, 
      'data-react-class' => class_name,
      'data-react-props' => props.to_json
  }
end