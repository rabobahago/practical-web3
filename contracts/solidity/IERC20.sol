// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IERC20 {
    /**
     * @dev Triggered when `value` tokens are transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Triggered whenever `value` tokens are approved by `owner` to be spent by `spender`.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    /**
     * @dev Returns the total amount of tokens.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Transfers `amount` tokens from the caller's account to the recipient `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded or not.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the amount authorized by the `owner` account to the `spender` account, default is 0.
     *
     * When {approve} or {transferFrom} is invoked，`allowance` will be changed.
     */
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /**
     * @dev Allows `spender` to spend `amount` tokens from caller's account.
     *
     * Returns a boolean value indicating whether the operation succeeded or not.
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Transfer `amount` of tokens from `from` account to `to` account, subject to the caller's
     * allowance. The caller must have allowance for `from` account balance.
     *
     * Returns `true` if the operation is successful.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

// contract ERC {
//     mapping(address => uint256) public override balanceOf;

//     mapping(address => mapping(address => uint256)) public override allowance;

//     uint256 public override totalSupply; // total supply of the token

//     string public name; // the name of the token
//     string public symbol; // the symbol of the token

//     uint8 public decimals = 18; // decimal places of the token

//     constructor(string memory name_, string memory symbol_) {
//         name = name_;
//         symbol = symbol_;
//     }

//     function transfer(
//         address _recipient,
//         uint _amount
//     ) external override returns (bool) {
//         balanceOf[msg.sender] -= _amount;
//         balanceOf[_recipient] += _amount;
//         emit Transfer(msg.sender, _recipient, _amount);
//         return true;
//     }

//     function approve(
//         address _spender,
//         uint _amount
//     ) external override returns (bool) {
//         allowance[msg.sender][_spender] = _amount;
//         emit Approval(msg.sender, _spender, _amount);
//         return true;
//     }

//     function transferFrom(
//         address sender,
//         address recipient,
//         uint amount
//     ) external override returns (bool) {
//         allowance[sender][msg.sender] -= amount;
//         balanceOf[sender] -= amount;
//         balanceOf[recipient] += amount;
//         emit Transfer(sender, recipient, amount);
//         return true;
//     }

//     function mint(uint amount) external {
//         balanceOf[msg.sender] += amount;
//         totalSupply += amount;
//         emit Transfer(address(0), msg.sender, amount);
//     }

// }
