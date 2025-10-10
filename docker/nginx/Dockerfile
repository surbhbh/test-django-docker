FROM public.ecr.aws/docker/library/nginx:1.27.0

ARG HOME_PATH
ARG APP_NAME
ARG UID
ARG GID
ENV APP_HOME=${HOME_PATH}/${APP_NAME}

RUN addgroup --system app && adduser --system --group app && \
    mkdir -p ${APP_HOME}/staticfiles ${APP_HOME}/mediafiles && \
    rm /etc/nginx/conf.d/default.conf && \
    chown -R ${UID}:${GID} /var/cache/nginx && \
    chown -R ${UID}:${GID} /var/log/nginx && \
    chown -R ${UID}:${GID} /etc/nginx/conf.d && \
    chown -R ${UID}:${GID} $HOME_PATH && \
    chmod -R 775 $HOME_PATH

RUN touch /var/run/nginx.pid && \
    chown -R ${UID}:${GID} /var/run/nginx.pid

WORKDIR $APP_HOME

USER ${UID}:${GID}

CMD ["nginx", "-g", "daemon off;"]
