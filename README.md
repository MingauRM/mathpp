# Math++ module

## A math module that adds more functions that Lua's default doesn't have.

## Usage

Firstly, install MathPP via [Wally package manager](https://wally.run) or from this repository.

Then, require it from any script.

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local mathpp = require(ReplicatedStorage.Packages.mathpp)

    local number = 5.5
    local integer = mathpp.trunc(number) -- This returns only the integer part
    print(number)

## License

I dont have any license for this, if you would make a showcase on it, you can just credit me for the module.
