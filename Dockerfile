# build
FROM python:3.10 as build

WORKDIR /src

COPY . .

RUN pip install --no-cache-dir -r requirements.txt


# runtime
FROM python:3.10-slim as runtime

WORKDIR /src

COPY --from=build /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/

COPY --from=build /src /src

CMD ["python", "run.py"]