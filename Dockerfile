FROM remnux:lastest

# Use a base image of Ubuntu 20.04
FROM ubuntu:20.04

# Set the working directory
WORKDIR /malware_analysis

# Update the package manager and install required packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    git \
    unzip \
    python3 \
    python3-pip \
    clamav \
    yara \
    yara-python \
    libssl-dev \
    libffi-dev \
    build-essential

# Install additional packages for analysis tools
RUN apt-get install -y \
    volatility \
    gdb \
    strace \
    ltrace \
    tcpdump \
    wireshark \
    hexedit \
    binutils \
    radare2 \
    exiftool \
    foremost \
    scalpel \
    pngcheck \
    binwalk \
    sleuthkit \
    steghide \
    john \
    hashcat \
    aircrack-ng \
    crunch \
    hydra \
    nmap \
    netcat \
    sqlmap \
    nikto

# Install additional Python packages for analysis tools
RUN pip3 install \
    pefile \
    capstone \
    oletools \
    openpyxl \
    pdfminer \
    pycrypto \
    virustotal-api \
    python-magic \
    pandas \
    numpy \
    matplotlib \
    seaborn \
    jupyter

# Copy malware samples into the container (if needed)
COPY samples /samples

# Set the default command for the container
CMD ["/bin/bash"]
