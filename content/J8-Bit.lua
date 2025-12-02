-- Developer name - Replace 'template' with your display name
-- Note: This will be used to link your objects together, and be displayed under the name of your additions
local display_name = 'J8-Bit'
-- MAKE SURE THIS VALUE HAS BEEN CHANGED


-- Present Atlas Template
-- Note: You are allowed to create more than one atlas if you need to use weird dimensions
-- We recommend you name your atlas with your display_name included
SMODS.Atlas({
    key = display_name .. '_presents',
    path = display_name .. '_presents.png',
    px = 69,
    py = 93
})


-- Developer Template
-- Note: This object is how your WrappedPresent and Presents get linked
StockingStuffer.Developer({
    name = display_name, -- DO NOT CHANGE

    -- Replace '000000' with your own hex code
    -- Used to colour your name and some particles when opening your present
    colour = HEX('FDA757')
})

-- Wrapped Present Template
-- key defaults to 'display_name_stocking_present'
StockingStuffer.WrappedPresent({
    developer = display_name, -- DO NOT CHANGE

    pos = { x = 0, y = 0 },   -- position of present sprite on your atlas
    pixel_size = { w = 58, h = 66 },
    -- atlas defaults to 'stocking_display_name_presents' as created earlier but can be overriden

    -- Your present will be given an automatically generated name and description. If you want to customise it you can, though we recommend keeping the {V:1} in the name
    -- You are encouraged to use the localization file for your name and description, this is here as an example
    -- loc_txt = {
    --     name = '{V:1}Present',
    --     text = {
    --         '  {C:inactive}What could be inside?  ',
    --         '{C:inactive}Open me to find out!'
    --     }
    -- },
})

-- Booster Box
StockingStuffer.Present({
    developer = display_name, -- DO NOT CHANGE

    key = 'booster_box',      -- keys are prefixed with 'display_name_stocking_' for reference
    pos = { x = 1, y = 0 },
    pixel_size = { w = 59, h = 53 },

    -- use and can_use are completely optional, delete if you do not need your present to be usable
    can_use = function(self, card)
        -- check for use condition here
        return true
    end,
    use = function(self, card, area, copier)
        -- do stuff here
        print('example')
    end,
    keep_on_use = function(self, card)
        -- return true when card should be kept
    end,

    -- calculate is completely optional, delete if your present does not need it
    calculate = function(self, card, context)
        -- check context and return appropriate values
        -- StockingStuffer.first_calculation is true before jokers are calculated
        -- StockingStuffer.second_calculation is true after jokers are calculated
        if context.joker_main then
            return {
                message = 'example'
            }
        end
    end
})

-- Christmas Crack
StockingStuffer.Present({
    developer = display_name, -- DO NOT CHANGE

    key = 'christmas_crack',  -- keys are prefixed with 'display_name_stocking_' for reference
    pos = { x = 2, y = 0 },
    pixel_size = { w = 65, h = 85 },

    -- use and can_use are completely optional, delete if you do not need your present to be usable
    can_use = function(self, card)
        -- check for use condition here
        return true
    end,
    use = function(self, card, area, copier)
        -- do stuff here
        print('example')
    end,
    keep_on_use = function(self, card)
        -- return true when card should be kept
    end,

    -- calculate is completely optional, delete if your present does not need it
    calculate = function(self, card, context)
        -- check context and return appropriate values
        -- StockingStuffer.first_calculation is true before jokers are calculated
        -- StockingStuffer.second_calculation is true after jokers are calculated
        if context.joker_main then
            return {
                message = 'example'
            }
        end
    end
})

-- Label Maker
StockingStuffer.Present({
    developer = display_name, -- DO NOT CHANGE

    key = 'label_maker',      -- keys are prefixed with 'display_name_stocking_' for reference
    pos = { x = 3, y = 0 },
    pixel_size = { w = 57, h = 68 },

    -- use and can_use are completely optional, delete if you do not need your present to be usable
    can_use = function(self, card)
        -- check for use condition here
        return true
    end,
    use = function(self, card, area, copier)
        -- do stuff here
        print('example')
    end,
    keep_on_use = function(self, card)
        -- return true when card should be kept
    end,

    -- calculate is completely optional, delete if your present does not need it
    calculate = function(self, card, context)
        -- check context and return appropriate values
        -- StockingStuffer.first_calculation is true before jokers are calculated
        -- StockingStuffer.second_calculation is true after jokers are calculated
        if context.joker_main then
            return {
                message = 'example'
            }
        end
    end
})

-- Water Cooler
StockingStuffer.Present({
    developer = display_name, -- DO NOT CHANGE

    key = 'water_cooler',     -- keys are prefixed with 'display_name_stocking_' for reference
    pos = { x = 4, y = 0 },
    pixel_size = { w = 51, h = 92 },

    -- use and can_use are completely optional, delete if you do not need your present to be usable
    can_use = function(self, card)
        -- check for use condition here
        return true
    end,
    use = function(self, card, area, copier)
        -- do stuff here
        print('example')
    end,
    keep_on_use = function(self, card)
        -- return true when card should be kept
    end,

    -- calculate is completely optional, delete if your present does not need it
    calculate = function(self, card, context)
        -- check context and return appropriate values
        -- StockingStuffer.first_calculation is true before jokers are calculated
        -- StockingStuffer.second_calculation is true after jokers are calculated
        if context.joker_main then
            return {
                message = 'example'
            }
        end
    end
})

-- Tech X
StockingStuffer.Present({
    developer = display_name, -- DO NOT CHANGE

    key = 'tech_x',           -- keys are prefixed with 'display_name_stocking_' for reference
    pos = { x = 5, y = 0 },
    pixel_size = { w = 61, h = 45 },

    -- use and can_use are completely optional, delete if you do not need your present to be usable
    can_use = function(self, card)
        -- check for use condition here
        return true
    end,
    use = function(self, card, area, copier)
        -- do stuff here
        print('example')
    end,
    keep_on_use = function(self, card)
        -- return true when card should be kept
    end,

    -- calculate is completely optional, delete if your present does not need it
    calculate = function(self, card, context)
        -- check context and return appropriate values
        -- StockingStuffer.first_calculation is true before jokers are calculated
        -- StockingStuffer.second_calculation is true after jokers are calculated
        if context.joker_main then
            return {
                message = 'example'
            }
        end
    end
})
