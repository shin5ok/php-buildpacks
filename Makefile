APPNAME := phpinfo

.PHONY: cloud
cloud:
	gcloud builds submit --pack=image=gcr.io/$(GOOGLE_CLOUD_PROJECT)/$(APPNAME)

local:
	pack build $(APPNAME) --builder=gcr.io/buildpacks/builder

local-with-nginx:
	pack build $(APPNAME) --builder=gcr.io/buildpacks/builder \
  --env GOOGLE_CUSTOM_NGINX_CONFIG="nginx-custom.conf"
