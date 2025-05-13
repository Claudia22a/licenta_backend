module LogEnums
  extend ActiveSupport::Concern

  included do
    enum feeding_type: {
      breastfeeding: 0,
      pumped_breastmilk: 1,
      formula: 2,
      mixed_feeding: 3,
      solid_food: 4,
      snack: 5,
      self_feeding: 6,
      tube_feeding: 7,
      other_feeding: 99
    }

    enum diaper_type: {
      wet: 0,
      dirty: 1,
      mixed: 2,
      blowout: 3,
      rash_check: 4,
      dry_check: 5,
      exploratory: 6,
      other_diaper: 99
    }

    enum sleep_type: {
      nap: 0,
      overnight: 1,
      early_nap: 2,
      late_nap: 3,
      contact_nap: 4,
      crib_nap: 5,
      stroller_nap: 6,
      car_nap: 7,
      rocked_sleep: 8,
      swing_sleep: 9,
      other_sleep: 99
    }

    enum walk_type: {
      stroller_walk: 0,
      carrier_walk: 1,
      indoor_walk: 2,
      outdoor_walk: 3,
      nature_walk: 4,
      errand_walk: 5,
      group_walk: 6,
      pet_walk: 7,
      short_walk: 8,
      long_walk: 9,
      other_walk: 99
    }

    enum tag_type: {
      growth_spurt: 0,
      vaccination_day: 1,
      sleep_regression: 2,
      teething: 3,
      travel_day: 4,
      first_solid: 5,
      checkup_day: 6,
      milestone: 7,
      other_tag: 99
    }

    enum symptom_type: {
      fever: 0,
      colic: 1,
      rash: 2,
      diarrhea: 3,
      teething_pain: 4,
      cough: 5,
      congestion: 6,
      vomiting: 7,
      gas: 8,
      reflux: 9,
      other_symptom: 99
    }
  end
end
