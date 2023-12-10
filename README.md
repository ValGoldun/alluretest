В папке example-service-test файл с двумя тестами (успешный и не успешный)

1. Поднимаем allure-server 
```
docker run -p 5050:5050 -e CHECK_RESULTS_EVERY_SECONDS=3 -e KEEP_HISTORY=1 \
                 -v ${PWD}/allure-results:/app/allure-results \
                 -v ${PWD}/allure-reports:/app/default-reports \
                 frankescobar/allure-docker-service

```

2. Собираем базовый контейнер для тестов (только окружение)
```
docker build -f Dockerfile -t allurebase:latest .
```

3. Собираем контейнер для тестирования (прокидываем тесты в предыдущий)
```
docker build -f Dockerfile.tester -t tester:latest --no-cache .
```

4. Запускаем тесты
```
docker run tester
```

5. Просматриваем результаты
```
В конце вывода будет подобная ссылка - ALLURE_REPORT=http://host.docker.internal:5050/allure-docker-service/projects/default/reports/13/index.html
Меняем хост на localhost, чтобы получилось http://localhost:5050/allure-docker-service/projects/default/reports/13/index.html
Смотрим результат
```
