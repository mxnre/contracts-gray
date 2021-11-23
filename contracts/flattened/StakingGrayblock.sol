// Sources flattened with hardhat v2.6.3 https://hardhat.org

// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v4.3.0

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


// File @openzeppelin/contracts/utils/math/SafeMath.sol@v4.3.0


pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is no longer needed starting with Solidity 0.8. The compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}


// File @openzeppelin/contracts/utils/Context.sol@v4.3.0


pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


// File @openzeppelin/contracts/access/Ownable.sol@v4.3.0


pragma solidity ^0.8.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// File @openzeppelin/contracts/security/ReentrancyGuard.sol@v4.3.0

pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

// File contracts/IterableMapping.sol

pragma solidity ^0.8.0;

library IterableMapping {
    struct StakeInfo {
        uint256 amount;
        uint256 stakedTime;
        uint256 rewardAmount;
    }

    struct Map {
        address[] keys;
        mapping(address => StakeInfo) values;
        mapping(address => uint256) indexOf;
        mapping(address => bool) inserted;
    }

    function get(Map storage map, address key)
        public
        view
        returns (StakeInfo memory)
    {
        return map.values[key];
    }

    function getIndexOfKey(Map storage map, address key)
        public
        view
        returns (int256)
    {
        if (!map.inserted[key]) {
            return -1;
        }
        return int256(map.indexOf[key]);
    }

    function getKeyAtIndex(Map storage map, uint256 index)
        public
        view
        returns (address)
    {
        return map.keys[index];
    }

    function size(Map storage map) public view returns (uint256) {
        return map.keys.length;
    }

    function add(
        Map storage map,
        address key,
        StakeInfo memory val
    ) public {
        if (map.inserted[key]) {
            map.values[key] = val;
        } else {
            map.inserted[key] = true;
            map.values[key] = val;
            map.indexOf[key] = map.keys.length;
            map.keys.push(key)
;
        }
    }

    function remove(Map storage map, address key) public {
        if (!map.inserted[key]) {
            return;
        }

        delete map.inserted[key];
        delete map.values[key];

        uint256 index = map.indexOf[key];
        uint256 lastIndex = map.keys.length - 1;
        address lastKey = map.keys[lastIndex];

        map.indexOf[lastKey] = index;
        delete map.indexOf[key];

        map.keys[index] = lastKey;
        map.keys.pop();
    }
}

// File contracts/staking.sol

pragma solidity ^0.8.0;

/**
 * @notice GrayBlock Staking Contract
 * @author Adam Lee
 */
contract GrayblockStaking is ReentrancyGuard, Ownable {
    using SafeMath for uint256;
    using IterableMapping for IterableMapping.Map;

    /// @notice Event emitted only on construction. To be used by indexers
    event GrayblockStakingContractDeployed();

    event TradedTokenPut(
        address engeryDeveloper,
        uint256 amount
    );

    event Staked(
        address staker,
        uint256 amount
    );

    event UnStaked(
        address staker,
        uint256 amount
    );

    event AllocationUpdated();

    /// @notice Traded Token Instance
    IERC20 public tradedToken;
    
    /// @notice Project Token Instance
    IERC20 public projectToken;

    /// @notice Address of feeCollector who received the fee
    address public feeCollector;

    /// @notice Bps of fee which goes to fee collector
    uint256 public feeBps;

    /// @notice Staking tokens should be locked during locktime in staking pool
    uint256 public lockTime = 1 days;

    /// @dev Iterable Mapping for staking information
    IterableMapping.Map stakeInfos;

    /// @notice Total staked project token balance
    uint256 public totalStakedBalance;

    /**
     * @notice Constructor
     * @param _tradedToken Traded Token Instance
     * @param _projectToken Project Token Instance
     * @param _feeCollector Address of feeCollector
     */
    constructor(
        IERC20 _tradedToken,
        IERC20 _projectToken,
        address _feeCollector
    ) {
        tradedToken = _tradedToken;
        projectToken = _projectToken;
        feeCollector = _feeCollector;
        feeBps = 100;
        
        emit GrayblockStakingContractDeployed();
    }

    /**
     * @notice Energy developers put traded token to our staking pool
     * @param _amount Amount of traded token
     */
    function putTradedToken(uint256 _amount) external {
        require(
            tradedToken.balanceOf(msg.sender) >= _amount,
            "insufficient balance"
        );

        tradedToken.transferFrom(msg.sender, address(this), _amount);

        emit TradedTokenPut(msg.sender, _amount);
    }

    /**
     * @notice Users stake project token into our pool
     * @param _amount Amount of project token
     */
    function stake(uint256 _amount) external {
        require(
            projectToken.balanceOf(msg.sender) >= _amount,
            "insufficient balance"
        );

        uint256 _actualAmount = _amount.mul(uint256(10000).sub(feeBps)).div(10000);
        projectToken.transferFrom(msg.sender, feeCollector, _amount.sub(_actualAmount));
        projectToken.transferFrom(msg.sender, address(this), _actualAmount);

        if(stakeInfos.inserted[msg.sender]) {
            stakeInfos.values[msg.sender].amount = stakeInfos.values[msg.sender].amount.add(_actualAmount);
            stakeInfos.values[msg.sender].stakedTime = _getNow();
        } else {
            IterableMapping.StakeInfo memory stakeInfo = IterableMapping.StakeInfo({
                amount: _actualAmount,
                stakedTime: _getNow(),
                rewardAmount: 0
            });

            stakeInfos.add(msg.sender, stakeInfo);
        }

        totalStakedBalance = totalStakedBalance.add(_actualAmount);

        emit Staked(msg.sender, _actualAmount);
    }

    /**
     * @notice Users unstake project token from our pool after 24hrs
     * @param _amount Amount of project token
     */
    function unStake(uint256 _amount) external {
        IterableMapping.StakeInfo storage stakeInfo =  stakeInfos.values[msg.sender];
        
        require(
            stakeInfo.amount >= _amount,
            "insufficient balance"
        );
        require(
            _getNow() >= stakeInfo.stakedTime.add(lockTime),
            "can not unstake during lock time"
        );

        if(stakeInfo.amount == _amount) {
            stakeInfos.remove(msg.sender);
        } else {
            stakeInfo.amount = stakeInfo.amount.sub(_amount);
        }

        totalStakedBalance = totalStakedBalance.sub(_amount);

        projectToken.transfer(msg.sender, _amount);

        emit UnStaked(msg.sender, _amount);
    }

    /**
     * @notice Our Backend calls this function every 6hrs to calcuate the reward for every user
     */
    function updateAllocation(uint256 rewardAmount) external onlyOwner {
        uint256 tradedTokenBalance = tradedToken.balanceOf(address(this));

        require(
            tradedTokenBalance >= rewardAmount,
            "not enough reward"
        );

        for(uint256 i = 0; i < stakeInfos.size(); i++) {
            address key = stakeInfos.getKeyAtIndex(i);
            IterableMapping.StakeInfo storage stakeInfo =  stakeInfos.values[key];
            stakeInfo.rewardAmount = stakeInfo.rewardAmount.add(rewardAmount.mul(stakeInfo.amount).div(totalStakedBalance));
        }
        
        emit AllocationUpdated();
    }

    /**
     * @notice Users can claim reward
     */
    function claimReward() public {
        require(
            stakeInfos.inserted[msg.sender],
            "not staker"
        );
        require(
            stakeInfos.values[msg.sender].rewardAmount > 0,
            "no reward"
        );
        
        uint256 rewardAmount = stakeInfos.values[msg.sender].rewardAmount;
        stakeInfos.values[msg.sender].rewardAmount = 0;
        tradedToken.transfer(msg.sender, rewardAmount);
    }

    /**
     * @notice Get staking balance for each user
     */
    function getStake() external view returns(uint256) {
        return stakeInfos.values[msg.sender].amount;
    }

    /**
     * @notice Get staking time for each user
     */
    function getStakeTime() external view returns(uint256) {
        return stakeInfos.values[msg.sender].stakedTime;
    }

    /**
     * @notice Get if the user has staked or not
     */
    function getIfStake() external view returns(bool) {
        return stakeInfos.inserted[msg.sender];
    }

    /**
     * @notice Get reward amount for each user
     */
    function getReward() external view returns(uint256) {
        return stakeInfos.values[msg.sender].rewardAmount;
    }

    /**
     * @notice Owner can set the address of fee collector
     * @param _feeCollector addres of fee collector
     */
    function setFeeCollector(address _feeCollector) external onlyOwner {
        feeCollector = _feeCollector;
    }

    /**
     * @notice Owner can set the bps of the fee
     * @param _feeBps Bps of the fee
     */
    function setFeeBps(uint256 _feeBps) external onlyOwner {
        feeBps = _feeBps;
    }

    /**
     * @notice Owner can set the lock time
     * @param _lockTime Lock time
     */
    function setLockTime(uint256 _lockTime) external onlyOwner {
        lockTime = _lockTime;
    }

    function _getNow() internal view virtual returns (uint256) {
        return block.timestamp;
    }
}