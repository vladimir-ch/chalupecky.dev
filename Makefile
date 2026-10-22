HUGO ?= hugo
# Keep the version in one place for local builds and Netlify.
HUGO_VERSION := $(shell sed -n 's/^[[:space:]]*HUGO_VERSION = "\([^"]*\)".*/\1/p' netlify.toml)

.PHONY: build serve check-version

build: check-version
	"$(HUGO)" --environment production --gc --cleanDestinationDir $(HUGO_ARGS)

serve: check-version
	"$(HUGO)" server --disableFastRender --renderToMemory $(HUGO_ARGS)

check-version:
	@command -v "$(HUGO)" >/dev/null 2>&1 || { echo "Hugo is not installed. See README.md." >&2; exit 1; }
	@actual_version="$$("$(HUGO)" version | sed -n 's/^hugo v\([0-9][0-9.]*\).*/\1/p')"; \
	if [ -z "$(HUGO_VERSION)" ] || [ "$$actual_version" != "$(HUGO_VERSION)" ]; then \
	  echo "Expected Hugo $(HUGO_VERSION); found $$actual_version. See README.md." >&2; \
	  exit 1; \
	fi
