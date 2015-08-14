# Inherit from Heroku's stack
FROM jkutner/jvm

# Run Maven to cache dependencies
ONBUILD COPY ["*.gradle", "gradlew", "gradle", "/app/user/"]
ONBUILD RUN ./gradlew dependencies

ONBUILD COPY . /app/user/
ONBUILD RUN ./gradlew stage
