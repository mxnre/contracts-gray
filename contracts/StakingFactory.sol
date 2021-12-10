pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Token.sol";
import "./StakingGrayblock.sol";
import "./FactoryStorage.sol";
import "./lib/Factory.sol";

contract StakingFactory is FactoryStorage, Ownable {
    address[] public stakingAddresses;
    address public feeCollector;

    event StakingDeployed(
        address _deploymentAddress,
        address _tradeToken,
        address _projectToken
    );
    event HarvestAll(address _staker);
    event FeeCollector(address feeCollector);

    uint256 constant SALT = 0xff;

    constructor(address _feeCollector, IERC20 _tradeToken) {
        feeCollector = _feeCollector;
        tradeToken = _tradeToken;
    }

    function getBytecode(Token _projectToken, string memory _name)
        public
        view
        returns (bytes memory)
    {
        bytes memory creationCode = type(GrayblockStaking).creationCode;

        return
            Factory.getByteCode(
                abi.encode(
                    tradeToken,
                    _projectToken,
                    feeCollector,
                    address(this),
                    _name
                ),
                creationCode
            );
    }

    function getAddress(bytes memory _bytecode) public view returns (address) {
        return Factory.getAddress(_bytecode, address(this));
    }

    function _deploy(bytes memory bytecode, Token _projectToken) internal {
        address addr;

        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), SALT)

            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }

        emit StakingDeployed(addr, address(tradeToken), address(_projectToken));
    }

    function deployStakingPool(Token _projectToken, string memory _name)
        external
        onlyOwner
    {
        bytes memory byteCode = getBytecode(_projectToken, _name);
        _deploy(byteCode, _projectToken);
        address stakePoolAddress = getAddress(byteCode);
        poolsData[stakePoolAddress] = Pool(address(_projectToken), _name);
        stakingAddresses.push(stakePoolAddress);
        emit NewPool(stakePoolAddress);
    }

    function harvestAll(address _staker) external {
        for (uint256 i = 0; i < stakingAddresses.length; i++) {
            address stakeAddress = stakingAddresses[i];
            if (GrayblockStaking(stakeAddress).canClaimReward(_staker)) {
                GrayblockStaking(stakeAddress).claimReward(_staker);
            }
        }

        emit HarvestAll(_staker);
    }

    function _setFeeCollector(address _newFeeCollector) external onlyOwner {
        feeCollector = _newFeeCollector;
        emit FeeCollector(_newFeeCollector);
    }
}
