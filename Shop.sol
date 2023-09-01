// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface Shop {
  function buy() external;
  function isSold() external view returns(bool);
}

contract Buyer {
   uint public item_price;
   Shop public shop;
   constructor(uint _price, address _shop){
       item_price = _price;
       shop = Shop(_shop);
   }

   function price() external view returns(uint){
       bool isSold = shop.isSold();
       assembly {
           let result
           switch isSold
           case 1
            {
             result := 0
             }
           default
             {result := 100}
           mstore(0x0, result)
           return (0x0, 32)
       }
   }

    function buyFromShop() public {
        shop.buy();
    }
} 