# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

install: update npm

# Forge dependencies
update:; forge update

# Node dependencies for linting
npm:; npm install

# Forge tasks
clean:; forge clean
build:; forge build
test:; forge test # --fork-url $(ETH_RPC_URL) --etherscan-api-key $(ETHERSCAN_API_KEY)
trace:; forge test -vvvvv # --fork-url $(ETH_RPC_URL) --etherscan-api-key $(ETHERSCAN_API_KEY)
snapshot:; forge snapshot

# Lint tasks
lint:; npm run lint
lint-fix:; npm run lint:fix
