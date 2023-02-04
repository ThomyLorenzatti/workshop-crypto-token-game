pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {

    event win(uint winning);

    error InsufficientBalance(uint requested, uint available);

    constructor() ERC20("GameToken", "GMT") {
      _mint(msg.sender, 1000*10**18);
      _mint(address(this), 100*10**18);
    }

    function balance () public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function play(uint256 amount) public {

        uint256 fromBalance = balanceOf(msg.sender);
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");

        // send token to smartcontract adress
        transferFrom(msg.sender, address(this), amount);

        // generate a random number
        uint random = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100;

        // if random number is less than 50, send 20 tokens to player
        if (random >= 0 && random < 20) {
            _transfer(address(this), msg.sender, 10 * 10**18);
            emit win(10);
        } else if (random >= 20 && random < 30) {
            _transfer(address(this), msg.sender, 50 * 10**18);
            emit win(50);
        } else {
            emit win(0);
        }

    }

}
