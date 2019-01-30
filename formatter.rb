require './snippets'

class Formatter
  attr_accessor :format

  def initialize(editor = Atom.new)
    @editor = editor
  end

  def output_snippets
    dir_name = detect_directory
    output_file = File.new("#{dir_name}/snippet_output.json", "a+")

    Snippets::ALL.each do |snippet|
      output_file.puts(output_snippet(snippet))
    end

    output_file.close
  end

  private

  def output_snippet(snippet)
    @editor.output_snippet(snippet)
  end

  def detect_directory
    return 'vs_code' if @editor.class.to_s == 'VSCode'
    return 'atom' if @editor.class.to_s == 'Atom'
  end
end

class VSCode
  def output_snippet(snippet)
    %Q("#{snippet[:name]}": {
      "scope": "#{snippet[:scope]}",
      "prefix": "#{snippet[:prefix]}",
      "body": [
        "#{snippet[:body]}"
      ],
      "description": "#{snippet[:description]}"
    },)
  end
end

class Atom
  def output_snippet(snippet)
    %Q(
      '.#{set_scope(snippet[:scope])}':
        '#{snippet[:name]}':
          prefix: '#{snippet[:prefix]}'
          body: '#{snippet[:body]}'
    )
  end

  def set_scope(scope)
    return 'text.html.erb' if scope == 'erb'
    scope
  end
end


f = Formatter.new(VSCode.new)
f.output_snippets
