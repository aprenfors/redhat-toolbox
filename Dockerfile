FROM registry.access.redhat.com/ubi8/ubi as appbase

USER root

ENV APP_NAME redhad_psql

RUN dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum -y install postgresql12 && yum clean all -y
RUN yum -y install rsync && yum clean all -y

RUN useradd -ms /bin/bash -d /tvp tvp

WORKDIR /tvp

RUN chgrp -R 0 /tvp
RUN chmod g=u -R /tvp

COPY . .

ENTRYPOINT ["/tvp/entrypoint.sh"]