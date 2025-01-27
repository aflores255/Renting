# 🏠 Renting Smart Contract

## 📝 **Overview**
The **Renting Smart Contract** is a blockchain-based application designed to facilitate secure rental agreements. Built with **Solidity**, this contract allows two parties—a property owner and a tenant—to establish a rental agreement with a clear set of rules. 

It manages the payment of rent and deposit, tracks the rental status, ensures the return of the deposit upon contract completion, and includes a mechanism to track if the rental is finished.

This contract was developed and tested using **Remix IDE**.
---

## 🚀 **Features**

| **Feature**                        | **Description**                                                                                         |
|------------------------------------|---------------------------------------------------------------------------------------------------------|
| 💵 **Rent Payment**                | Tenant pays rent and a security deposit to activate the rental agreement.                              |
| 🔐 **Secure Deposit**              | Deposit ensures accountability and is refunded to the tenant upon successful contract completion.       |
| ⏱️ **Rental Period Management**     | Tracks rental duration and ensures actions are taken only within allowed timeframes.                   |
| 🔔 **Event Notifications**         | Emits events to notify when rent is paid or the contract is completed.                                 |
| ✅ **Rental Completion Status**     | Provides functionality to check if the rental has been completed.                                      |

---

## 📜 **Smart Contract Details**

---

### ⚙️ **Modifiers**
Modifiers enforce specific rules before allowing a function to execute. 

| **Modifier**                       | **Description**                                                                                           |
|------------------------------------|-----------------------------------------------------------------------------------------------------------|
| **`onlyOwner`**                    | Ensures the function is called by the owner.                                                          |
| **`onlyTenant`**                   | Ensures the function is called by the tenant.                                                            |
| **`isRentalActive`**               | Checks if the rental contract is currently active.                                                       |
| **`isRentalInactive`**             | Checks if the rental contract is inactive.                                                               |
| **`rentalPeriodNotOver`**          | Ensures the function is called before the rental period ends.                                            |
| **`checkQuantity`**                | Validates that the payment amount matches the required rent and deposit.                                 |
| **`checkTime`**                    | Ensures the function is called after the rental period ends.                                             |
| **`isRentalFinished`**             | Ensures the rental has not been marked as finished.                                                      |

---

### 📡 **Events**

| **Event**                          | **Description**                                                                                         |
|------------------------------------|---------------------------------------------------------------------------------------------------------|
| **`RentPaid`**                     | Triggered when the tenant successfully pays rent and the deposit.                                       |
| **`RentalCompleted`**              | Triggered when the owner completes the contract and refunds the tenant's deposit.                   |

---

### 💻 **Contract Functions**

#### **Core Functions**

| **Function**                      | **Description**                                                                                         |
|-----------------------------------|---------------------------------------------------------------------------------------------------------|
| **`payRent()`**                   | Allows the tenant to pay rent and the deposit to activate the contract.                                 |
| **`completeRental()`**            | Allows the owner to complete the rental and refund the deposit to the tenant.                        |

#### **Utility Functions**

| **Function**                      | **Description**                                                                                         |
|-----------------------------------|---------------------------------------------------------------------------------------------------------|
| **`rentalStatus()`**              | Returns the current status of the rental contract (active/inactive).                                    |
| **`getAssetName()`**              | Returns the name of the rented asset.                                                                   |
| **`getDepositAmount()`**          | Returns the calculated deposit amount.                                                                  |
| **`RentalFinished()`**            | Returns whether the rental has been marked as finished.                                                 |

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
4. Deploy the contract as an owner to the **Remix VM (Remix's simulated blockchain)** or any compatible Ethereum network.
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

#### **For the Owner:**
- Once the rental period ends, use the **`completeRental()`** function to finalize the agreement and refund the tenant's deposit.

#### **General:**
- Monitor the emitted events (`RentPaid`, `RentalCompleted`) in Remix's transaction log to confirm successful operations.
- Once the contract is marked as finished it cannot be reopened.

---

## 📄 **License**
This project is licensed under the **LGPL-3.0-only**.

---
