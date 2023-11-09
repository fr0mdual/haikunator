require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-", excluded_nouns: [], excluded_adjectives: [])
      build(token_range, delimiter, excluded_nouns: excluded_nouns, excluded_adjectives: excluded_adjectives)
    end

    private

    def build(token_range, delimiter, excluded_nouns: [], excluded_adjectives: [])
      filtered_adjectives = excluded_adjectives.any? ? adjectives.filter { |a| !excluded_adjectives.include?(a) } : adjectives
      filtered_nouns = excluded_nouns.any? ? nouns.filter { |n| !excluded_nouns.include?(n) } : nouns
      filtered_adjectives = adjectives if filtered_adjectives.empty?
      filtered_nouns = nouns if filtered_nouns.empty?

      sections = [
        filtered_adjectives[random_seed % filtered_adjectives.length],
        filtered_nouns[random_seed % filtered_nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w[
        abundant
        accomplished
        adorable
        adventurous
        affectionate
        aged
        alluring
        amazing
        ambitious
        ancient
        appreciative
        artistic
        astonishing
        attentive
        authentic
        autumn
        awesome
        balanced
        beautiful
        benevolent
        billowing
        bitter
        blessed
        blissful
        blithe
        blue
        bold
        bountiful
        brave
        breathtaking
        bright
        brilliant
        broken
        buoyant
        calm
        calming
        captivating
        caring
        celebrated
        charismatic
        charming
        cheerful
        chic
        classy
        clever
        cold
        collaborative
        comforting
        compassionate
        competent
        confident
        considerate
        cool
        courageous
        creative
        crimson
        cultured
        curious
        damp
        dark
        dashing
        dawn
        dazzling
        dedicated
        delicate
        delightful
        dependable
        determined
        devoted
        diligent
        disciplined
        divine
        dry
        dynamic
        eager
        earnest
        ecstatic
        efficient
        elegant
        eloquent
        empathetic
        empty
        enchanting
        energetic
        engaging
        enterprising
        enthusiastic
        exciting
        exhilarating
        experienced
        expressive
        exquisite
        extraordinary
        exuberant
        fabulous
        faithful
        falling
        fantastic
        fascinating
        fashionable
        fearless
        fierce
        flexible
        floral
        flourishing
        fortunate
        fragrant
        friendly
        frosty
        generous
        gentle
        genuine
        gleaming
        glorious
        glowing
        graceful
        gracious
        green
        handsome
        happy
        harmonious
        healthy
        heartwarming
        heavenly
        helpful
        heroic
        hidden
        holy
        honest
        honorable
        humble
        icy
        imaginative
        impressive
        incandescent
        inclusive
        incredible
        independent
        ingenious
        innovative
        inquisitive
        insightful
        inspiring
        intelligent
        intuitive
        invigorating
        invincible
        joyful
        joyous
        jubilant
        kind
        kindhearted
        knowledgeable
        late
        levitating
        lighthearted
        limitless
        lingering
        little
        lively
        long
        lovely
        loving
        loyal
        lucky
        luminous
        magnetic
        majestic
        marvelous
        mature
        melodic
        misty
        morning
        motivated
        muddy
        mystic
        nameless
        nurturing
        old
        optimistic
        organized
        outstanding
        passionate
        patient
        peaceful
        persistent
        playful
        polished
        polite
        positive
        precious
        productive
        professional
        progressive
        proud
        purple
        quiet
        radiant
        red
        reliable
        resilient
        resourceful
        respectful
        restless
        rough
        salty
        selfless
        sensible
        serene
        shy
        sincere
        skillful
        small
        smooth
        snowy
        sociable
        solitary
        sparkling
        spiritual
        splendid
        spring
        still
        strong
        summer
        supportive
        talented
        tenacious
        tender
        thoughtful
        thrumming
        transformative
        trustworthy
        twilight
        understanding
        unique
        uplifting
        urban
        valiant
        vibrant
        victorious
        visionary
        vivacious
        wandering
        weathered
        wild
        winter
        wise
        wispy
        withered
        witty
        wonderful
        young
        zealous
        zesty
      ]
    end

    def nouns
      %w[
        abundance
        acai
        accolade
        achievement
        adventure
        aptitude
        ascension
        awakening
        balance
        beach
        beauty
        benevolence
        bird
        biscuit
        blessing
        bliss
        blooming
        blossom
        breeze
        brilliance
        brook
        bush
        butterfly
        buzz
        cachet
        calm
        camel
        captivation
        cascade
        celebration
        charisma
        cherry
        chocolate
        clarity
        cloud
        coffee
        collaboration
        compassion
        connectivity
        contentment
        cookie
        courage
        creativity
        curiosity
        dandelion
        dawn
        deer
        delicacy
        delight
        desert
        determination
        dew
        discovery
        dream
        dust
        earth
        elation
        elevation
        elixir
        eloquence
        embrace
        empathy
        enchantment
        enclave
        encouragement
        endurance
        energy
        enlightenment
        enrichment
        enthusiasm
        entrancement
        epiphany
        epitome
        essence
        eternity
        euphoria
        excitement
        exhilaration
        exploration
        extraordinaire
        extravaganza
        exultation
        faith
        feast
        feather
        field
        fire
        firefly
        flamingo
        flourish
        flower
        fog
        forest
        forgiveness
        fox
        friend
        friendship
        frog
        frost
        fulfillment
        generosity
        gift
        glade
        glitter
        goodness
        grace
        grass
        gratefulness
        gratitude
        growth
        happiness
        harmony
        haven
        haze
        healing
        hearth
        hill
        honesty
        honey
        hope
        illumination
        imagination
        immersion
        impression
        indulgence
        infinity
        infusion
        innovation
        inspiration
        integrity
        island
        joy
        joyfulness
        jubilation
        jubilee
        jungle
        kindness
        kindred
        knowledge
        koala
        lake
        laughter
        lavishness
        leaf
        legacy
        log
        love
        lullaby
        lushness
        luxuriance
        magic
        marvel
        meadow
        meander
        melody
        mindfulness
        miracle
        momentum
        moon
        morning
        motivation
        mountain
        muse
        music
        night
        nirvana
        nourishment
        oasis
        ocean
        optimism
        opulence
        otter
        owl
        painting
        panache
        pancake
        paper
        paradigm
        passion
        patience
        peace
        perfection
        perseverance
        petal
        phenomenon
        pine
        pinnacle
        pizzazz
        plains
        platypus
        playfulness
        pond
        pop
        positivity
        presence
        progress
        prosperity
        quintessence
        radiance
        rain
        rainbow
        reflection
        refreshment
        regeneration
        rejuvenation
        relish
        renewal
        resilience
        resonance
        restoration
        retreat
        revelation
        reverence
        revitalization
        rhapsody
        river
        sanctuary
        satisfaction
        savor
        sea
        sensation
        serenade
        serendipity
        serenity
        shadow
        shape
        silence
        sky
        smile
        smoke
        smoothie
        snail
        snow
        snowflake
        soaring
        sound
        soup
        sparkle
        spirit
        splendor
        sprinkles
        star
        stillness
        success
        sun
        sunset
        supernova
        support
        supremacy
        surf
        sweetness
        symphony
        synergy
        talent
        tea
        tenacity
        thrill
        thunder
        tiramisu
        tranquility
        transcendence
        transformation
        treasure
        tree
        triumph
        understanding
        unity
        upliftment
        utopia
        valley
        vegemite
        venture
        vibrance
        victory
        violet
        vision
        vitality
        vivacity
        voice
        wallaby
        wanderlust
        warmth
        water
        waterfall
        wave
        whimsey
        whirl
        whisper
        whiz
        wholeness
        wildflower
        wind
        wisdom
        wonder
        wonderment
        yearning
        zeal
        zest
        zing
      ]
    end
  end
end
