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

# Hardhat tasks
hh-clean:; npm run hh:clean
hh-build:; npm run hh:build

# Lint tasks
lint:; npm run lint:check && npm run solhint:check
lint-fix:; npm run lint:fix && npm run solhint:fix
