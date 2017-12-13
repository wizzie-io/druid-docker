VERSION=0.11.0
.PHONY: broker coordinator overlord middlemanager historical

all: broker coordinator overlord middlemanager historical

druid_build = docker build -f "$(1)/Dockerfile" -t druid-$(1):$(VERSION) .; \
	docker tag druid-$(1):$(VERSION) gcr.io/wizzie-registry/druid-$(1):$(VERSION); \
	gcloud docker -- push gcr.io/wizzie-registry/druid-$(1):$(VERSION)

broker:
	$(call druid_build,broker)

coordinator:
	$(call druid_build,coordinator)

overlord:
	$(call druid_build,overlord)

middleManager:
	$(call druid_build,middlemanager)

historical:
	$(call druid_build,historical)
