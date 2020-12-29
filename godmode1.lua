--This is one way of god mode, of course its not really god mode since it sets your health to 22e9.
getglobal game
getfield -1 Players
getfield -1 LocalPlayer
getfield -1 Character
getfield -1 Humanoid
pushstring 22e9
setfield -2 MaxHealth
emptystack
getglobal game
getfield -1 Players
getfield -1 LocalPlayer
getfield -1 Character
getfield -1 Humanoid
pushnumber 22e9
setfield -2 Health
emptystack
