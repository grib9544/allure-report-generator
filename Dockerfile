FROM openjdk:15-jdk

RUN apk add wget

ENV ALLURE_VERSION 2.13.3
ENV PATH /bin/allure-"$ALLURE_VERSION"/bin:$PATH
ENV ALLURE_URL http://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/"$ALLURE_VERSION"/allure-commandline-"$ALLURE_VERSION".tgz

RUN wget "$ALLURE_URL"; \
    tar zxvf allure-commandline-"$ALLURE_VERSION".tgz -C /bin; \
    rm allure-commandline-"$ALLURE_VERSION".tgz; \
	allure --version

CMD sh
