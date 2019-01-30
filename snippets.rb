module Snippets
  ALL = [
    {
      scope: 'erb',
      name: 'erb puts',
      prefix: 'erb',
      body: "<%= ${1} %>"
    },
    {
      scope: 'erb',
      name: 'erb return',
      prefix: 'rtn',
      body: "<% ${1} %>",
      description: "<% %>"
    },
    {
      scope: 'erb',
      name: 'erb puts',
      prefix: 'erb',
      body: "<%= ${1} %>",
      description: "<%= %>"
    },
    {
      scope: 'erb',
      name: 'binding pry in erb',
      prefix: 'pry',
      body: "<%= binding.pry %>",
      description: "<%= binding.pry %>"
    },
    {
      scope: 'erb',
      name: 'html comment',
      prefix: 'com',
      body: '<div class="${1}">',
      description: '<!-- html comment -->'
    },
    {
      scope: 'scss',
      name: 'css comment',
      prefix: 'com',
      body: '/* ${1} */',
      description: '/* css comment */'
    },
    {
      scope: 'ruby',
      name: 'def',
      prefix: 'def',
      body: '',
      description: 'auto ends def block'
    },
    {
      scope: 'ruby',
      name: 'binding pry',
      prefix: 'pry',
      body: 'binding.pry',
      description: 'Outputs binding.pry'
    },
  ].sort_by { |snippet| snippet[:scope] }
end
