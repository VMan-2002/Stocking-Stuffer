return {
    descriptions = {
        stocking_present = {
            Ruby_stocking_gift_card = {
                name = 'Gift Card',
                text = {
                    'Shop Jokers become {C:money}free{} on use',
                    '{C:inactive}Can only be used once per shop',
                    '{stocking}usable{}'
                }
            },
            Ruby_stocking_bag_of_gems = {
                name = 'Bag of Gems',
                text = {
                    'Every played {C:attention}card{}',
                    "permanently gains {C:mult}+#1#{} Mult,",
                    "{C:chips}+#2#{} Chips, {X:mult,C:white}X#3#{} Mult",
                    "or {X:chips,C:white}X#4#{} Chips",
                    '{stocking}before{}'
                }
            },
            Ruby_stocking_fuzzy_dice = {
                name = 'Fuzzy Dice',
                text = {
                    'Increase all {C:attention}listed{}',
                    "{C:green}probabilities{} by {X:green,C:white}X#1#{}",
                    "Increases by {X:green,C:white}X#2#{} for the",
                    "rest of the current round when",
                    "a card is scored",
                    "{stocking}before{}"
                }
            },
            Ruby_stocking_merchandise = {
                name = 'Merchandise',
                text = {
                    "Copies the ability of",
                    "a random {C:blue}Common{}, {C:green}Uncommon{}",
                    "or {C:red}Rare{} Joker from the collection",
                    "{C:red}Randomizes{} when entering the shop",
                    "{C:inactive}(Currently: #1#)",
                    "{stocking}before{} & {stocking}after{}",
                }
            }
        },
        -- stocking_wrapped_present = {
        --     template_stocking_present = {
        --         name = '{V:1}Present',
        --         text = {
        --             '  {C:inactive}What could be inside?  ',
        --             '{C:inactive}Open me to find out!'
        --         }
        --     },
        -- }
    },
    misc = {
        dictionary = {
            k_switch_ex = "Switch!"
        }
    }
}
