pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Marketplace.sol";

contract TestMarketplace {
//  test  it's the current admin
   function testCurrentAdminUsingDeployedContract() public {
        Marketplace admin = Marketplace(DeployedAddresses.Marketplace());
        Assert.equal(admin.CurrentAdmin(msg.sender), true, "Is current admin");
    }
// test it's current store owner  
   function testCurrentStoreOwnerUsingDeployedContract() public {
         Marketplace  admin = Marketplace(DeployedAddresses.Marketplace());
        Assert.equal(admin.CurrentStoreOwner(msg.sender), false, "Is current store owner");
    }
 // test it's the first admin  
   function testFirstAdminUsingDeployedContract() public {
        Marketplace admin = Marketplace(DeployedAddresses.Marketplace());
        Assert.equal(admin.Alladmins(0),  msg.sender, "Is first admin");
    }
}

