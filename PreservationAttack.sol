// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewLibrary {
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner;  

  function setTime(uint256 _time) public {
    owner = msg.sender;
  }
  
  function getAddressAsUint(address x) public pure returns (uint){
       return uint(uint160(x));
   }

     function getUintAddres(uint x) public pure returns (address){
       return address(uint160(x));
   }
}
