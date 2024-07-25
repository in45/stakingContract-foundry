# Staking Foundry Project

## Overview

This project contains a smart contract for a staking mechanism with reward functionalities. The contract allows users to deposit ERC20 tokens, earn rewards based on the time they stake, and withdraw their staked tokens along with the accrued rewards.

## Features

- **Deposit**: Users can deposit ERC20 tokens to stake.
- **Withdraw**: Users can withdraw their staked tokens and rewards.
- **Claim Rewards**: Users can claim their rewards.
- **Compound Rewards**: Users can compound their rewards to increase their stake.
- **Reward Calculation**: Rewards are calculated based on the amount staked and the duration for which tokens are staked.

## Project Structure

- **`src/`**: Contains the Solidity staking contract.
- **`test/`**: Contains the Solidity test files for the staking contract.
- **`foundry.toml`**: Foundry configuration file.

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
