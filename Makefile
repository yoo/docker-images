all:
	jsonnet --string dockerimages.jsonnet > .github/workflows/dockerimages.yml
