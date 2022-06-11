
assets = require "groop"

function love.load()

   assets.load()

   love.graphics.setFont(assets.get("fonts", "Minecraft"))
   love.audio.play(assets.get("sounds", "Nightmares Inn - RKVC"))

end

function love.draw()
   love.graphics.draw(assets.get("images", "loose sprites gbstudio"), 0, 0)
   love.graphics.print("Hello Font!", 256, 256)
end
