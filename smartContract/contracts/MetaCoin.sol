pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {

    event win(uint winning);

    error InsufficientBalance(uint requested, uint available);

    uint256 private _inContractBalance;

    constructor() ERC20("GameToken", "GMT") {
      _mint(msg.sender, 1000*10**18);
    }

    function inContractBalance() public view returns (uint256) {
        return _inContractBalance;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {
        super._transfer(sender, recipient, amount);
        _inContractBalance += amount;
    }

    function play() public {

        if (10 > balanceOf(msg.sender))
            revert InsufficientBalance({requested: 10*10**18, available: balanceOf(msg.sender)});

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
