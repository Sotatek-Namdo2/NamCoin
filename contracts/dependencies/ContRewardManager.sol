// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

contract ContRewardManager is Initializable {
  // ----- Constants -----
  uint256 private constant UNIX_YEAR = 31_536_000;
  uint256 private constant HUNDRED_PERCENT = 100_000_000;
  uint256 private constant SEVEN_DAY = 7 hours;
  uint256 public constant ONE_MONTH = 1 days;
   function initialize(
      
    ) public initializer {
       
    }

}
