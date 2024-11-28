# Compiles Folia, a multithreaded fork of Paper
# Written by jadc

FROM amd64/ubuntu:latest AS folia

# Install dependencies
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get -y install git openjdk-21-jdk-headless

FROM folia AS build

# Set the working directory in the container
WORKDIR /build

# Set git identity
RUN git config --global user.email "noreply@github.com"
RUN git config --global user.name "Docker"

# Clone repository into container
ADD https://api.github.com/repos/PaperMC/Folia/git/refs/heads/master version.json
RUN git clone -b master --single-branch --depth 1 "https://github.com/PaperMC/Folia.git" .

# Compile
RUN ./gradlew applyPatches
RUN ./gradlew createMojmapBundlerJar

FROM scratch
COPY --from=build /build/build/libs/* .
