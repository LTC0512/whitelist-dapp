// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Create a max number of Whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of Whitelisted addresses
    // If the address is whitelisted = true, set to false by default
    mapping(address => bool) public whitelistedAddresses;

    // numAdressesWhitelisted will keep track of the number addresses whitelisted
    // Don't change the name of this variable, it will be part of the verification
    uint8 public numAddressWhitelisted;

    // Setting the max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
    The addAddress function adds the address of the sender
     */
    function addAddressToWhitelist() public {
        // Check to see if the address already have whitelist
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been Whitelisted"
        );
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(
            numAddressWhitelisted < maxWhitelistedAddresses,
            "More addresses cannot be added, limited capacity"
        );
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressWhitelisted++;
    }
}
// Uncomment this line to use console.log
// import "hardhat/console.sol";
