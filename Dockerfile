FROM amazonlinux

RUN yum update -y && \
    yum groupinstall -y "Development Tools" && \
    yum install -y libffi libffi-devel openssl openssl-devel python-devel python27-pip python27-virtualenv


COPY build.sh /root/build.sh
RUN ["chmod", "+x", "/root/build.sh"]

RUN mkdir /root/pkg
WORKDIR /root/pkg

ENTRYPOINT ["sh", "/root/build.sh"]
CMD ["numpy", "1.11.1"]
