-- Developer name - Replace 'template' with your display name
-- Note: This will be used to link your objects together, and be displayed under the name of your additions
local display_name = 'Freh'
-- MAKE SURE THIS VALUE HAS BEEN CHANGED


-- Present Atlas Template
-- Note: You are allowed to create more than one atlas if you need to use weird dimensions
-- We recommend you name your atlas with your display_name included
SMODS.Atlas({
    key = display_name..'_presents',
    path = 'freh_presents.png',
    px = 71,
    py = 95
})


-- Developer Template
-- Note: This object is how your WrappedPresent and Presents get linked
StockingStuffer.Developer({
    name = display_name, -- DO NOT CHANGE

    -- Replace '000000' with your own hex code
    -- Used to colour your name and some particles when opening your present
    colour = HEX('6D3EAC')
})

-- Wrapped Present Template
-- key defaults to 'display_name_stocking_present'
StockingStuffer.WrappedPresent({
    developer = display_name, -- DO NOT CHANGE

    pos = { x = 0, y = 0 }, -- position of present sprite on your atlas
	pixel_size = { w = 43, h = 61 },
	display_size = { w = 43 * 1.4, h = 61 * 1.4 },
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

StockingStuffer.Present({
    developer = display_name,
    key = 'v1_plush',
    pos = { x = 1, y = 0 },
    pixel_size = { w = 42, h = 60 },
	display_size = { w = 42 * 1.2, h = 60 * 1.2 },
	config = { extra = { xmult = 1, xmult_mod = 0.05 }},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
			if StockingStuffer.first_calculation then
				local to_consume = {}
				local should_ret = false
				for k, v in ipairs(context.scoring_hand) do
					if v:is_suit("Hearts") then
						card.ability.extra.xmult = card.ability.extra.xmult + v:get_chip_bonus() * card.ability.extra.xmult_mod
						to_consume[#to_consume + 1] = v
						should_ret = true
					end
				end
				SMODS.destroy_cards(to_consume)
				return {
                    message = should_ret and "X" .. tostring(card.ability.extra.xmult) .. " Mult",
					colour = should_ret and G.C.RED,
                    card = should_ret and card
                }
			elseif StockingStuffer.second_calculation and card.ability.extra.xmult > 1 then
				return {
					xmult = card.ability.extra.xmult
				}
			end
        end
    end
})

StockingStuffer.Present({
    developer = display_name,
    key = '3d_printer',
    pos = { x = 3, y = 0 },
    pixel_size = { w = 64, h = 65 },
	disable_use_animation = true,
	config = { extra = { odds = 2, state = 1, odds_multplier = 3,  }},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.odds * card.ability.extra.state, G.GAME.probabilities.normal, (card.ability.extra.state >= 3 and "Present") or "Joker", (card.ability.extra.state < 3 and "Present") or "Joker", (card.ability.extra.state >= 3 and "") or "Common ", } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and StockingStuffer.first_calculation and pseudorandom('3d_printer') < G.GAME.probabilities.normal / card.ability.extra.odds * card.ability.extra.state then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
				SMODS.add_card({ set = (card.ability.extra.state >= 3 and 'stocking_present') or 'Joker',
				area = card.ability.extra.state >= 3 and G.stocking_present,
				rarity = card.ability.extra.state < 3 and 0.5})
				return true
			end
			}))
			return {
				message = (card.ability.extra.state >= 3 and localize('k_plus_present')) or (card.ability.extra.state < 3 and localize('k_plus_joker')),
            }
        end
    end,
	use = function(self, card)
        local swap = card.ability.extra.state
		card.ability.extra.state = card.ability.extra.odds_multplier
		card.ability.extra.odds_multplier = swap
		SMODS.calculate_effect({
            message = localize('k_swap_ex')
        }, card)
    end,
    keep_on_use = function()
        return true
    end,
    can_use = function(self, card)
        return true
    end
})

StockingStuffer.Present({
    developer = display_name,
    key = 'model_kit',
    pos = { x = 6, y = 0 },
    pixel_size = { w = 71, h = 72 },
	display_size = { w = 72, h = 72 },
    calculate = function(self, card, context)
        if context.joker_main then 
			return {
				message = StockingStuffer.first_calculation and localize('k_convert_ex'),
				colour = StockingStuffer.first_calculation and G.C.PURPLE,
				mult_mod = StockingStuffer.first_calculation and hand_chips,
				chip_mod = StockingStuffer.first_calculation and -hand_chips,
				balance = StockingStuffer.second_calculation and true
			}
        end
    end
})

StockingStuffer.Present({
    developer = display_name,
    key = 'structure_deck',
    pos = { x = 4, y = 0 },
    pixel_size = { w = 62, h = 90 },
	config = { extra = { cards = 10 }},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cards } }
    end,
    use = function(self, card)
		for i = 1, G.jokers.config.card_limit - #G.jokers.cards do
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
				play_sound('timpani')
				SMODS.add_card({ set = 'Joker', area = G.jokers })
				card:juice_up(0.3, 0.5)
				return true
			end
			}))
		end
		delay(1.5)
		for i = 1, G.consumeables.config.card_limit - #G.consumeables.cards - G.GAME.consumeable_buffer do
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
				play_sound('timpani')
				SMODS.add_card({ set = 'Consumeables', area = G.consumeables })
				card:juice_up(0.3, 0.5)
				return true
			end
			}))
		end
		delay(1.5)
		for i = 1, card.ability.extra.cards do
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
				play_sound('timpani')
				_givenenhancement = SMODS.poll_enhancement({guaranteed = true})
				SMODS.add_card { set = "Base", enhancement = _givenenhancement, area = G.deck }
				card:juice_up(0.3, 0.5)
				return true
			end
			}))
		end
    end,
    keep_on_use = function()
        return false
    end,
    can_use = function(self, card)
        return true
    end
})

StockingStuffer.Present({
    developer = display_name,
    key = 'pipe_bomb',
    pos = { x = 2, y = 0 },
    pixel_size = { w = 41, h = 46 },
	display_size = { w = 41 * 1.1, h = 46 * 1.1 },
	config = { extra = { odds = 4 }},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.odds, G.GAME.probabilities.normal } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and StockingStuffer.second_calculation and pseudorandom('pipe_bomb') < G.GAME.probabilities.normal / card.ability.extra.odds then
			SMODS.destroy_cards(context.full_hand)
			SMODS.destroy_cards(card)
            return {
				message = localize('k_exploded_ex'),
            }
        end
    end
})