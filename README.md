# DukeCon / Javaland KeyCloak Docker

## Introduction

TBD

## Testing

If you want to test the provided DukeCon/Javaland themes perform the following steps:

### Build Docker test image

```
mvn clean package -Plocaltest
```

### Run Docker test image

```
docker run -ti --rm \ 
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin123 \
  -p 18080:8080 dukecon-keycloak:1.0-SNAPSHOT
```

Wait a second for the Docker container to come up!

### Connect to Admin interface

TBD: Screen shot

* Login to KeyCloak Admin Console on http://localhost:18080/auth/admin
* Use the credentials set as Environment variables from the run step
* Select the _master_ realm
* Switch to _Login_ tab 
** Set all options to _off_
** Save the settings!
* Switch to _Themes_ tab
** Select _javaland_ as _Login Theme_
** Save the settings!

### Test

* Log out
* You should see your new Login page
