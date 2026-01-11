
SMODS.Joker{ --Electromagnetism
    key = "electromagnetism",
    config = {
        extra = {
            emult0 = 1.37
        }
    },
    loc_txt = {
        ['name'] = 'Electromagnetism',
        ['text'] = {
            [1] = 'applies ^1.37 Mult',
            [2] = '{C:white}Psst, this is a reference{}',
            [3] = '{C:white}To the fact that 137 is{}',
            [4] = '{C:white}the fine constant num.{}',
            [5] = 'oh and btw you need',
            [6] = 'the Talsiman mod for',
        [7] = 'this to work ;)'
    },
    ['unlock'] = {
        [1] = 'Unlocked by default.'
    }
},
pos = {
    x = 6,
    y = 3
},
display_size = {
    w = 71 * 1, 
    h = 95 * 1
},
cost = 15,
rarity = 3,
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
unlocked = true,
discovered = false,
atlas = 'CustomJokers',
pools = { ["quant_quant_jokers"] = true },

calculate = function(self, card, context)
    if context.other_joker  then
        return {
            e_mult = 1.37
        }
    end
end
}