# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

install: update npm

# Forge dependencies
update:; forge update

# Node dependencies for linting
npm:; npm install

# Forge tasks
build:; forge clean && forge build --optimize
test:; forge clean && forge test --optimize -v # --fork-url $(ETH_RPC_URL)
trace:; forge clean && forge test --optimize -vvv # --fork-url $(ETH_RPC_URL)
debug:; forge clean && forge test -vvvvv # --fork-url $(ETH_RPC_URL)
snapshot:; forge clean && forge snapshot --optimize

# Lint tasks
lint:; npm run lint
lint-fix:; npm run lint:fix
