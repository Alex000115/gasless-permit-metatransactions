// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Permit.sol";

/**
 * @title GaslessToken
 * @dev Standard ERC20 with EIP-2612 Permit functionality.
 */
contract GaslessToken is ERC20, ERC20Permit {
    constructor() ERC20("GaslessToken", "GLS") ERC20Permit("GaslessToken") {
        _mint(msg.sender, 1000000 * 10**18);
    }
}
