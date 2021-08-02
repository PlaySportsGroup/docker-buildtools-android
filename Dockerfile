FROM google/cloud-sdk:263.0.0 as gcloudsdk263
FROM ccistaging/android:api-29

WORKDIR /
ADD git-crypt-0.6.0 git-crypt-0.6.0
# Path for bundletool needs referencing directly as it is a jar
ADD bundletool-1.7.0 bundletool
RUN sudo apt-get install libssl-dev
WORKDIR /git-crypt-0.6.0
RUN sudo make
RUN sudo make install

COPY --from=gcloudsdk263 /usr/local/bin/docker /usr/local/bin/docker
ENV PATH=":/opt/google-cloud-sdk/bin/:/opt/android/sdk/build-tools/29.0.3:${PATH}"