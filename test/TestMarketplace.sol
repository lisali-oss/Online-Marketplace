pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Marketplace.sol";

contract TestMarketplace {
    
    function testCurrentAdminUsingDeployedContract() public {
        Marketplace admin = Marketplace(DeployedAddresses.Marketplace());
        Assert.equal(admin.CurrentAdmin(msg.sender), true, "Is current admin");
    }
    
    function testCurrentStoreOwnerUsingDeployedContract() public {
        Marketplace  admin = Marketplace(DeployedAddresses.Marketplace());
        Assert.equal(admin.CurrentStoreOwner(msg.sender), false, "Is current store owner");
    }
    
    function testFirstAdminUsingDeployedContract() public {
        Marketplace admin = Marketplace(DeployedAddresses.Marketplace());
        Assert.equal(admin.Alladmins(0),  msg.sender, "Is first admin");
    }
                
    function testAddNewStore() public {
        Marketplace market = Marketplace(DeployedAddresses.Marketplace());
        market.AddStore("My Store");
        uint i;
        string memory n;
        address a;
        (i,n,a) = market.GetStore(0);
        Assert.equal(0, i, "New Store should be recorded.");
    }

    function testChangeStoreOwner() public {
        Marketplace market = Marketplace(DeployedAddresses.Marketplace());
        market.ChangeStoreOwner(0,0x14723a09acff6d2a60dcdf7aa4aff308fddc160c);
        uint i;
        string memory n;
        address a;
        (i,n,a) = market.GetStore(0);
        Assert.equal(0x14723a09acff6d2a60dcdf7aa4aff308fddc160c, a, "Store Owner Change should be recorded.");
    }
}
