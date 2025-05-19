# ✅ 일반 OpenJDK 11 베이스 이미지
FROM openjdk:11-jdk

# ✅ CI에서 전달하는 JAR 파일 위치 (Gradle 기준)
ARG JAR_FILE=build/libs/*.jar

# ✅ Spring profile 및 환경 설정 변수 (기본값 제공 가능)
ENV SPRING_PROFILES_ACTIVE=local
ENV SERVER_ENV=dev

# ✅ 빌드된 JAR 복사
COPY ${JAR_FILE} app.jar

# ✅ Spring Boot 기본 포트
EXPOSE 8080

# ✅ Spring Boot 실행 (환경 변수 반영)
ENTRYPOINT ["sh", "-c", "java -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE -Dserver.env=$SERVER_ENV -jar app.jar"]