pragma solidity ^0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract Token is ERC20 {
	address public owner;

	constructor() ERC20('NSToken','NST') {
		owner = msg.sender;
		//open zeppelin's mint function
		_mint(msg.sender,1000000 * 10 ** 18);
	}

	function mint(address to, uint amount) external {
		require(msg.sender == owner, 'Only owner can mint tokens');
		_mint(to,amount);
	}

	function burn(uint amount) external {
		//open zeppelin's burn function
		_burn(msg.sender, amount);
	}
}