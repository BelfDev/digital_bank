.PHONY: help

help: welcome ## Prints help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

welcome:
	@printf "\033[33m _____ _                 ____              _     \n"
	@printf "\033[33m|  ___| | _____      __ | __ )  __ _ _ __ | | __ \n"
	@printf "\033[33m| |_  | |/ _ \ \ /\ / / |  _ \ / _  |  _ \| |/ / \n"
	@printf "\033[33m|  _| | | (_) \ V  V /  | |_) | (_| | | | |   <  \n"
	@printf "\033[33m|_|   |_|\___/ \_/\_/   |____/ \____|_| |_|_|\_\ \n"
	@printf "\033[33m                            					  \n"
	@printf "\033[m\n"

take-off: welcome setup run

.env:
	@echo 'Creating .env from .env.sample'
	@cp ./app/.env.sample ./app/.env

setup: .env
	./bin/setup_project.sh
run:
	@echo 'Please make sure you have configured your .env file in the app/ directory'
	@echo 'Running the Flutter App...\n'
	cd app && flutter run
