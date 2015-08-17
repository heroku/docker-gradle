# Inherit from Heroku's stack
FROM heroku/jvm

# Run Gradle to cache dependencies
# It would be nice if we could detect the presence of gradlew, and either
# install our own gradle, or run gradlew conditionally. But Docker doesn't
# allow for conditional logic well.
ONBUILD COPY ["*.gradle", "gradlew", "/app/user/"]
ONBUILD COPY ["gradle/wrapper/*", "/app/user/gradle/wrapper/"]
ONBUILD RUN ./gradlew dependencies

ONBUILD COPY . /app/user/
ONBUILD RUN ./gradlew stage
