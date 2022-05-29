FROM python:3.9.9-slim-buster AS compile-image

ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc libpq5 libpq-dev

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv ${VIRTUAL_ENV}
ENV PATH="${VIRTUAL_ENV}/bin:$PATH"

WORKDIR /dci-project-quotes
RUN pip install -U pip

COPY . .
RUN pip install -r requirements-docker.txt


FROM python:3.9.9-slim-buster AS build-image

RUN apt-get update
RUN apt-get install -y --no-install-recommends libpq5 wget

COPY --from=compile-image /opt/venv /opt/venv
COPY --from=compile-image /dci-project-quotes /dci-project-quotes
ENV PATH="/opt/venv/bin:$PATH"

RUN /dci-project-quotes/scripts/setup-as-non-root.sh

WORKDIR /dci-project-quotes/project_quotes

USER gunicorn

EXPOSE 8000

CMD ["/dci-project-quotes/scripts/wait-for-postgres.sh", "/dci-project-quotes/scripts/run-gunicorn.sh"]
