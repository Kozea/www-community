include config.Makefile
-include config.custom.Makefile

BASEVERSION ?= v1
BASEROOT ?= https://raw.githubusercontent.com/Kozea/MakeCitron/$(BASEVERSION)/
BASENAME := base.Makefile
ifeq ($(MAKELEVEL), 0)
RV := $(shell wget -q -O $(BASENAME) $(BASEROOT)$(BASENAME) || echo 'FAIL')
ifeq (,$(RV))
include $(BASENAME)
else
$(error Unable to download $(BASEROOT)$(BASENAME))
endif
$(info $(INFO))
else
include $(BASENAME)
endif


lint-pytho%:
	$(LOG)
	pytest --flake8 --isort -m "flake8 or isort" community.py

check-pytho%:
	$(LOG)
	# FLASK_CONFIG=$(FLASK_TEST_CONFIG) pytest community.py $(PYTEST_ARGS)

deploy-test:
	$(LOG)
	@echo "Communicating with Junkrat..."
	@wget --no-verbose --content-on-error -O- --header="Content-Type:application/json" --post-data=$(subst $(newline),,$(JUNKRAT_PARAMETERS)) $(JUNKRAT) | tee $(JUNKRAT_RESPONSE)
	if [[ $$(tail -n1 $(JUNKRAT_RESPONSE)) != "Success" ]]; then exit 9; fi
	wget --no-verbose --content-on-error -O- $(URL_TEST)

deploy-prod:
	$(LOG)
	@echo "Communicating with Junkrat..."
	@wget --no-verbose --content-on-error -O- --header="Content-Type:application/json" --post-data=$(subst $(newline),,$(JUNKRAT_PARAMETERS)) $(JUNKRAT) | tee $(JUNKRAT_RESPONSE)
	if [[ $$(tail -n1 $(JUNKRAT_RESPONSE)) != "Success" ]]; then exit 9; fi
	wget --no-verbose --content-on-error -O- $(URL_PROD)
