// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0/contracts/token/ERC20/ERC20.sol";

contract MalToken is ERC20 {
  constructor() public ERC20("Mal", "MTK") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
  }
}