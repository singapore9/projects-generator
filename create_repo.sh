#!/bin/bash

source ./new_repo_vars

echo "mkdir \"${RELATIVE_REPOSITORY_PATH}\""
mkdir "${RELATIVE_REPOSITORY_PATH}"

echo "git -C \"${RELATIVE_REPOSITORY_PATH}\" init"
git -C "${RELATIVE_REPOSITORY_PATH}" init

echo "git -C \"${RELATIVE_REPOSITORY_PATH}\" config --local core.editor nano"
git -C "${RELATIVE_REPOSITORY_PATH}" config --local core.editor nano

echo "git -C \"${RELATIVE_REPOSITORY_PATH}\" config --local user.name \"${GIT_USERNAME}\""
git -C "${RELATIVE_REPOSITORY_PATH}" config --local user.name "${GIT_USERNAME}"

echo "git -C \"${RELATIVE_REPOSITORY_PATH}\" config --local user.email \"${GIT_EMAIL}\""
git -C "${RELATIVE_REPOSITORY_PATH}" config --local user.email "${GIT_EMAIL}"

echo "gh repo create \"${REPOSITORY_NAME}\" --source=\"${RELATIVE_REPOSITORY_PATH}\""
gh repo create "${REPOSITORY_NAME}" --source="${RELATIVE_REPOSITORY_PATH}"

echo "sed -i bck 'sXhttps://github.com/Xgit@github.com:Xg' \"${RELATIVE_REPOSITORY_PATH}/.git/config\""
sed -i bck 'sXhttps://github.com/Xgit@github.com:Xg' "${RELATIVE_REPOSITORY_PATH}/.git/config"

echo "git -C \"${RELATIVE_REPOSITORY_PATH}\" config core.sshCommand \"ssh -i ${PRIVATE_KEY}\""
git -C "${RELATIVE_REPOSITORY_PATH}" config core.sshCommand "ssh -i ${PRIVATE_KEY}"

echo "cp -R \"./content/\" \"${RELATIVE_REPOSITORY_PATH}\""
cp -R "./content/" "${RELATIVE_REPOSITORY_PATH}"

echo "git -C \"${RELATIVE_REPOSITORY_PATH}\" add ."
git -C "${RELATIVE_REPOSITORY_PATH}" add .

echo "cd \"${RELATIVE_REPOSITORY_PATH}\""
cd "${RELATIVE_REPOSITORY_PATH}"

echo "poetry init --name \"${POETRY_PROJECT_NAME}\" --author \"${POETRY_AUTHOR_EMAIL}\" --python \"^3.9\""
poetry init -n --name "${POETRY_PROJECT_NAME}" --author "${POETRY_AUTHOR_EMAIL}" --python "^3.9" --dependency "fastapi"

echo "poetry config virtualenvs.in-project true"
poetry config virtualenvs.in-project true

echo "poetry env use \"${CUSTOM_PYTHON_PATH}\""
poetry env use "${CUSTOM_PYTHON_PATH}"

echo "poetry install"
poetry install

echo "poetry lock"
poetry lock

echo "git add pyproject.toml poetry.lock"
git add pyproject.toml poetry.lock

echo "git commit -m \"First commit\""
git commit -m "First commit"

echo "git push -u origin master"
git push -u origin master

echo "Finish"