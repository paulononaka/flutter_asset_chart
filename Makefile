help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

get: ## Get all dependencies
	flutter pub get

watch: ## Watch for changes and rebuild
	flutter packages pub run build_runner watch --delete-conflicting-outputs

codegen: ## Generate code
	flutter packages pub run build_runner build --delete-conflicting-outputs

clean-codegen: ## Clean codegen
	flutter packages pub run build_runner clean
	make codegen

install: get codegen ## Install dependencies and generate code

lint: ## Run linter
	flutter analyze

run: ## Run the app
	flutter run -t lib/main.dart

build-android: ## Build the app for Android
	flutter build apk -t lib/main.dart

build-ios: ## Build the app for iOS
	flutter build ios -t lib/main.dart

golden: ## Run the golden tests
	flutter test
