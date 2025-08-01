//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
//1. Deploy mock when we are on anvil chain
//2. keep track of contract address accross different chain
//3. Sepolia ETH/USD
//4. MAINNET ETH have different address
import {Script} from "forge-std/Script.sol";


contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;
    struct NetworkConfig{
        address priceFeed;
    }


    constructor(){
        if(block.chainid == 11155111){
            activeNetworkConfig = getSepoliaEthConfig();
        }else if(block.chainid == 1){
            activeNetworkConfig = getMainnetEthConfig();
        }else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }
    function getSepoliaEthConfig() public pure returns(NetworkConfig memory){
        //price feed address    
        //vrf address
        //gas address

        NetworkConfig memory sepoliaConfig  =  NetworkConfig ({ priceFeed : 0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return sepoliaConfig;

    }

    function getMainnetEthConfig() public pure returns(NetworkConfig memory){
    
        NetworkConfig memory mainnetConfig  =  NetworkConfig ({ priceFeed : 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419});
        return mainnetConfig;

    }


    function getAnvilEthConfig() public pure returns(NetworkConfig memory){
        // For local testing, use the Sepolia address (will fail without fork)
        NetworkConfig memory anvilConfig = NetworkConfig({priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return anvilConfig;
    }

}