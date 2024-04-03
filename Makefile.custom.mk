##@ App

SHELL := /bin/bash

APPLICATION_NAME="cluster-api-provider-cloud-director"

UPSTREAM_ORG="giantswarm"
COMMIT_TO_SYNC="06f9f9c8"

OS ?= $(shell go env GOOS 2>/dev/null || echo linux)
ARCH ?= $(shell go env GOARCH 2>/dev/null || echo amd64)
KUSTOMIZE := ./bin/kustomize
KUSTOMIZE_VERSION ?= v4.5.7
yq = ./bin/yq
YQ_VERSION := 4.31.2

.PHONY: all
all: fetch-upstream-manifest apply-kustomize-patches apply-custom-patches delete-generated-helm-charts release-manifests wrap-with-conditional ## Builds the manifests to publish with a release (alias to release-manifests)

.PHONY: fetch-upstream-manifest
fetch-upstream-manifest: ## fetch upstream manifest from
	# fetch upstream released manifest yaml
	./hack/sync-version.sh ${UPSTREAM_ORG} ${COMMIT_TO_SYNC}

.PHONY: apply-kustomize-patches
apply-kustomize-patches: $(KUSTOMIZE) ## apply giantswarm specific patches
	$(KUSTOMIZE) build config/kustomize -o config/kustomize/tmp

.PHONY: apply-custom-patches
apply-custom-patches: $(YQ) ## apply giantswarm specific patches that are not possible via kustomize
	./hack/custom-patches.sh

#.PHONY: delete-generated-helm-charts
delete-generated-helm-charts: # clean workspace and delete manifests
	@rm -rvf ./helm/${APPLICATION_NAME}/templates/*.yaml
	@rm -rvf ./helm/${APPLICATION_NAME}/files/*.yaml

.PHONY: release-manifests
release-manifests: 
	# move files from workdir over to helm directury structure
	./hack/prepare-helmchart.sh ${APPLICATION_NAME}

.PHONY: wrap-with-conditional
wrap-with-conditional:
	./hack/wrap-with-conditional.sh

$(YQ): ## Download yq locally if necessary.
	@echo "====> $@"
	mkdir -p $(dir $@)
	curl -sfL https://github.com/mikefarah/yq/releases/download/v$(YQ_VERSION)/yq_$(OS)_$(ARCH) > $@
	chmod +x $@
	@echo "yq downloaded"

$(KUSTOMIZE): ## Download kustomize locally if necessary.
	@echo "====> $@"
	mkdir -p $(dir $@)
	curl -sfL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F$(KUSTOMIZE_VERSION)/kustomize_$(KUSTOMIZE_VERSION)_$(OS)_$(ARCH).tar.gz" | tar zxv -C $(dir $@)
	chmod +x $@
	@echo "kustomize downloaded"
