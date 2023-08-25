# Set the base image
FROM continuumio/miniconda3

# File Author / Maintainer
MAINTAINER Your Name

# Install key packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc

# Set up the conda environment
RUN conda create --name rieprogeo1 python=3.8

# Activate the conda environment and make sure it's activated on startup
RUN echo "source activate rieprogeo1" > ~/.bashrc
ENV PATH /opt/conda/envs/rieprogeo1/bin:$PATH

# Copy the requirement file
ADD /requirements.txt /root/

# Install the Python dependencies
RUN pip install -r /root/requirements.txt