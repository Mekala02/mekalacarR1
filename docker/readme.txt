# Start the container with
nvidia-docker run -it --rm --privileged --network host --ipc=host -v $(pwd):/root mekalacar:ros1