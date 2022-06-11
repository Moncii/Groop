
-- Groop v0.1
-- Created by Moncii
-- MIT license

groop = {

   directories = {
      ["assets"] = "Assets",
      ["images"] = {"Images", "images"},
      ["sounds"] = {"Sounds", "sounds"},
      ["fonts" ] = {"Fonts", "fonts"},
   },

   extensions = {
      ["images"] = {".jpg",".jpeg",".png",".bmp",".tga",".hdr",".pic",".exr"},
      ["sounds"] = {".wav", ".mp3", ".ogg", ".oga", ".ogv"},
      ["fonts" ] = {".ttf"},
   },

   processes = {
      ["images"] = function(file)
         local asset = love.graphics.newImage(file)
         return asset
      end,
      ["sounds"] = function(file)
         local asset = love.audio.newSource(file, "static")
         return asset
      end,
      ["fonts"] = function(file)
         local asset = love.graphics.newFont(file)
         return asset
      end,
   },

   assets = {
      ["images"] = {},
      ["fonts" ] = {},
      ["sounds"] = {},
   },

   -- Load in and create all of the assets --
   load = function()

      if(love.filesystem.getInfo(groop.directories["assets"]) ~= nil) then -- Check for valid assets home folder
         for k, v in pairs(groop.directories) do
            if(k ~= "assets") then -- Ignore the home directory

               local dir = groop.directories["assets"].."/"..v[1]
               local files = love.filesystem.getDirectoryItems(dir) -- Get all files in the directory
               local type = v[2]
               local process = groop.processes[type]

               for i=1, #files do
                  local f = files[i]

                  local name = string.match(f, "(.+)%.")
                  local extension = "."..string.match(f, "%.(.+)")

                  local file = dir.."/"..f

                  if(validExtension(extension, type)) then
                     local asset = process(file)
                     groop.assets[type][name] = asset
                  end

               end

            end
         end
      end

   end,

   -- Retrive a desired asset --
   get = function(type, asset)
      local asset_ = groop.assets[type][asset]
      if(asset_ == nil) then
         print("Error: Groop is trying to retreive asset '"..asset.."' from type '"..type.."'")
         print("Asset does not exist.")
      else
         return asset_
      end
   end,

   -- Define asset locations and types --
   define = function(type, directory, extensions, process)
      if(type == "assets") then
         groop.directories[type] = directory
      else
         groop.directories[type][1] = directory or groop.directories[type]
         groop.directories[type][2] = type
         groop.extensions[type] = extensions or groop.extensions[type]
         groop.processes[type] = process or groop.processes[type]
      end
   end,

}

-- Function to check if a file has a supported file extension --
function validExtension(ext, extList)
   for k, v in pairs(groop.extensions[extList]) do
      if(v == ext) then
         return true
      end
   end
   return false
end

return groop
