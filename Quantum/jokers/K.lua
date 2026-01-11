
SMODS.Joker{ --Potassium
    key = "K",
    config = {
        extra = {
            xmult0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Potassium',
        ['text'] = {
            [1] = '{C:dark_edition}Editionless{} cards give {X:mult,C:white}×1.25{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card.edition ~= nil) then
                return {
                    Xmult = 1.25
                }
            end
        end
    end
}