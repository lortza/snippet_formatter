# Snippet Formatter

**Status: WIP**
Format snippets for your text editors in 1 place using Ruby. If you've ever changed text editors, you may recall the pain of having to rewrite all of your snippets into the new editor's format. Here, you can keep your snippets in 1 central place and then simply output them to the format you need.


## Supported Text Editors
- Atom
- Visual Studio Code
- WIP SublimeText3

## How it Works
1. Create an array of Ruby hashes inside the `snippets` file.
1. Run the generator for your specific text editor
1. Follow the output instructions to copy the generated files into that text editor's config

## How to Run This Script
This script is still WIP and the text editors are hard coded.
```
ruby formatter.rb
```

## To Do

- format for ALL editors in 1 command
- include instructions on top of each output file
- separate files by scope as per the text editors
- call snippet input file more directly than via module and constant
