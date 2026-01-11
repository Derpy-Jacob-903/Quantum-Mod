
SMODS.Joker{ --Higgs
    key = "higgs",
    config = {
        extra = {
            xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Higgs',
        ['text'] = {
            [1] = 'The Myth The Legend THE G O D',
            [2] = 'HIGGS! The GOD Particle,',
            [3] = 'Multiplies Its Mult By its Mult,',
            [4] = 'EVERY ROUND. Starting xMult: 2',
            [5] = '(Current {X:red,C:white}X{} Mult: {X:mult,C:white}#1# {}',
                [6] = ''
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 5,
            y = 3
        },
        display_size = {
            w = 71 * 1, 
            h = 95 * 1
        },
        cost = 1,
        rarity = 4,
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
            
            return {vars = {card.ability.extra.xmult}}
        end,
        
        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                        card.ability.extra.xmult = (card.ability.extra.xmult) * card.ability.extra.xmult
                        return true
                    end
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    }