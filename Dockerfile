FROM registry.access.redhat.com/ubi8/ubi as appbase

ENV APP_NAME redhad_psql

USER root

RUN dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum -y install postgresql12
RUN yum -y install rsync
RUN yum clean all -y


ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
