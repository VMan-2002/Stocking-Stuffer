return {
    descriptions = {
        stocking_present = {
            ["J8-Bit_stocking_booster_box"] = {
                name = 'Booster Box',
                text = {
                    "Creates a {C:money}double-priced",
                    "copy of the most recently",
                    "opened {C:attention}Booster Pack"
                }
            },
            ["J8-Bit_stocking_christmas_crack"] = {
                name = 'Christmas Crack',
                text = {
                    { 'Gains {X:chips,C:white}X#1#{} Chips',
                        'per played {C:edition}#3#{} card,',
                        'removes its Edition',
                        '{stocking}before{}', },
                    { '{X:chips,C:white}X#2#{} Chips',
                        '{stocking}after{}', }
                }
            },
            ["J8-Bit_stocking_label_maker"] = {
                name = 'Label Maker',
                text = {
                    "Creates a random {C:attention}Tag",
                    "once per {C:attention}Ante"
                }
            },
            ["J8-Bit_stocking_water_cooler"] = {
                name = 'Water Cooler',
                text = {
                    "{C:inactive}(WIP)"
                }
            },
            ["J8-Bit_stocking_tech_x"] = {
                name = 'Tech X',
                text = {
                    "{C:inactive}(WIP)"
                }
            }
        },
        stocking_wrapped_present = {
            ["J8-Bit_stocking_present"] = {
                name = 'Mystery Sack',
                text = {
                    "{C:inactive}How'd he get this thing in here!?"
                }
            },
        }
        -- stocking_wrapped_present = {
        --     template_stocking_present = {
        --         name = '{V:1}Present',
        --         text = {
        --             '  {C:inactive}What could be inside?  ',
        --             '{C:inactive}Open me to find out!'
        --         }
        --     },

    }
}
