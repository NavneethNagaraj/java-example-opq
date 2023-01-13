FROM maven:amazoncorretto as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:8.0-alpine
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps
