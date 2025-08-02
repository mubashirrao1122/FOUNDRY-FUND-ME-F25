# 🏦 FundMe - Decentralized Crowdfunding Platform

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)]()
[![Tests](https://img.shields.io/badge/tests-10%2F10%20passing-brightgreen)]()
[![Solidity](https://img.shields.io/badge/solidity-0.8.19-blue)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()

A robust, multi-network crowdfunding smart contract built with **Foundry** and **Chainlink Price Feeds**. Features comprehensive testing, ZkSync compatibility, and deployment automation across multiple networks.

## 🚀 Features

- **💰 Secure Crowdfunding**: Accept ETH donations with USD minimum thresholds
- **📊 Real-time Price Feeds**: Chainlink integration for accurate ETH/USD conversion
- **🌐 Multi-Network Support**: Deploy on Mainnet, Sepolia, or local Anvil
- **🧪 Comprehensive Testing**: 10 passing tests with Unit and Integration coverage
- **⚡ ZkSync Compatible**: Full compatibility testing with foundry-devops
- **🔒 Owner Controls**: Secure withdrawal functionality with access controls
- **📁 Organized Structure**: Clean separation of contracts, scripts, and tests

## 📋 Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Smart Contracts](#smart-contracts)
- [Testing](#testing)
- [Deployment](#deployment)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)

## 🛠 Installation

### Prerequisites

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Foundry](https://book.getfoundry.sh/getting-started/installation)

### Setup

```bash
# Clone the repository
git clone https://github.com/mubashirrao1122/FOUNDRY-FUND-ME-F25.git
cd FOUNDRY-FUND-ME-F25

# Install dependencies
forge install

# Build the project
forge build
```

## ⚡ Quick Start

### Build

```bash
forge build
```

### Test

```bash
# Run all tests
forge test

# Run with verbosity
forge test -vvv

# Run specific test
forge test --match-test testFundUpdatesFundedDataStructure
```

### Deploy Locally

```bash
# Start local blockchain
anvil

# Deploy to local network (in another terminal)
forge script script/DeployFundMe.s.sol --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

## 🏗 Smart Contracts

### Core Contracts

| Contract | Description | Location |
|----------|-------------|----------|
| `FundMe.sol` | Main crowdfunding contract | `src/FundMe.sol` |
| `PriceConverter.sol` | ETH/USD price conversion library | `src/PriceConverter.sol` |

### Scripts

| Script | Description | Location |
|--------|-------------|----------|
| `DeployFundMe.s.sol` | Deployment automation | `script/DeployFundMe.s.sol` |
| `HelperConfig.s.sol` | Network configuration | `script/HelperConfig.s.sol` |
| `Interactions.s.sol` | Contract interaction helpers | `script/Interactions.s.sol` |

### Test Suite

| Test Category | Coverage | Location |
|---------------|----------|----------|
| Unit Tests | Core functionality testing | `test/Unit/` |
| Integration Tests | End-to-end functionality | `test/Integration/` |
| ZkSync Tests | ZkSync compatibility | `test/Unit/ZkSyncDevOps.t.sol` |

## 🧪 Testing

Our comprehensive test suite ensures reliability:

```bash
# Run all tests (10/10 passing)
forge test

# Test specific categories
forge test --match-path test/Unit/
forge test --match-path test/Integration/

# Run ZkSync compatibility tests
forge test --match-test testZkSyncChainFails
```

### Test Coverage

- ✅ Fund functionality with ETH minimum validation
- ✅ Withdrawal permissions and access control
- ✅ Price feed integration and accuracy
- ✅ Multi-funder scenarios
- ✅ Owner-only functions
- ✅ ZkSync chain compatibility

## 🚀 Deployment

### Environment Setup

Create a `.env` file:

```bash
SEPOLIA_RPC_URL=your_sepolia_rpc_url
PRIVATE_KEY=your_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

### Deploy to Sepolia

```bash
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

### Deploy to Mainnet

```bash
forge script script/DeployFundMe.s.sol --rpc-url $MAINNET_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## 💡 Usage

### Funding the Contract

```solidity
// Fund with ETH (minimum $5 USD equivalent)
fundMe.fund{value: 0.1 ether}();
```

### Withdrawing Funds (Owner Only)

```solidity
// Only contract owner can withdraw
fundMe.withdraw();
```

### Check Funding Amount

```solidity
// Get amount funded by an address
uint256 amount = fundMe.getAddressToAmountFunded(address);
```

## ⚙️ Configuration

### Network Configuration

The project supports multiple networks via `HelperConfig.s.sol`:

- **Sepolia Testnet**: Uses live Chainlink price feeds
- **Ethereum Mainnet**: Uses live Chainlink price feeds  
- **Local Anvil**: Uses mock price feeds for testing

### Supported Price Feeds

| Network | Price Feed Address |
|---------|-------------------|
| Sepolia | `0x694AA1769357215DE4FAC081bf1f309aDC325306` |
| Mainnet | `0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419` |
| Anvil | Mock contract (auto-deployed) |

## 🛠 Development Tools

### Foundry Commands

```bash
# Format code
forge fmt

# Gas snapshots
forge snapshot

# Local blockchain
anvil

# Contract interaction
cast send <address> "fund()" --value 0.1ether --rpc-url <rpc_url> --private-key <private_key>
```

### Useful Cast Commands

```bash
# Get contract balance
cast balance <contract_address> --rpc-url <rpc_url>

# Call view functions
cast call <contract_address> "getMinimumUsd()" --rpc-url <rpc_url>
```

## 🔧 Project Structure

```
foundry-fund-me-f25/
├── script/
│   ├── DeployFundMe.s.sol       # Deployment script
│   ├── HelperConfig.s.sol       # Network configuration
│   └── Interactions.s.sol       # Interaction helpers
├── src/
│   ├── FundMe.sol              # Main contract
│   └── PriceConverter.sol      # Price conversion library
├── test/
│   ├── Unit/                   # Unit tests
│   ├── Integration/            # Integration tests
│   └── mocks/                  # Mock contracts
├── lib/                        # Dependencies
└── foundry.toml               # Foundry configuration
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Chainlink](https://chain.link/) for reliable price feeds
- [Foundry](https://book.getfoundry.sh/) for the development framework
- [OpenZeppelin](https://openzeppelin.com/) for security best practices

---

Built with ❤️ using [Foundry](https://book.getfoundry.sh/)
