# Projects Generator

It is common problem for me to create first commit with configuring helpers and other useful libraries.

So, I decided to make generator which will do first commit with simplest and flexible environment **for FastAPI + Python 3.9**: Local/remote GitHub repo + Makefile + Dockerfile + Poetry.

## Preparing
For automatic scripts work they should have access to GitHub.
1. Install `gh` package (GitHub CLI). For example: `brew install gh`
2. Install Poetry (version >= 1.1.0)
3. Create Personal Access Token from [Developer Settings page](https://github.com/settings/tokens/) with allowed actions in "repo" scope and save it to your **GH_TOKEN** environment variable.
4. Make ssh-key and link it with your GitHub account.
5. Create file new_repo_vars and fill params in it with help of new_repo_vars.example file.
6. Run create_repo.sh file without any params.

Result of scripts work:
1. Created new folder with REPOSITORY_NAME located in RELATIVE_REPOSITORY_PATH_PARENT.
2. Folder from #1 linked to new public (!) GitHub repository.
3. Added base work with Python3.9 + FastApi project:
	1. Added base configuration for Make: Makefile.
	2. Added base configuration for Docker: Dockerfile, .dockerignore.
	3. Added base configuration for Poetry: pyproject.toml, venv inside of project's folder.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
