import FlowToken from "./utility/FlowToken.cdc"
import FungibleToken from "./utility/FungibleToken.cdc"
import TokenDelivery from "./TokenDelivery.cdc"

transaction(amount: UFix64, to: Address, message: String?) {

    let Vault: @FlowToken.Vault

    prepare(signer: AuthAccount) {
        let signerFlowVault: &FlowToken.Vault{FungibleToken.Provider} = signer.borrow<&FlowToken.Vault{FungibleToken.Provider}>(from: /storage/flowTokenVault)
                                    ?? panic("Signer does not have a Flow Token Vault set up.")
        self.Vault <- signerFlowVault.withdraw(amount: amount) as! @FlowToken.Vault
    }

    execute {
        TokenDelivery.deliverFlow(vault: <- self.Vault, receiver: to, message: message)
    }
}