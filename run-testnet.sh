export COMPOSE_FILE="compose.yml:compose.goerli.yml"
docker compose build --pull
exec docker compose up --build

