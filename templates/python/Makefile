.PHONY: setup venv deps lock zip clean distclean

PIPENV := pipenv
PIPENV_OPTS := --three
PIPENV_DIR := .venv

setup: venv

venv:
	@test -d $(PIPENV_DIR) \
		|| PIPENV_VENV_IN_PROJECT=1 $(PIPENV) $(PIPENV_OPTS)
	@echo "To install packages use 'pipenv install [PACKAGES] --skip-lock'"
	@echo "To freeze packages 'make lock'"
	@echo ""
	@echo "You can now 'make deps'"

deps:
	$(PIPENV) install --skip-lock

lock:
	$(PIPENV) lock

zip:
	zip code.zip Makefile src/**/*.py

clean:
	$(RM) *~ *.pyc

distclean: clean
	$(RM) -rf $(PIPENV_DIR)/
