# Gasless Permit & Meta-Transactions

A professional-grade repository demonstrating how to eliminate the "Gas Barrier" for new users. By implementing the `permit` function and EIP-712 typed data signing, users can authorize transactions with a simple digital signature, while a third-party (Relayer) pays the actual gas fee.

## Features
- **EIP-2612 Compliance**: Uses the `permit` extension for ERC-20 to approve spending via signatures.
- **EIP-712 Implementation**: Securely hashes typed structured data to prevent signature replay attacks.
- **Relayer Ready**: Structured to work with OpenGSN or custom backends.
- **Improved UX**: Users can interact with your DApp even with a 0 ETH balance.



## Workflow
1. **Sign**: User signs a permit message off-chain (No gas spent).
2. **Submit**: The signature is sent to a Relayer API.
3. **Execute**: The Relayer calls the smart contract, passing the signature.
4. **Verify**: The contract recovers the signer's address and executes the logic.

## License
MIT
