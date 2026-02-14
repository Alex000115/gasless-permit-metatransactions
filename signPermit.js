const { ethers } = require("ethers");

async function signPermit(wallet, tokenAddress, spender, value, deadline) {
    const network = await wallet.provider.getNetwork();
    
    const domain = {
        name: "GaslessToken",
        version: "1",
        chainId: network.chainId,
        verifyingContract: tokenAddress
    };

    const types = {
        Permit: [
            { name: "owner", type: "address" },
            { name: "spender", type: "address" },
            { name: "value", type: "uint256" },
            { name: "nonce", type: "uint256" },
            { name: "deadline", type: "uint256" }
        ]
    };

    const nonce = await (new ethers.Contract(tokenAddress, ["function nonces(address) view returns (uint256)"], wallet)).nonces(wallet.address);

    const values = {
        owner: wallet.address,
        spender: spender,
        value: value,
        nonce: nonce,
        deadline: deadline
    };

    const signature = await wallet.signTypedData(domain, types, values);
    return ethers.Signature.from(signature);
}

module.exports = { signPermit };
