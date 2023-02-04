const GameToken = artifacts.require("GameToken");

module.exports = (deployer) => {
    deployer.deploy(GameToken);
};