// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypeConversion {
  function convertToUint160(address _add) public pure returns (uint160) {
      return uint160(_add);
  }

    function convertToUint64(bytes8 _add) public pure returns (uint64) {
      return uint64(_add);
  }

   function convertToUint16(uint160 _val) public pure returns (uint16) {
      return uint16(_val);
   }

   function convertToUint16toBytes(uint16 _val) public pure returns (bytes8) {
      return bytes8(uint64(_val)); //0x000000000000ddc4
  }

  function convertToUint64ToBytes8(uint64 _val) public pure returns (bytes8) {
      return bytes8(uint64(_val)); //0x000000000000ddc4
  }

  function getUint64() public view returns (uint64) {
     return uint64(bytes8(keccak256(abi.encodePacked(msg.sender))));
  }

  function getXOR(uint64 _val) public pure returns (uint64) {
      return type(uint64).max ^ _val;
  }

  function convertToUint16toBytesAndThenToUint32(uint16 _val) public pure returns (uint32) {
      return uint32(uint64(_val)); //0x000000000000ddc4
   }//0x0010000000008c46 //0x0000000000002266


   function test(bytes8 _gateKey) public view returns (bool){
     require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
      return true;
   }
}