include MakeCitron.Makefile

lint-pytho%:
	$(LOG)
	pytest --flake8 --isort -m "flake8 or isort" community.py

check-pytho%:
	$(LOG)
	# FLASK_CONFIG=$(FLASK_TEST_CONFIG) pytest community.py $(PYTEST_ARGS)
