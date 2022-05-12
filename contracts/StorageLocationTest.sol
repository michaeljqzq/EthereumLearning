// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageLocationTest {
    // web3.utils.toNumber(await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 0))
    // 255
    uint256 slot0 = 255;

    // await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 1)
    // 0x000000000000000061626364000000000000000000000000000000100000000f
    // the variable store location is started from right to left
    uint32 slot1a = 15;
    uint32 slot1b = 16;
    bytes16 slot1c = 'abcd';

    // await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 2)
    // 0x6465666700000000000000000000000000000000000000000000000000000000
    bytes32 slot2 = 'defg';

    // web3.utils.toAscii(await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 3))
    // this is a short string\x00\x00\x00\x00\x00\x00\x00\x00\x00,
    string shortString = 'this is a short string';

    // web3.utils.toNumber(await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 4))
    // 93
    // p = 93, len = (p-1)/2 = 46
    //
    // web3.utils.toAscii(await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", web3.utils.soliditySha3(0x4)))
    // this is a bit long string larger
    // web3.utils.toAscii(await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", '0x8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19c'))
    //  than one slot\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
    string longString = 'this is a bit long string larger than one slot';

    // await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 5)
    // 0x0000000000000000000000000000000000000000000000000000000000000000

    // key =   '0000000000000000000000006343a423ab47cf92f89e2451171d38ac1d0606e9'
    // index = '0000000000000000000000000000000000000000000000000000000000000005'
    // await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", web3.utils.soliditySha3(key+index, {'encoding':'hex'}))
    // '0x0000000000000000000000000000000000000000000000000000000000000000' why???
    mapping(address => uint256) map;

    // await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", 6)
    // 0x0000000000000000000000000000000000000000000000000000000000000002

    // await web3.eth.getStorageAt("0xd9B64eca3Fb795eE009B1622C45A8491d8Db6eba", web3.utils.soliditySha3('6', {'encoding':'hex'}))
    // '0x0000000000000000000000000000000000000000000000000000000000000000' why???
    uint256[] arr;

    constructor() {
        map[0x6343a423ab47Cf92f89e2451171D38ac1D0606E9] = 738;
        arr.push(3);
        arr.push(4);
    }
}