pragma solidity ^0.4.20;

contract Codex {
  
  function hash() public view returns (bytes32) {
    return bytes32(uint256(uint160(msg.sender)));
  }
}