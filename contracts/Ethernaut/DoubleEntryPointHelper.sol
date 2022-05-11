// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./DoubleEntryPoint.sol";

contract CustomDetectionBot is IDetectionBot {
    Forta forta;
    address vaultAddress;

    constructor(address fortaAddr, address vaultAddr) {
        forta = Forta(fortaAddr);
        vaultAddress = vaultAddr;
    }

    function handleTransaction(address user, bytes calldata msgData) override external {
        address msgSender = address(uint160(uint256(bytes32(msgData[68:100]))));
        if (msgSender == vaultAddress) {
            forta.raiseAlert(user);
        }
    }
}