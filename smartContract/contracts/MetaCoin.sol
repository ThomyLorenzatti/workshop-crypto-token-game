pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {

    event win(uint winning);
    event draw(uint draw);

    error InsufficientBalance(uint requested, uint available);
    error AmountError(uint requested, uint available);

    constructor() ERC20("GameToken", "GMT") {
      _mint(msg.sender, 1000*10**18);
      _mint(address(this), 100*10**18);
    }

    function balance () public view returns (uint256) {
        return balanceOf(msg.sender);
    }


    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {

        if (balanceOf(msg.sender) < amount) {
            revert InsufficientBalance({
                requested: amount,
                available: balanceOf(msg.sender)
            });
        }
        if (amount != 10 * 10**18) {
            revert InsufficientBalance({
                requested: amount,
                available: balanceOf(msg.sender)
            });
        }

        _transfer(msg.sender, recipient, amount);

        uint random = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100;

        if (random >= 0 && random < 20) {
            _transfer(address(this), msg.sender, 10 * 10**18);
            emit draw(10);
        } else if (random >= 20 && random < 30) {
            _transfer(address(this), msg.sender, 50 * 10**18);
            emit win(50);
        }

        return true;
    }

}
