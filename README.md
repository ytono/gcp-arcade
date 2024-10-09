sudo yum -y install buildah
sudo yum -y install podman

buildah unshare

microcontainer=$(buildah from registry.hub.docker.com/keycloak/keycloak:25.0.2)
micromount=$(buildah mount $microcontainer)

yum install --installroot $micromount --releasever 9 --setopt install_weak_deps=false --nodocs -y iproute gawk
yum clean all --installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer <image>

gcloud auth print-access-token | podman login -u oauth2accesstoken --password-stdin https://us-central1-docker.pkg.dev

podman push <image>
