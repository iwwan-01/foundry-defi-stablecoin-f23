// // SPDX-License-Identifier: MIT
// // Have our invariant aka properties that should always hold true

// // What are our invariants?

// // 1. The total supply of DSC should be less than the total value of collateral.
// // 2. Getter view functions should never revert <-evergreen invariant

// pragma solidity ^0.8.18;

// import {Test, console} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// contract OpenInvariantsTest is StdInvariant, Test {
//     DecentralizedStableCoin dsc;
//     DSCEngine engine;
//     HelperConfig helperConfig;
//     address weth;
//     address wbtc;

//     function setUp() external {
//         DeployDSC deployer = new DeployDSC();
//         (dsc, engine, helperConfig) = deployer.run();
//         (,, weth, wbtc,) = helperConfig.activeNetworkConfig();
//         targetContract(address(engine));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(engine));
//         uint256 totalWBtcDeosited = IERC20(wbtc).balanceOf(address(engine));
//         uint256 wethValue = engine.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = engine.getUsdValue(wbtc, totalWBtcDeosited);

//         console.log("WETH Value: ", wethValue);
//         console.log("WBTC Value: ", wbtcValue);
//         console.log("Total Supply: ", totalSupply);

//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }
