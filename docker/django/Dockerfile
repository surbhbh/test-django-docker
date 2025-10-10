FROM public.ecr.aws/docker/library/python:3.12.2-slim-bullseye

RUN apt-get update && \
    apt-get install -y curl netcat git && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* && \
    addgroup --system app && adduser --system --group app

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

ARG HOME_PATH
ARG APP_NAME
ENV APP_HOME=${HOME_PATH}/${APP_NAME}

ARG LOGFILE_ROOT
ARG UID
ARG GID

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

# Copy files and install dependencies
COPY src/requirements.txt ./requirements.txt

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY src/ ./
COPY nginx/ ./nginx/
COPY scripts_deploy/ ./scripts_deploy/

RUN mkdir -p ${APP_HOME}/staticfiles ${APP_HOME}/mediafiles && \
    sed -i "s/\r$//g" entrypoint.sh start-django.sh start-celeryworker.sh start-celerybeat.sh start-celeryflower.sh && \
    mkdir -p ${LOGFILE_ROOT} && \
    chown -R ${UID}:${GID} $HOME_PATH && \
    chmod -R 775 $HOME_PATH

RUN chmod +x *.sh

USER ${UID}:${GID}

ENTRYPOINT ["./entrypoint.sh"]
