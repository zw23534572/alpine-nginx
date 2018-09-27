FROM registry.cn-shenzhen.aliyuncs.com/sjroom/alpine-base

# Install nginx
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.7/main" >> /etc/apk/repositories && \
    apk add --update nginx=1.12.2-r3 && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

ADD default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx/ && \
    mkdir -p /export/App/html/ && \
    echo "hello nginx"  > /export/App/html/index.html && \
    echo "nginx"  >> /export/servers/script/start.sh