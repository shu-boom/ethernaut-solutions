// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Math {
    function div(uint a, uint b, uint amount) public pure returns(uint){
            return((amount * a)/b);

    }
} 