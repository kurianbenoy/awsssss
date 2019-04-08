FROM python:3.7
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /excelplay_kryptos
WORKDIR /excelplay_kryptos
ADD /excelplay_kryptos/requirements.txt /excelplay_kryptos
RUN pip install -r requirements.txt
RUN pip install git+git://github.com/traintraveler/redis-leaderboard.git
ADD . /excelplay/excelplay_kryptos

ENTRYPOINT ["python", "excelplay_kryptos/manage.py"]
CMD ["runserver", "0.0.0.0:8880"]

COPY ./excelplay_kryptos /excelplay_kryptos/
