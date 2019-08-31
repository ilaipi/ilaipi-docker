FROM node:lts-buster
MAINTAINER Billy <mz.yyam@gmail.com>

RUN echo "deb http://mirrors.aliyun.com/debian buster main contrib non-free" \
"deb http://mirrors.aliyun.com/debian buster-proposed-updates main contrib non-free" \
"deb http://mirrors.aliyun.com/debian buster-updates main contrib non-free" \
"deb http://mirrors.aliyun.com/debian-security/ buster/updates main non-free contrib" \
"deb https://nginx.org/packages/mainline/debian/ buster nginx" \
"deb-src https://nginx.org/packages/mainline/debian/ buster nginx" \
> /etc/apt/sources.list

# set up the timezone to Shanghai
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

ARG sshDir=/root/.ssh
# copy ssh private key to container.root
COPY ../ssh/github $sshDir/id_rsa
# close ssh host check
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> $sshDir/config

RUN yarn config set registry https://registry.npm.taobao.org --global
RUN yarn config set disturl https://npm.taobao.org/dist --global

# add global commands
COPY ../shell/app.sh /bin/app.sh
RUN chmod a+x /bin/app.sh

# create user, clone code in user's home
ARG USER=volkswagen

RUN useradd -ms /bin/bash -U ${USER}
WORKDIR /home/${USER}

COPY ./.env ./

COPY ./entrypoint.sh ./
RUN ["chmod", "+x", "./entrypoint.sh"]

ENTRYPOINT ["./entrypoint.sh"]

CMD ["boot"]
