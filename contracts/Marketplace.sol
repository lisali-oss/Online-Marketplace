pragma solidity ^0.4.22;

import "./Ownable.sol";

/**
 * @title Marketplace
 * @dev The Marketplace contract provides an online marketplace
 * service of stores.
 */

contract Marketplace is Ownable {
    
    
    
    // Map addresses to admins
    mapping (address => bool) public admins;

    // Map addresses to store owners
    mapping (address => bool) storeOwners;

 // Keep track of all admins that have ever existed
    address[] public Alladmins;

    // Keep track of all account readers that have ever existed
    address[] public AllstoreOwner;

    
    modifier onlyAdmin {
        require(admins[msg.sender] == true); _;
    }
    

    uint private storeId;
    
     // For circuit breaker
    bool public stopped = false;
    

    // Structs
    struct Store {
        uint storeID;
        string name;
        address owner;
    }
    
    
    mapping (address => Store) StoreOwners;
    
    uint[] private storeArray;
    mapping (uint => Store) stores;
    
    // Keep track of all StoreOwners
  //  address[] public AllstoreOwner;
    

    
    modifier StoreOwnerOnly(uint _storeId) {
        require(stores[_storeId].owner == msg.sender); 
        _;
    }
    
  //  modifier onlyAdmin {
   //     require(admins[msg.sender] == true); _;
   
    modifier stopInEmergency {require(!stopped); _;}
    
      // Construct the contract
    constructor() public {
	
        // Set the first admin to be the person creating the contract
        admins[msg.sender] = true;
        Alladmins.length++;
        Alladmins[Alladmins.length - 1] = msg.sender;
    }
   
   
      /** @dev Function to get current admin address.
      * @param _address Address of an Ethereum account.
      */   
      
    function CurrentAdmin(address _address) view public returns (bool) {
        return admins[_address];
    }

    // Function to make sure the the specified address is currently a store owner.
     
    function CurrentStoreOwner(address _address) view public returns (bool) {
        return storeOwners[_address];
    }


   /** @dev Function to return an array of storeOwners.
      * @return AllstoreOwner An array of storeOwners addresses.
      */
     
    function getAdmins() public view returns(address[] adminAddresses) {
        return Alladmins;
    }
    
    // Function to return an array of store owners.
      
    function getStoreOwners() public view returns(address[] storeOwnerAddresses) {
        return AllstoreOwner;
    }
    
  //function to add an admin  
  
  function addAdmin(address _a)
    public
    onlyAdmin
    returns(bool)
    {
        admins[_a] = true;
        return true;
    }
    
  function removeAdmin(address _a)
    public
    onlyAdmin
    returns(bool)
    {
        admins[_a] = true;
        return true;
    }
   
   function addStoreOwner(address _a)
    public
    onlyAdmin
    returns(bool)
    {
        storeOwners[_a] = true;
        return true;
    }
    
    function removeStoreOwner(address _a)
    public
    onlyAdmin
    returns(bool)
    {
        storeOwners[_a] = true;
        return true;
    }
    
     /** @dev Function to allow a store owner to add a new Store.
      * @param _name Name of the store.
      */       
    function AddStore(string _name) public stopInEmergency {
        
        stores[storeId].storeID = storeId;
        stores[storeId].name = _name;
        stores[storeId].owner = msg.sender;
        
        storeArray.push(storeId);
        storeId++;
       
    }
   
      /** @dev Function to get a Store.
      * @param _storeId The ID of the store.
      */  
    
    function GetStore(uint _storeId) public view returns(uint id, string name, address owner) {
        return(stores[_storeId].storeID, stores[_storeId].name, stores[_storeId].owner);
    }
    
      /** @dev Function to allow a store owner to ChangeStoreOwner.
      * @param _storeId The ID of the store.
      */   
    
    function ChangeStoreOwner(uint _storeId, address _newOwner) public stopInEmergency StoreOwnerOnly(_storeId) returns(bool changed) {
        stores[_storeId].owner = _newOwner;
        return true;
    }
    
}


