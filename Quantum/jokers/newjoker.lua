
SMODS.Joker{ --New Joker
    key = "newjoker",
    config = {
        extra = {
            permchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'New Joker',
        ['text'] = {
            [1] = 'Gains perm Chips based',
            [2] = 'on hand strength.',
            [3] = 'Current {C:blue}Chips{}:',
            [4] = '{C:blue}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.permchips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 2
            elseif context.scoring_name == "Pair" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 3
            elseif context.scoring_name == "Two Pair" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 5
            elseif context.scoring_name == "Three of a Kind" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 7
            elseif context.scoring_name == "Straight" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 10
            elseif context.scoring_name == "Flush" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 10
            elseif context.scoring_name == "Full House" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 12
            elseif context.scoring_name == "Four of a Kind" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 14
            elseif context.scoring_name == "Five of a Kind" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 25
            elseif context.scoring_name == "Straight Flush" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 35
            elseif context.scoring_name == "Flush House" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 34
            elseif context.scoring_name == "Flush Five" then
                card.ability.extra.permchips = (card.ability.extra.permchips) + 32
            else
                return {
                    chips = card.ability.extra.permchips
                }
            end
        end
    end
}