From kpengboy/trisquel

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get autoremove
RUN apt-get install curl binutils gcc m4 make -y

WORKDIR /root
RUN curl -L -O https://github.com/Clozure/ccl/releases/download/v1.11.5/ccl-1.11.5-linuxx86.tar.gz
RUN tar xzvf ccl-1.11.5-linuxx86.tar.gz

WORKDIR /root/ccl/lisp-kernel/linuxx8664
RUN cd /root/ccl/lisp-kernel/linuxx8664 & make clean & make

WORKDIR /root
RUN curl -O curl -O https://beta.quicklisp.org/quicklisp.lisp

EXPOSE 2020

RUN /root/ccl/lx86cl64 --load quicklisp.lisp --eval "(quicklisp-quickstart:install)"

COPY .ccl-init.lisp /root/
COPY start-swank.lisp /root/


ENTRYPOINT ["/root/ccl/lx86cl64", "--load",  "start-swank.lisp"]
