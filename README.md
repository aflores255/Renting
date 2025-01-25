# 🏠 Renting Smart Contract

## 📝 **Overview**
The **Renting Smart Contract** is a blockchain-based application designed to facilitate secure rental agreements. Built with **Solidity**, this contract allows two parties—a property owner (landlord) and a tenant—to establish a rental agreement with a clear set of rules. 

It manages the payment of rent and deposit, tracks the rental status, and ensures the return of the deposit upon contract completion. 

This contract was developed and tested using **Remix IDE**, an easy-to-use platform for deploying and interacting with smart contracts directly in your browser.

---

## 🚀 **Features**

| **Feature**                        | **Description**                                                                                         |
|------------------------------------|---------------------------------------------------------------------------------------------------------|
| 💵 **Rent Payment**                | Tenant pays rent and a security deposit to activate the rental agreement.                              |
| 🔐 **Secure Deposit**              | Deposit ensures accountability and is refunded to the tenant upon successful contract completion.       |
| ⏱️ **Rental Period Management**     | Tracks rental duration and ensures actions are taken only within allowed timeframes.                   |
| 🔔 **Event Notifications**         | Emits events to notify when rent is paid or the contract is completed.                                 |

---

## 📜 **Smart Contract Details**

---

### ⚙️ **Modifiers**
Modifiers enforce specific rules before allowing a function to execute. 

| **Modifier**                       | **Description**                                                                                           |
|------------------------------------|-----------------------------------------------------------------------------------------------------------|
| **`onlyOwner`**                    | Ensures the function is called by the landlord.                                                          |
| **`onlyTenant`**                   | Ensures the function is called by the tenant.                                                            |
| **`isRentalActive`**               | Checks if the rental contract is currently active.                                                       |
| **`isRentalInactive`**             | Checks if the rental contract is inactive.                                                               |
| **`rentalPeriodNotOver`**          | Ensures the function is called before the rental period ends.                                            |
| **`checkQuantity`**                | Validates that the payment amount matches the required rent and deposit.                                 |
| **`checkTime`**                    | Ensures the function is called after the rental period ends.                                             |

---

### 📡 **Events**

| **Event**                          | **Description**                                                                                         |
|------------------------------------|---------------------------------------------------------------------------------------------------------|
| **`RentPaid`**                     | Triggered when the tenant successfully pays rent and the deposit.                                       |
| **`RentalCompleted`**              | Triggered when the landlord completes the contract and refunds the tenant's deposit.                   |

---

### 💻 **Contract Functions**

#### **Core Functions**

| **Function**                      | **Description**                                                                                         |
|-----------------------------------|---------------------------------------------------------------------------------------------------------|
| **`payRent()`**                   | Allows the tenant to pay rent and the deposit to activate the contract.                                 |
| **`completeRental()`**            | Allows the landlord to complete the rental and refund the deposit to the tenant.                        |

#### **Utility Functions**

| **Function**                      | **Description**                                                                                         |
|-----------------------------------|---------------------------------------------------------------------------------------------------------|
| **`rentalStatus()`**              | Returns the current status of the rental contract (active/inactive).                                    |
| **`getAssetName()`**              | Returns the name of the rented asset.                                                                   |
| **`getDepositAmount()`**          | Returns the calculated deposit amount.                                                                  |

---

## 🛠️ **How to Use**

### 🔧 **Prerequisites**

- **Remix IDE**: You can access it at [Remix Ethereum](https://remix.ethereum.org).
- A basic understanding of Ethereum transactions and wallet addresses is helpful but not required.

---

### 🚀 **Deployment Steps**

1. Open **Remix IDE** and create a new file (e.g., `Renting.sol`).
2. Paste the smart contract code into the file.
3. Compile the contract using Solidity version **0.8.24**.
4. Deploy the contract to the **JavaScript VM (Remix's simulated blockchain)** or any compatible Ethereum network.
   - Provide the following deployment arguments:
     - Tenant's Ethereum address.
     - Rent amount (in wei, where 1 Ether = 10¹⁸ wei).
     - Rental period (in seconds, e.g., 30 days = `30 * 24 * 60 * 60`).
     - Name of the asset being rented (e.g., `"Apartment"`).

---

### 🖱️ **Interacting with the Contract**

#### **For the Tenant:**
- Use the **`payRent()`** function to pay the required rent and deposit.
  - Enter the correct payment amount in the "Value" field (rent + deposit in wei) before executing the transaction.
- Verify the rental status using the **`rentalStatus()`** function.

#### **For the Landlord:**
- Once the rental period ends, use the **`completeRental()`** function to finalize the agreement and refund the tenant's deposit.

#### **General:**
- Monitor the emitted events (`RentPaid`, `RentalCompleted`) in Remix's transaction log to confirm successful operations.

---

## 📄 **License**
This project is licensed under the **LGPL-3.0-only**.

---
