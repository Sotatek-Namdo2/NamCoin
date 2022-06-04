import {HardhatRuntimeEnvironment} from 'hardhat/types';
import {DeployFunction} from 'hardhat-deploy/types';

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts, getChainId } = hre;
  const { deploy, execute, read } = deployments;
  const { deployer } = await getNamedAccounts();
  console.log("Deploying contracts with the account:", deployer);

  await deploy("Nam", {
    from: deployer,
    log: true,
    proxy: {
      owner: deployer,
      proxyContract: "OptimizedTransparentProxy",
      execute: {
        init: {
          methodName: "initialize",
          args: [[deployer], [1_000_000]],
        },
      },
    },
  });
  const ContRewardManager = await deployments.get("ContRewardManager");
  console.log("ContRewardManager", ContRewardManager.address);
}

func.tags = ["NamCoin"];

export default func;
