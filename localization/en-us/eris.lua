return {
    descriptions = {
        stocking_present = {
            Eris_stocking_evil_bomb = {
                name = "Evil Bomb",
                text = {
                    "Every {C:attention}#1# {C:inactive}(#2#){} played hands",
                    "{C:attention}destroys{} all played cards",
                    "{stocking}before"
                }
            },
            Eris_stocking_bananas = {
                name = "#4# Bananas",
                text = {
                    {"{C:mult}+#1#{} Mult"},
                    {
                        "Each individual {C:mult}Mult{} has a",
                        "{C:green}#2# in #3#{} chance to be lost",
                        "at the end of round",
                        "{stocking}before"
                    }
                }
            },
            Eris_stocking_prism = {
                name = "Prism",
                text = {
                    {
                        "Copies leftmost Joker",
                        "{stocking}before"
                    },
                    {
                        "Copies rightmost Joker",
                        "{stocking}after"
                    },
                    {
                        "Can only copy {C:blue}Common",
                        "and {C:green}Uncommon {C:attention}Jokers"
                    }
                }
            }
        }
    }
}