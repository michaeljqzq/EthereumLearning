// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract FakeLibraryContract {

  // stores a timestamp 
  uint slot1;
  uint slot2;
  uint slot3;

  function setTime(uint _time) public {
    slot3 = _time;
  }
}