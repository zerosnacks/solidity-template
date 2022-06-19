// Vendor
import Joi from "joi";
import "@nomiclabs/hardhat-waffle";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
import "hardhat-gas-reporter";
import "solidity-coverage";
import "hardhat-contract-sizer";
import { HardhatUserConfig, subtask } from "hardhat/config";
import { TASK_COMPILE_SOLIDITY_GET_SOURCE_PATHS } from "hardhat/builtin-tasks/task-names";

// Utilities
import { validateEnvConfig } from "./scripts/utilities/validateEnvConfig";

// Validate values from .env file
const { PRIVATE_KEY, ETH_RPC_URL, ETHERSCAN_API_KEY } = validateEnvConfig(
  ".env",
  Joi.object({
    PRIVATE_KEY: Joi.string().default("1".repeat(64)),
    ETH_RPC_URL: Joi.string(),
    ETHERSCAN_API_KEY: Joi.string(),
  })
);

// Filter out .t.sol test files and regular Solidity files in the test directory
subtask(TASK_COMPILE_SOLIDITY_GET_SOURCE_PATHS).setAction(
  async (_, __, runSuper) => {
    const paths = await runSuper();

    return paths.filter(
      (p: string) => !p.endsWith(".t.sol") && !p.includes("test")
    );
  }
);

// Solidity
const SOLC_VERSION = "0.8.15";

// Accounts
const accounts = [PRIVATE_KEY];

// Network settings
const settings = {
  viaIR: true,
  optimizer: {
    enabled: true,
    runs: 200,
  },
};

const config: HardhatUserConfig & {
  contractSizer: {
    alphaSort: boolean;
    disambiguatePaths: boolean;
    runOnCompile: boolean;
  };
  etherscan: {
    apiKey: string;
  };
} = {
  paths: {
    cache: "hh-cache",
    sources: "./src",
    tests: "./test",
  },
  contractSizer: {
    alphaSort: false,
    disambiguatePaths: false,
    runOnCompile: true,
  },
  defaultNetwork: "hardhat",
  networks: {
    mainnet: {
      url: ETH_RPC_URL,
      accounts,
    },
  },
  solidity: {
    compilers: [
      {
        version: SOLC_VERSION,
        settings,
      },
    ],
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};

export default config;
