FROM node:16

RUN apt update

RUN apt install  openssh-server sudo curl nano git -y

RUN apt install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1010 sshuser 

RUN usermod -aG sudo sshuser

RUN service ssh start

RUN  echo 'sshuser:password' | chpasswd

COPY solana-install.sh /home/ubuntu

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
