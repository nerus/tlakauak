export SECRET_KEY_BASE="(mix phx.gen.secret)"                                                                                                                        (main*) 08:09:48
export DATABASE_URL="postgresql://postgres:postgres@localhost:5432/tlakauak_dev"                                                                                   (main*) 08:11:58
export APP_NAME=tlakauak                                                                                                                                             (main*) 08:12:19
export MY_HOSTNAME=example.com                                                                                                                                       (main*) 08:12:37
export MY_COOKIE=secret                                                                                                                                              (main*) 08:12:55
export REPLACE_OS_VARS=true                                                                                                                                          (main*) 08:13:13
env MIX_ENV=prod mix distillery.release --env=prod

env MIX_ENV=prod MY_NODE_NAME=tlakauak@127.0.0.1 PORT=4000 _build/prod/rel/tlakauak/bin/tlakauak console