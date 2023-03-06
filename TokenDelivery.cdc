import FlowToken from "./utility/FlowToken.cdc"
import FungibleToken from "./utility/FungibleToken.cdc"

pub contract TokenDelivery {

    pub event Delivered(tokenType: Type, amount: UFix64, to: Address, message: String?)

    pub fun deliverFlow(vault: @FlowToken.Vault, receiver: Address, message: String?) {
        emit Delivered(tokenType: vault.getType(), amount: vault.balance, to: receiver, message: message)

        let receiverVault = getAccount(receiver).getCapability(/public/flowTokenReceiver)
                        .borrow<&{FungibleToken.Receiver}>()
                        ?? panic("Receiver does not have a vault set up to accept Flow Token.")
        receiverVault.deposit(from: <- vault)
    }
}