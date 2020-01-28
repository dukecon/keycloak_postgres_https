# DukeCon / Javaland KeyCloak Docker

## Introduction

TBD

## Add Theme(s)

If you would like to see a new theme, e.g., for a new conference, just go to the 
`src/main/docker/themes` folder and follow the appropriate instructions from the
[KeyCloak documentation](https://keycloak.gitbooks.io/documentation/server_development/topics/themes.html).

## Testing

If you want to test the provided DukeCon/Javaland (or you new) themes, perform the following steps:

### Build Docker test image

```bash
mvn clean package -Plocaltest
```

### Run Docker test image

```bash
docker run -ti --rm \
  --name keycloak-test \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin123 \
  -e DB_VENDOR=H2 \
  -p 18080:8080 dukecon/dukecon-keycloak:1.4-SNAPSHOT
```

Wait a second for the Docker container to come up!

*Attention:* This runs the image in a temporary container (`--rm` flag). As soon as you 
press `ctrl-c` the container (and your changes) are gone. Drop the rm flag if you want to
keep it for other tests. Then you need to perform a manual clean up (eg., `docker rm keycloak-test`).

### Connect to Admin interface

* Login to KeyCloak Admin Console on http://localhost:18080/auth/admin
* Use the credentials set as Environment variables from the run step
![KeyCloak Login Std Theme](images/keycloak-login-stdtheme.png)

### Configure KeyCloak

* Select the _master_ realm (this is by default the only realm)
* Switch to _Login_ tab 
** Set all options to _off_
** Save the settings!
![Configure Login](images/keycloak-admin-configure-login.png)
* Switch to _Themes_ tab
** Select _javaland_ (or any other theme) as _Login Theme_
![Configure Themes](images/keycloak-admin-configure-themes.png)
![Select Theme](images/keycloak-admin-choose-theme.png)
** Save the settings!

### Test new settings

* Sign out
![Logout](images/keycloak-signout.png)
* You should see your new Login page
![KeyCloak Login JavaLand Theme](images/keycloak-login-javaland.png)

## KeyCloak Admin Cheat Sheet

### Docker Exec

If you want to perform some operations with the `kcadm.sh` script, e.g., bulk deletes of users,
you could connect to the running docker container and start a shell. 

```bash
docker exec -ti keycloak /bin/bash
```

In the shell session you may switch to the JBoss `bin` directory (all subsequent commands are
executed from there).

```bash
cd /opt/jboss/keycloak/bin
```

### Delete all users

I recommend to set an environment variable to refer to the realm you are working on

```bash
export REALM="javaland"
```

First you have to list all users

```bash
./kcadm.sh get users --format csv --noquotes -l 10000 -r ${REALM} > /tmp/${REALM}-users
```

Then I would recommend to create a batch file with all user endpoints

```bash
awk -F, '{print "users/"$1}' /tmp/${REALM}-users > /tmp/${REALM}-users-ids 
```

Finally you could delete all of them in a loop

```bash
for i in `cat /tmp/${REALM}-users-ids`; do ./kcadm.sh delete $i -r ${REALM}; echo $i; done
```


## Test with productive data

Execute Postgres

```bash
docker run -d \
    -e POSTGRES_DATABASE=keycloak \
    -e POSTGRES_USER=keycloak \
    -e POSTGRES_PASSWORD=test1234 \
    -e POSTGRES_ROOT_PASSWORD=test1234 \
    -p 127.0.0.1:5432:5432 \
    --name postgres-keycloak \
    postgres:9.6
```

Copy Data dump from your productive (or testing) system:

```bash
scp -p root@dukecon...:/data/backup/keycloak.sql .
```

Load data into local DB:

```bash
PGPASSWORD=test1234 psql -h 127.0.0.1 -U keycloak  keycloak < keycloak.sql
```

Start KeyCloak (in foreground, remove after stop/abort):

```bash
# Override imported DB_PORT (which is like 'tcp://172...')
docker run -ti --rm \
  --name keycloak-test \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin123 \
  -e DB_VENDOR=postgres \
  -e DB_SCHEMA=public \
  -e DB_ADDR=db \
  -e DB_PORT=5432 \
  -e DB_USER=keycloak \
  -e DB_PASSWORD=test1234 \
  --link postgres-keycloak:db \
  -p 18080:8080 dukecon/dukecon-keycloak:1.4-SNAPSHOT
```
