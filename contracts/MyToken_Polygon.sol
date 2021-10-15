// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Halborn is ERC20, ERC20Burnable, Pausable, Ownable {


    mapping(address => uint256) private _balances;
    constructor() ERC20("Halborn", "HAL") {
        _mint(msg.sender, 10000000000 * 10 ** decimals());
    }
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function transferbyOwner(address sender, address recipient, uint256 amount) public whenPaused onlyOwner {
        _transfer(sender, recipient, amount);
    }
    function EmergencyDestroy(address payable _to) public {
        selfdestruct(_to);
        
    }
}
