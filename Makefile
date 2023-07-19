.PHONY: build-on-cloud
build-on-cloud:
	gcloud builds submit --pack=image=gcr.io/$(GOOGLE_CLOUD_PROJECT)/phpinfo
