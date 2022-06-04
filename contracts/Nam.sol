// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "./dependencies/ContRewardManager.sol";

contract Nam is Initializable, ERC20Upgradeable, OwnableUpgradeable{
    ContRewardManager public _crm;

    // ***** Constructor *****
    function initialize(
        address[] memory addresses,
        uint256[] memory balances
    ) public initializer {
        require(addresses.length > 0 && balances.length > 0, "ADDR & BALANCE ERROR");

        __Ownable_init();
        __ERC20_init("NamCoin", "NAM");

        for (uint256 i = 0; i < addresses.length; i++) {
            _mint(addresses[i], balances[i] * (10**18));
        }
        require(totalSupply() == 1e24, "TTL SUPPLY DIFF 1 MIL");

        require(addresses.length == balances.length, "ADDR & BALANCE ERROR");

        
    }


}
