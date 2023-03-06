# Grant Delivery Reasoning

A very simple contract that allows users to send $FLOW token with a reasoning as to why it was sent.

An event, named `Delivered`, is emitted and includes an optional message that the sender can pass along with the token delivery.

The event (and associated optional message) will display in Flowscan so users are more aware as to why they were delivered $FLOW.

## Future Plans

In the future, it's easy to add any type of fungible token to this contract by simply adding a new function.