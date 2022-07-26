SHELL = /bin/bash

build:
	docker build -t testcontainer .

run:
	docker build -t testcontainer .
	docker run -p 8000:8000 -it testcontainer /bin/bash

# don't forget to remove orjson library (for deploy with deta.sh) from requirements.txt
freeze:
	source ./.venv/bin/activate && pip list --format=freeze > requirements.txt

uvicorn:
	source ./.venv/bin/activate && uvicorn main:app --host 0.0.0.0 --workers 5
