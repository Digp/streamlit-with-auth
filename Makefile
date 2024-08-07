.PHONY: help virtualenv run clean

define PRINT_HELP_SCRIPT
while read line; do
    if [[ $$line =~ ^([a-zA-Z_-]+):.*?##\ (.*)$$ ]]; then
        target=$${BASH_REMATCH[1]}
        help=$${BASH_REMATCH[2]}
        printf "%-20s %s\n" "$$target" "$$help"
    fi
done < $(MAKEFILE_LIST)
endef
export PRINT_HELP_SCRIPT

help: ## Print help
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@/bin/bash -c "$$PRINT_HELP_SCRIPT" -- $(MAKEFILE_LIST)
	@echo ""

virtualenv: ## Create virtual env
	if [ ! -d venv ]; then python3.11 -m venv venv; fi
	pip install -r requirements.txt

run: ## Run app
	. venv/bin/activate && streamlit run app.py

# Clean venv
clean:
	rm -rf venv

