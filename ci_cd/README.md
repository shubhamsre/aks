
To deploy the image run

docker run -dit -p 8020:8020 -e DJANGO_SUPERUSER_USERNAME=admin -e DJANGO_SUPERUSER_PASSWORD=sekret1 -e DJANGO_SUPERUSER_EMAIL=admin@example.com redzack/django-markdown-editor

References: https://semaphoreci.com/community/tutorials/dockerizing-a-python-django-web-application
