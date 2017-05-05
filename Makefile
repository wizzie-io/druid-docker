<<<<<<< HEAD
VERSION=0.9.1.1-26
=======
VERSION=latest
>>>>>>> fdc45b2b358868f9ed7d448222384ba59fb4e5a7
.PHONY: broker coordinator overlord middlemanager historical

all: broker coordinator overlord middlemanager historical

druid_build = docker build -f "$(1)/Dockerfile" -t druid-$(1):$(VERSION) .; \
<<<<<<< HEAD
	docker tag druid-$(1):$(VERSION) gcr.io/pcasares-163609/druid-$(1):$(VERSION); \
	gcloud docker -- push gcr.io/pcasares-163609/druid-$(1):$(VERSION)
=======
	docker tag druid-$(1):$(VERSION) gcr.io/wizzie-registry/druid-$(1):$(VERSION); \
	gcloud docker -- push gcr.io/wizzie-registry/druid-$(1):$(VERSION)
>>>>>>> fdc45b2b358868f9ed7d448222384ba59fb4e5a7

broker:
	$(call druid_build,broker)

coordinator:
	$(call druid_build,coordinator)

overlord:
	$(call druid_build,overlord)

middlemanager:
	$(call druid_build,middlemanager)

historical:
	$(call druid_build,historical)

deploy:
	kubectl delete deploy -l app=druid
	kubectl create -f kube/coordinator/druid-coordinator-deploy.yaml
	kubectl create -f kube/broker/druid-broker-deploy.yaml
	kubectl create -f kube/overlord/druid-overlord-deploy.yaml
	kubectl create -f kube/middleManager/druid-middleManager-deploy.yaml
	kubectl create -f kube/historical/druid-historical-deploy.yaml
