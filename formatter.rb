require './snippets'

class Formatter
  attr_accessor :format

  def initialize(editor = Atom.new)
    @editor = editor
  end

  def output_snippets
    dir_name = detect_directory
    # output_file = File.new(@editor.output_file_path, "a+")
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

  def output_file_path
    "misc/snippets"
  end

  def detect_directory
    return 'vs_code' if @editor.class.to_s == 'VSCode'
    return 'sublime_text' if @editor.class.to_s == 'SublimeText'
    'atom'
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

  def output_file_path
    "vs_code/#{snippet[:scope]}.code-snippets"
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

  def output_file_path
    'atom/snippets.cson'
  end

  def set_scope(scope)
    return 'text.html.erb' if scope == 'erb'
    scope
  end
end

class SublimeText
  def output_snippet(snippet)
    %Q(<snippet>
      	<content><![CDATA[
      #{snippet[:body]}
      ]]></content>
      	<tabTrigger>#{snippet[:prefix]}</tabTrigger>
      	<scope>source.#{snippet[:scope]}</scope>
      </snippet>
    )
  end

  def output_file_path
    "sublime_text/#{snippet[:name]}sublime-snippets"
  end
end


f = Formatter.new(SublimeText.new)
f.output_snippets
