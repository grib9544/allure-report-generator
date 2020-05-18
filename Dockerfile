FROM alpine:3.11

# Java 
ENV JAVA_HOME /opt/openjdk-14
ENV PATH $JAVA_HOME/bin:$PATH
ENV JAVA_VERSION 14-ea+15
ENV JAVA_URL https://download.java.net/java/early_access/alpine/15/binaries/openjdk-14-ea+15_linux-x64-musl_bin.tar.gz
ENV JAVA_SHA256 76091da1b6ed29788f0cf85454d23900a4134286e5feb571247e5861f618d3cd

RUN set -eux; \
	\
	wget -O /openjdk.tgz "$JAVA_URL"; \
	echo "$JAVA_SHA256 */openjdk.tgz" | sha256sum -c -; \
	mkdir -p "$JAVA_HOME"; \
	tar --extract --file /openjdk.tgz --directory "$JAVA_HOME" --strip-components 1; \
	rm /openjdk.tgz; \
	\
	java -Xshare:dump; \
	\
	java --version; \
	javac --version

# allure2
ENV ALLURE_VERSION 2.13.3
ENV PATH /bin/allure-"$ALLURE_VERSION"/bin:$PATH
ENV ALLURE_URL http://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/"$ALLURE_VERSION"/allure-commandline-"$ALLURE_VERSION".tgz

RUN wget "$ALLURE_URL"; \
    tar zxvf allure-commandline-"$ALLURE_VERSION".tgz -C /bin; \
    rm allure-commandline-"$ALLURE_VERSION".tgz; \
	allure --version

CMD sh
