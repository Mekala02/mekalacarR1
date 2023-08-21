# Start the container with
nvidia-docker run -it --rm --privileged --network host --ipc=host -v $(pwd):/root mekala02/mekalacar:ros1

# For windows slave
docker run -e DISPLAY=host.docker.internal:0.0 --net=host -it -v ${pwd}:/root osrf/ros:noetic-desktop-full