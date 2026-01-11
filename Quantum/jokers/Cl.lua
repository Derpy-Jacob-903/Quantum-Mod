
SMODS.Joker{ --Chlorine
    key = "Cl",
    config = {
        extra = {
            pb_bonus_3cc36649 = 25,
            pb_mult_60c8a4cd = 5
        }
    },
    loc_txt = {
        ['name'] = 'Chlorine',
        ['text'] = {
            [1] = 'Scored cards without any, {C:dark_edition}Edition,{}',
            [2] = '{C:enhanced}Enhancement{} and seal are scored:',
            [3] = 'randomize them and add a perm.',
            [4] = '25 Chips and 5 Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) and not (context.other_card.edition ~= nil) and not (context.other_card.seal ~= nil)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_quant_irradiated'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 25
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}