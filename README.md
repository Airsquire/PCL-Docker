# PCL-Docker

This repositry hosts the docker file for PCL-Docker and its neccessary components from Airsquire. See the detailed link below.

## Environment

- Ubuntu:16.04 -- https://hub.docker.com/r/_/ubuntu/
- boost_1_58_0 -- https://hub.docker.com/r/youyue/boost-docker/
- Eigen 3.2 -- https://hub.docker.com/r/youyue/eigen-docker/
- VTK with OpenGL2
- PCL 1.8.1 

## Reason for not using CUDA 9.0+

 The 'compute_20', 'sm_20', and 'sm_21' architectures are deprecated in CUDA 9.0