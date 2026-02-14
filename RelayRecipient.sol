// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {GaslessToken} from "./GaslessToken.sol";

/**
 * @title RelayRecipient
 * @dev A contract that accepts signed permits to execute transfers for users.
 */
contract RelayRecipient {
    GaslessToken public immutable token;

    constructor(address _token) {
        token = GaslessToken(_token);
    }

    /**
     * @notice Execute a transfer by providing a signed permit
     * @dev Relayer calls this and pays the gas
     */
    function depositWithPermit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        // 1. Use the signed permit to gain allowance
        token.permit(owner, spender, value, deadline, v, r, s);

        // 2. Perform the actual transfer
        // In a real app, this would deposit into a vault or pool
        token.transferFrom(owner, address(this), value);
    }
}
