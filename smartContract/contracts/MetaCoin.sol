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

    function play() payable public {

        uint256 payed = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));

        require(payed == 0, "You need to pay 10 tokens to play");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");

        // send token to smartcontract adress
        _transfer(msg.sender, address(this), 10*10**18);

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
