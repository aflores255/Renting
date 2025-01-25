//1. License
// SPDX-License-Identifier: LGPL-3.0-only

//2. Solidity version
pragma solidity 0.8.24;

//3. Contract

contract Renting {

    //Variables definition
    address public owner;
    address public tenant;
    uint256 public rentAmount; // in ether
    uint256 public rentalPeriod; // measured in seconds
    uint256 public startTime; // time_stamp
    bool public isActive;
    string public assetName;  // Asset to rent
    uint256 public depositPercentage = 20;  // Safety deposit percentage
    uint256 public depositAmount;  // Safety Deposit
    uint256 public totalAmount;    // previous total amount to pay

    //First execution to initialize variables
    constructor(address tenant_, uint256 rentAmount_, uint256 rentalPeriod_, string memory assetName_) {
        owner = msg.sender; // Contract deployer
        tenant = tenant_;
        rentAmount = rentAmount_;
        rentalPeriod = rentalPeriod_;
        assetName = assetName_;  // Asset to rent name
        isActive = false;

        // Calculate deposit + rent amount
        depositAmount = (rentAmount * depositPercentage) / 100;
        totalAmount = rentAmount + depositAmount;
    }

    //Modifiers

    modifier onlyOwner() {
        if (msg.sender != owner)  revert("Only the owner can perform this action");   
        _;
    }

    modifier onlyTenant() {
        if (msg.sender != tenant) revert("Only the tenant can perform this action"); 
        _;
    }

    modifier isRentalActive() {
        if (!isActive) revert("The rental contract is not active");     
        _;
    }

    modifier isRentalInactive() {
        if (isActive) revert("The rental contract is active");    
        _;
    }

    modifier rentalPeriodNotOver() {
        if (block.timestamp >= startTime + rentalPeriod) revert("Rental period has ended");    
        _;
    }

    modifier checkQuantity(){
        if (msg.value != totalAmount) revert("Incorrect payment amount. Must be rent + deposit");
        _;
    }

    modifier checkTime(){
        if (block.timestamp < startTime + rentalPeriod) revert("Rental period has not ended yet");      
        _;
        
    }
    // Events
    event RentPaid(address indexed tenant, uint256 amount);
    event RentalCompleted(address indexed tenant, uint256 amountRefunded);


    //External Functions
    function payRent() external payable onlyTenant isRentalInactive checkQuantity{

        isActive = true;
        startTime = block.timestamp;

        emit RentPaid(msg.sender, msg.value);
    }

    function completeRental() external onlyOwner isRentalActive {
        

        isActive = false;

        payable(tenant).transfer(depositAmount);

        emit RentalCompleted(tenant, depositAmount);
    }

    function rentalStatus() external view returns (bool) {
        return isActive;
    }

    function getAssetName() external view returns (string memory) {
        return assetName;
    }

    function getDepositAmount() external view returns (uint256) {
        return depositAmount;
    }
}
