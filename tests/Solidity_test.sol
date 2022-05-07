// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import {Library} from "../contracts/Library.sol";

contract SolidityTest {
    function temp() public {
        uint256 n = uint256(uint160(0x6343a423ab47Cf92f89e2451171D38ac1D0606E9));
        console.log(n);
    }   

    function convertTest() public {
        uint x = 0x1111111111111111111111111111111122222222222222222222222222222222;
        bytes32 b = 0x1111111111111111111111111111111122222222222222222222222222222222;

        Assert.equal(uint128(x), 0x22222222222222222222222222222222, "");
        Assert.equal(bytes16(b) == 0x11111111111111111111111111111111, true, "");

        address addr = 0x6343a423ab47Cf92f89e2451171D38ac1D0606E9;
        uint addr_int = uint256(uint160(addr));
        uint target = uint256(0x0000000000000000000000006343a423ab47cf92f89e2451171D38ac1d0606e9);
        Assert.ok(addr_int == target, "");
    }

    function findArrayStartStorageAddr() public {
        // Assume the array locate at slot 1
        uint slotIndex = 1;
        bytes32 out = keccak256(abi.encodePacked(slotIndex));
        console.log(2**256 - 1  - uint(out)+1);
    }

    function byteOp() public {
        uint8 _n = 4;
        bytes1 _x = bytes1(uint8(215));
        bytes1 nOnes = bytes1(uint8(2**_n-1));
        bytes1 mask = nOnes << (8- _n);
        Assert.equal(208, uint8( _x & mask), "");
    }

    function libraryTestGetFirst32Bytes() public {
        bytes memory data = "123456789012345678901234567890123456789012345678901234567890";
        bytes32 out = Library.getFirst32Bytes(data);
        Assert.equal(Library.bytes32ToAsciiString(out), "12345678901234567890123456789012", "");
    }
}
