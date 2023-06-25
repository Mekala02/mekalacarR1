# Start the container with
nvidia-docker run -it --rm --privileged --network host --ipc=host -v $(pwd):/root mekala02/mekalacar:ros1