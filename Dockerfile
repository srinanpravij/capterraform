FROM python:3.7-alpine
RUN mkdir /captflask
WORKDIR /captflask
COPY ./captflask /captflask
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python","web.py"]
