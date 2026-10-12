# Editorconfig

See [Editorconfig website](http://EditorConfig.org).

Follows the annotated sources for [editorconfig file](./dot-editorconfig)

It is a _top-most EditorConfig file_

```ini
# http://EditorConfig.org
root = true
```

Settings that apply to all files.

```ini

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
```

For other file specific settings it is fine to override and to have redundancy cause there will be other _.editorconfig_ files in other folders.

## Node

Make sure _package.json_ uses indentation style expected by package managers.

```ini

[{package,package-lock}.json]
indent_style = space
indent_size = 2
```

## Two spaces

Files that require or recommend two spaces indentation.

```ini

[*.{toml,yaml,yml}]
indent_style = space
indent_size = 2
```

See also

- [YAML](https://yaml.org/) does not allow tabs as indentation.
- See [TOML Example](https://github.com/toml-lang/toml#example).

## Four spaces

Python [PEP 8 Standard](https://peps.python.org/pep-0008/) recommends four spaces indentation.

```ini

[*.py]
indent_style = space
indent_size = 4
```

Also prefer shell scripts to have 4 spaces indentation for better readability.

```ini

[*.{sh,bash,zsh}]
indent_style = space
indent_size = 4

[{.bashrc,.bash_profile,.profile,.zshrc,.zshenv,.zprofile,.zlogin,.zlogout}]
indent_style = space
indent_size = 4
```

### Make

Every _Makefile_ should use tabs.

```ini

[Makefile]
indent_style = tab
```
