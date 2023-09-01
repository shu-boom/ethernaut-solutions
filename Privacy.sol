// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Privacy {
    function unlock(bytes16 _key) external;
}

contract PrivacyExecute {
    Privacy privacy;
    constructor(address _add){
        privacy = Privacy(_add);
    }
    function getDecodedKey(uint elementIndex, uint storageSlot) external pure returns (bytes32){
        return bytes32(uint(keccak256(abi.encode(storageSlot))) + elementIndex);
    }

    function parseStr(bytes32 elementIndex) external pure returns (bytes16){
        return bytes16(elementIndex);
    }

    function unlock(bytes16 key) external {
        privacy.unlock(key);
    }
}
