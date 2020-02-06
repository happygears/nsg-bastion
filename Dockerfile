##
## Base builder image
##
FROM cloudposse/github-authorized-keys as github-authorized-keys
FROM cloudposse/bastion:latest

## Install dependencies and then github-authorized-keys binary
RUN  cp -p /lib64/security/pam_duo.* /lib/security/ && \
  rm -fr /lib64 && \
  ln -s /lib /lib64 && \
  apk --update --no-cache add libc6-compat
COPY --from=github-authorized-keys /usr/bin/github-authorized-keys /

# Override updated files and add new ones
ADD rootfs/ /
