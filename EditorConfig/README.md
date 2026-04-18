# Editorconfig

See [Editorconfig website](http://EditorConfig.org).

Follows the annotated sources for [editorconfig file](./dot-editorconfig)

It is a _top-most EditorConfig file_

	root = true

Settings that apply to all files.

> [!IMPORTANT]
> Notice that `indent_style` is set to `tab`.

	
	[*]
	charset = utf-8
	end_of_line = lf
	indent_style = tab
	indent_size = 8
	insert_final_newline = true
	trim_trailing_whitespace = true

For other file specific settings it is fine to override and to have redundancy cause there will be other _.editorconfig_ files in other folders.

### Node

Make sure _package.json_ uses indentation style expected by package managers.

	
	[{package,package-lock}.{json}]
	indent_style = space
	indent_size = 2

### Make

Every _Makefile_ should use tabs.

	
	[Makefile]
	indent_style = tab

