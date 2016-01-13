#FROM maxexcloo/nginx:latest
#FROM nginx
FROM ubuntu:15.04

MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E && \
#  echo "deb http://packages.dotdeb.org/ wheezy-php56 all" > /etc/apt/sources.list.d/php.list && \
#  apt-get update && \
#  apt-get install -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-mysql php5-pgsql php5-sqlite php5-mongo && \
#  apt-get clean && \
#  echo -n > /var/lib/apt/extended_states

RUN apt-get update && \
    apt-get install -y wget php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-mysql php5-pgsql php5-sqlite php5-mongo
    #apt-get clean && \
    #echo -n > /var/lib/apt/extended_states


RUN rm -rf /etc/nginx/addon.d /etc/php5/fpm/pool.d && \
  mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d

#ADD etc /etc

ADD supervisord.conf /etc/supervisor/conf.d/php-fpm.conf

ENV VERSION 4.2.1
#RUN mkdir -p /data/http && \
#  wget -O /data/http/index.php "http://www.sourceforge.net/projects/adminer/files/Adminer/Adminer ${VERSION}/adminer-${VERSION}.php/download" && \
#  wget -O /data/http/adminer.css "https://raw.githubusercontent.com/vrana/adminer/master/designs/pokorny/adminer.css"

RUN rm /usr/share/nginx/html/index.html
RUN wget -O /usr/share/nginx/html/index.php "http://www.sourceforge.net/projects/adminer/files/Adminer/Adminer ${VERSION}/adminer-${VERSION}.php/download" && \
  wget -O /usr/share/nginx/html/adminer.css "https://raw.githubusercontent.com/vrana/adminer/master/designs/pokorny/adminer.css"

CMD service php5-fpm start && nginx
