// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract SakiToken is ERC20
{
    mapping(address => uint256) private balances;
    mapping(address => bool) controllers;

   //uint256 private totalSupply;
   uint256 private maxSupply;
   uint256 constant MAXSUP=1000000000*1000**18;

    constructor() ERC20("Fisky Token" , "FT")
    {
        controllers[msg.sender] = true;
        controllers[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = true;
       _mint(msg.sender, 10000 ** 18);
    }
function mint (address to , uint256 amount) external
{
require(controllers[msg.sender] , "Sender has no control to mint");
require((maxSupply + amount)<= MAXSUP , "MAX SUPPLY reached");
maxSupply += amount;

_mint(to , amount);
}

}