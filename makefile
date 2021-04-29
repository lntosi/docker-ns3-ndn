
build:
	docker build -t ubuntu18-ns3-ndn .

run:
	docker run -ti --rm \
		-e DISPLAY=$DISPLAY \
		-v "${HOME}/.Xauthority:${HOME}/.Xauthority:rw" \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu18-ns3-ndn
