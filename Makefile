# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

install: forge-install npm-install

# Forge dependencies
forge-install:; forge install
forge-update:; forge update

# Node dependencies for linting
npm-install:; npm install

# Forge tasks
clean:; forge clean
build:; forge build
test:; forge test # --fork-url $(ETH_RPC_URL) --etherscan-api-key $(ETHERSCAN_API_KEY)
trace:; forge test # -vvvvv --fork-url $(ETH_RPC_URL) --etherscan-api-key $(ETHERSCAN_API_KEY)
snapshot:; forge snapshot
coverage:; forge coverage --report lcov

# Node tasks
lint-check:; npm run lint:check
lint-fix:; npm run lint:fix
