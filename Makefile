APPNAME := phpinfo
REGION := us-central1

.PHONY: cloud
cloud:
	gcloud builds submit --pack=image=gcr.io/$(GOOGLE_CLOUD_PROJECT)/$(APPNAME)

.PHONY: local
local:
	pack build $(APPNAME) --builder=gcr.io/buildpacks/builder

.PHONY: local-with-nginx
local-with-nginx:
	pack build $(APPNAME) --builder=gcr.io/buildpacks/builder \
  --env GOOGLE_CUSTOM_NGINX_CONFIG="nginx-custom.conf"


.PHONY: deploy-to-run
deploy-to-run:
	gcloud run deploy --source=. --region=$(REGION) --set-env-vars=GOOGLE_CUSTOM_NGINX_CONFIG="nginx-custom.conf" --allow-unauthenticated phpinfo
