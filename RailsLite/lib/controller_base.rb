require 'active_support'
require 'active_support/inflector'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "you done messed up, bruv" if @already_built_response
    @res.status = 302
    @res.location = url
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "you done messed up, bruv" if @already_built_response
    @res['Content-Type'] = content_type
    @res.body = [content]
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    #File.read(File.join(Rails.root, 'app','csv','names.csv'))

    view_path = File.join(Dir.pwd, "views", "#{self.class}".underscore, "#{template_name}.html.erb")
    read_file = File.read(view_path)

    template = ERB.new(read_file).result(binding)
    render_content(template, 'text/html')
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
