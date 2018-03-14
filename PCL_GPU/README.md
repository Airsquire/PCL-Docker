# PCL docker with GPU feature enabled

This repositry hosts the docker file for PCL-Docker and its neccessary components from Airsquire. See the detailed link below.

## Environment

- Ubuntu:16.04 -- https://hub.docker.com/r/_/ubuntu/
- boost_1_58_0 -- https://github.com/Airsquire/PCL-Docker/blob/master/Boost-Docker/Dockerfile
- Eigen 3.2 -- https://github.com/Airsquire/PCL-Docker/blob/master/Eigen-Docker/Dockerfile
- VTK with OpenGL https://github.com/Airsquire/PCL-Docker/blob/master/VTK-Docker/Dockerfile
- CUDA 8.0
- PCL from Airsquire repo -- https://github.com/Airsquire/pcl

## Reason for not using CUDA 9.0+

 The 'compute_20', 'sm_20', and 'sm_21' architectures are deprecated in CUDA 9.0. But PCL 1.8.1 is still using these architectures
