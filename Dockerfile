FROM google/cloud-sdk:263.0.0 as gcloudsdk263
FROM circleci/android:api-29

WORKDIR /
ADD git-crypt-0.6.0 git-crypt-0.6.0
RUN sudo apt-get install libssl-dev
WORKDIR /git-crypt-0.6.0
RUN sudo make
RUN sudo make install
RUN gem install fastlane -v 2.135.2
RUN gem install os

COPY --from=gcloudsdk263 /usr/local/bin/docker /usr/local/bin/docker
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"