FROM python:3
RUN pip install django==3.2

RUN python manage.py migrate


COPY . .

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]



