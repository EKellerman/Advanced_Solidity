pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";


contract PupperCoinSale is Crowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale, MintedCrowdsale {
    

    constructor(
    
        uint rate,
        uint name,
        uint symbol, 
        address payable wallet,
        uint open,
        uint close,
        uint goal
    )
       
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet,
        uint open,
        uint close,
        uint goal
    )
        public
    {
        // create the PupperCoin and keep its address handy
        // create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);
        
        PupperCoinSale toke_sale = new PupperCoinSale(1, "PupperCoin", sale_address, now, now + 24 weeks, "PUPR", 18, token_address);
        sale_address = address(token);
        
        
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}

