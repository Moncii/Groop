# Groop
Groop provides a simple way to orginize, manage, and load assets.

## Installation
```lua
assets = require "groop"
```
## Ussage
The default file structure Groop will look for is:
```
Assets/
  Images/
  Sounds/
  Fonts/
  
```
```lua
 function love.load()
 
  assets.load()
 
 end
```
