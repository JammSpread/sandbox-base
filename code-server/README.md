# code-server Data
## Layout
- `extensions/`: Folder that holds VSCode extensions.

- `coder.json`: A data file that stores info for `code-server` such as the last visited project and when `code-server` was last updated.

- `config.yaml`: The configuration file for `code-server` which includes the ability to modify things such as the authentication methods and whether certain `code-server` features should be toggled. <br>
(*See `code-server --help`.*)
The password used in the script can be filled in using the `${PASSWORD}` value.

- `settings.json`: A file that stores the VSCode settings for the editor and its extensions.
